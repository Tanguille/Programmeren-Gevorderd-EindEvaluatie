using System;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        private FitnessCentrum _fitnessCentrum;
        private Klant _klant;
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

        public string GetKlantNaam() {
            return $"{AangemeldeKlant.VoorNaam} {AangemeldeKlant.AchterNaam}";
        }

        public int SelecteerToestelData(int? toestelID, string toestelType) {
            FitnessToestel toestel = _toestelRepo.SelecteerToestelData(toestelID, toestelType);
            return toestel.ToestelID;
            //ToString method: $"{toestel.GetType().Name}: {toestel.ToestelID}";
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
    }
}
