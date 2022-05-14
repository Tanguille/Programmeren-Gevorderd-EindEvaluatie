using System;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        private FitnessCentrum _fitnessCentrum;
        private Klant _klant;
        private IKlantRepo _klantRepo;
        private IReservationRepo _reservationRepo;
        private IToestellenRepo _toestellenRepo;

        public DomeinController(IKlantRepo klantRepo, IReservationRepo reservationRepo, IToestellenRepo toestellenRepo) {
            _klantRepo = klantRepo;
            _reservationRepo = reservationRepo;
            _toestellenRepo = toestellenRepo;
        }

        public Klant SelecteerKlantData(string identificatieString) {
            Klant klant = _klantRepo.SelecteerKlantData(identificatieString);
            AangemeldeKlant = klant;
            return AangemeldeKlant;
        }

        public FitnessToestel SelecteerToestelData(int? toestelID, string toestelType) {
            FitnessToestel toestel = _toestellenRepo.SelecteerToestelData(toestelID, toestelType);
            return toestel;
        }

        public void ZetReservatieInDB(Reservatie reservatie) {
            _reservationRepo.ZetReservatieInDB(reservatie);
        }

        public void MaakReservatie(DateTime dag, Klant klant, FitnessToestel fitnessToestel, int beginSlot, int aantalSlots) {
            throw new NotImplementedException();
        }
    }
}
