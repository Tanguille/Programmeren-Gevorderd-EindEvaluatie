using System;

namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        private FitnessCentrum _fitnessCentrum;
        private Klant _klant;
        private IKlantRepo _klantRepo;
        private IReservationRepo _reservationRepo;

        public void KlantIdentificeren(string identificatieString) {
            _klant.KlantIdentificeren(identificatieString);
        }

        public void SelecteerKlantData(int klantNummer, string emailAdres) {
            _klantRepo.SelecteerKlantData(klantNummer, emailAdres);
        }

        public void ZetReservatieInDB(Reservatie reservatie) {
            _reservationRepo.ZetReservatieInDB(reservatie);
        }

        public void MaakReservatie(DateTime dag, Klant klant, FitnessToestel fitnessToestel, int beginSlot, int aantalSlots) {
            throw new NotImplementedException();
        }
    }
}
