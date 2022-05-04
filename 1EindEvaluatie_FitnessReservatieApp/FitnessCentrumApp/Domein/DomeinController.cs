namespace Domein {
    public class DomeinController {
        public Klant AangemeldeKlant { get; private set; }
        private FitnessCentrum _fitnessCentrum;
        private Klant _klant;
        private IKlantRepo _klantRepo;
        public void KlantIdentificeren(string identificatieString) {
            _klant.KlantIdentificeren(identificatieString);
        }

        public void KlantSelecteren(int klantNummer, string emailAdres) {
            _klantRepo.SelecteerKlantData(klantNummer, emailAdres);
        }
    }
}
