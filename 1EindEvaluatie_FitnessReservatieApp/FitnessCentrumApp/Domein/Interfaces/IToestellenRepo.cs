namespace Domein {
    public interface IToestellenRepo {
        FitnessToestel SelecteerToestelData(int? _toestelID, string _toestelType);
        public void ToestellenDataInDatabank();
        public void VeranderToestelStatus(int iD, string toestelStatus);
    }
}
