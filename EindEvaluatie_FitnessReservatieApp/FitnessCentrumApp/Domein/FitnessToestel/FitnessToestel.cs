namespace Domein {
    public abstract class FitnessToestel {
        public int ToestelID { get; } //Moet door systeem aangemaakt worden
        public EToestelStatus ToestelStatus { get; private set; }


        protected FitnessToestel(int toestelID) {
            ToestelID = toestelID;
        }

        protected FitnessToestel(int toestelID, EToestelStatus toestelStatus) {
            ToestelID = toestelID;
            ToestelStatus = toestelStatus;
        }

        public override string ToString() {
            return $"{GetType().Name} met ID {ToestelID}.";
        }
    }
}
