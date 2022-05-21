using Domein.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        public FitnessToestel GeselecteerdToestel { get; private set; }
        public List<Reservatie> GemaakteReservaties { get; private set; }

        private IKlantRepo _klantRepo;
        private IReservationRepo _reservationRepo;
        private IToestelRepo _toestelRepo;

        public DomeinController(IKlantRepo klantRepo, IReservationRepo reservationRepo, IToestelRepo toestellenRepo) {
            _klantRepo = klantRepo;
            _reservationRepo = reservationRepo;
            _toestelRepo = toestellenRepo;
        }

        public int SelecteerKlantData(string identificatieString) {
            AangemeldeKlant = _klantRepo.SelecteerKlantData(identificatieString);

            return AangemeldeKlant.KlantNummer;
        }

        public int SelecteerToestelData(int? toestelID, string toestelType) {
            GeselecteerdToestel = _toestelRepo.SelecteerToestelData(toestelID, toestelType);
            return GeselecteerdToestel.ToestelID;
        }

        public void MaakReservatie(DateTime dag, int beginSlot, int aantalSlots, string geselecteerdToestel) {
            //Checken aantal gebruikte tijdslots
            int aantalTijdSlotsVandaag = new();
            List<Reservatie> Reservaties = _reservationRepo.GeefReservatiesOpKlantNummer(AangemeldeKlant.KlantNummer);
            List<Reservatie> ReservatiesOpReservatieDag = Reservaties.Where(r => r.Datum.Date == dag.Date).ToList();

            FitnessToestel toestel = ToestelSelector(dag, beginSlot, aantalSlots, geselecteerdToestel);

            foreach (Reservatie r in ReservatiesOpReservatieDag) {
                aantalTijdSlotsVandaag += r.AantalSlots;
            }

            if ((aantalTijdSlotsVandaag + aantalSlots) < 4) {
                //Aanmaken reservatie
                Reservatie reservatie = new(dag, AangemeldeKlant, toestel, beginSlot, aantalSlots);
                _reservationRepo.ZetReservatieInDB(reservatie);
            }
            else {
                throw new ReserveerException("U kan max 4 uur per dag bij ons trainen. Onze excuses voor dit ongemak.");
            }
        }

        public FitnessToestel ToestelSelector(DateTime dag, int beginSlot, int aantalSlots, string toestelType) {
            List<FitnessToestel> toestellen = _toestelRepo.GeefToestellen();
            List<Reservatie> reservatiesVanafVandaag = _reservationRepo.GeefReservatiesVanafVandaag();
            //HACK: Dit fiksen

            foreach (FitnessToestel t in toestellen) {
                List<Reservatie> reservatiesOpGewenstTijdslot = reservatiesVanafVandaag
                    .Where(r => r.Datum.Date == dag.Date)
                    .Where(r => r.BeginSlot == beginSlot)
                    .Where(r => r.GereserveerdToestel == t).ToList();

                //Ervoor zorgen dat toestel 2 slots vrij is
                if (aantalSlots == 2) {
                    reservatiesOpGewenstTijdslot = reservatiesOpGewenstTijdslot
                        .Where(r => r.BeginSlot == beginSlot + 1).ToList();
                }

                //Indien toestel vrij is returnen
                if (!reservatiesOpGewenstTijdslot.Any()) {
                    return t;
                }
            }
            throw new FitnessToestelException();
        }

        public bool IsBeheerder() {
            if (AangemeldeKlant.EmailAdres == "beheerder@tangfit.be") {
                return true;
            }
            else {
                return false;
            }
        }

        public List<string[]> ReservatiesToString() {
            GemaakteReservaties = _reservationRepo.GeefReservatiesOpKlantNummer(AangemeldeKlant.KlantNummer);
            List<String[]> Reservaties = new();
            foreach (Reservatie Reservatie in GemaakteReservaties) {
                string[] ReservatieStrings = new string[5];
                ReservatieStrings[0] = Reservatie.ReservatieNummer.ToString();
                ReservatieStrings[1] = Reservatie.Datum.ToString("dd/MM/yyyy");
                ReservatieStrings[2] = Reservatie.GereserveerdToestel.ToestelID.ToString();
                ReservatieStrings[3] = Reservatie.BeginSlot.ToString();
                ReservatieStrings[4] = Reservatie.AantalSlots.ToString();
                Reservaties.Add(ReservatieStrings);
            }
            return Reservaties;
        }

        public string[] ToestelToString() {
            string[] toestelStrings;
            toestelStrings = GeselecteerdToestel.ToString().Split(' ');
            return toestelStrings;
        }

        public string KlantToString() {
            return AangemeldeKlant.ToString();
        }
    }
}
