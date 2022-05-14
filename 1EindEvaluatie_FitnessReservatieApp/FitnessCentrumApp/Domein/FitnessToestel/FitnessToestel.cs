namespace Domein {
    public abstract class FitnessToestel {
        public int ToestelID { get; } //Moet door systeem aangemaakt worden
        private const int slots = 14; //slots per dag
        public EToestelStatus ToestelStatus { get; private set; }
        public EKlantType KlantType { get; private set; }

        protected FitnessToestel(int toestelID) {
            ToestelID = toestelID;
        }

        protected FitnessToestel(int toestelID, EToestelStatus toestelStatus) {
            ToestelID = toestelID;
            ToestelStatus = toestelStatus;
        }

    }
}
