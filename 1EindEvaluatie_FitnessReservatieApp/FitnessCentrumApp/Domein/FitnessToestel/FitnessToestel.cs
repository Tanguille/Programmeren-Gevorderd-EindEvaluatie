namespace Domein {
    public abstract class FitnessToestel {
        public int ToestelID { get; } //Moet door systeem aangemaakt worden
        private const int slots = 14; //slots per dag        

        protected FitnessToestel(int toestelID) {
            ToestelID = toestelID;
        }
    }
}
