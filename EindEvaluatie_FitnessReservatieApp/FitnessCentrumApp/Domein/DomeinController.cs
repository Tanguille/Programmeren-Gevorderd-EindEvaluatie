using System;
using System.Collections.Generic;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        public FitnessToestel GeselecteerdToestel { get; private set; }
        public List<Reservatie> GemaakteReservaties { get; private set; }
        private FitnessCentrum _fitnessCentrum;
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

        public void MaakReservatie(DateTime dag, int toestelID, int beginSlot, int aantalSlots) {
            FitnessToestel toestel = _toestelRepo.SelecteerToestelData(toestelID, "");
            Reservatie reservatie = new(dag, AangemeldeKlant, toestel, beginSlot, aantalSlots);

            _reservationRepo.ZetReservatieInDB(reservatie);
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
            GemaakteReservaties = _reservationRepo.GeefReservaties(AangemeldeKlant.KlantNummer);
            List<String[]> reservaties = new();
            foreach (Reservatie reservatie in GemaakteReservaties) {
                string[] reservatieStrings = new string[5];
                reservatieStrings[0] = reservatie.ReservatieNummer.ToString();
                reservatieStrings[1] = reservatie.Datum.ToString("dd/MM/yyyy");
                reservatieStrings[2] = reservatie.GereserveerdToestel.ToestelID.ToString();
                reservatieStrings[3] = reservatie.BeginSlot.ToString();
                reservatieStrings[4] = reservatie.AantalSlots.ToString();
                reservaties.Add(reservatieStrings);
            }
            return reservaties;
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
