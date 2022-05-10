namespace Domein {
    public interface IKlantRepo {
        public Klant SelecteerKlantData(int? _klantNummer, string _emailAdres);
        public void KlantenDataInDatabank();
    }
}
