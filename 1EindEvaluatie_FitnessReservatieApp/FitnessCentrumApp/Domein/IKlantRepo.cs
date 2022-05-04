namespace Domein {
    public interface IKlantRepo {
        public Klant SelecteerKlantData(int? klantNummer, string emailAdres);        
    }
}
