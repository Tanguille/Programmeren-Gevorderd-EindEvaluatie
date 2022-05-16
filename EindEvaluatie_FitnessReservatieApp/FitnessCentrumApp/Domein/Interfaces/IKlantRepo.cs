namespace Domein {
    public interface IKlantRepo {
        Klant SelecteerKlantData(string identificatieString);
        void KlantenDataInDatabank();

    }
}
