using Domein.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        public FitnessToestel GeselecteerdToestel { get; private set; }
        public List<Reservatie> GemaakteReservaties { get; private set; }
        public List<FitnessToestel> Toestellen { get; private set; }

        private IKlantRepo _klantRepo;
        private IReservationRepo _reservationRepo;
        private IToestelRepo _toestelRepo;
        private FitnessCentrum _fitnessCentrum = new();

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
            List<Reservatie> reservaties = _reservationRepo.GeefReservatiesOpKlantNummer(AangemeldeKlant.KlantNummer);
            if (reservaties.Count < 1) {
                aantalTijdSlotsVandaag = 0;
            }
            else {
                List<Reservatie> reservatiesOpReservatieDag = reservaties.Where(r => r.Datum.Date == dag.Date).ToList();

                foreach (Reservatie r in reservatiesOpReservatieDag) {
                    aantalTijdSlotsVandaag += r.AantalSlots;
                }
            }
            if ((aantalTijdSlotsVandaag + aantalSlots) < 4
                && _fitnessCentrum.OpeningsUrenValid(beginSlot, aantalSlots)
                && _fitnessCentrum.ReservatieDagValid(dag, beginSlot)) {
                FitnessToestel toestel = ToestelSelector(dag, beginSlot, aantalSlots, geselecteerdToestel);

                //Aanmaken reservatie            
                _reservationRepo.MaakReservatie(dag, AangemeldeKlant, toestel, beginSlot, aantalSlots);
            }
            else if ((aantalTijdSlotsVandaag + aantalSlots) > 4) {
                throw new ReserveerException("U kan max 4 uur per dag bij ons trainen. Onze excuses voor dit ongemak.");
            }
            else {
                throw new ReserveerException("U heeft mogelijks een waarde fout ingevoerd. Probeer opnieuw");
            }
        }

        public FitnessToestel ToestelSelector(DateTime dag, int beginSlot, int aantalSlots, string toestelType) {
            List<FitnessToestel> toestellen = _toestelRepo.GeefToestellen(toestelType);
            List<Reservatie> reservatiesVanafVandaag = _reservationRepo.GeefReservatiesVanafVandaag();

            foreach (FitnessToestel t in toestellen) {
                List<Reservatie> reservatiesOpGewenstTijdslot = reservatiesVanafVandaag.Where(r => r.GereserveerdToestel.Equals(t)).ToList();
                reservatiesOpGewenstTijdslot = reservatiesOpGewenstTijdslot.Where(r => r.Datum.Date == dag.Date).ToList();
                reservatiesOpGewenstTijdslot = reservatiesOpGewenstTijdslot.Where(r => r.BeginSlot == beginSlot).ToList();

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

        public void VeranderToestelStatus(int iD, string ToestelStatus) {
            _toestelRepo.VeranderToestelStatus(iD, ToestelStatus);
        }

        public List<string[]> ReservatiesToString() {
            GemaakteReservaties = _reservationRepo.GeefReservatiesOpKlantNummer(AangemeldeKlant.KlantNummer);
            List<String[]> reservaties = new();
            foreach (Reservatie r in GemaakteReservaties) {
                string[] reservatieStrings = new string[5];
                reservatieStrings[0] = r.ReservatieNummer.ToString();
                reservatieStrings[1] = r.Datum.ToString("dd/MM/yyyy");
                reservatieStrings[2] = r.GereserveerdToestel.ToestelID.ToString();
                reservatieStrings[3] = r.BeginSlot.ToString();
                reservatieStrings[4] = r.AantalSlots.ToString();
                reservaties.Add(reservatieStrings);
            }
            return reservaties;
        }

        public List<string[]> ToestellenToString() {
            Toestellen = _toestelRepo.GeefToestellen();
            List<string[]> toestellen = new();
            foreach (FitnessToestel t in Toestellen) {
                string[] toestelString = new string[3];
                toestelString[0] = t.ToestelID.ToString();
                toestelString[1] = t.GetType().Name.ToString();
                toestelString[2] = t.ToestelStatus.ToString();
                toestellen.Add(toestelString);
            }
            return toestellen;
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
