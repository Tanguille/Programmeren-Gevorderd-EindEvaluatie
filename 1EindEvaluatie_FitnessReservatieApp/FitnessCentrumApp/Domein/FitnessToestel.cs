namespace Domein {

    public abstract class FitnessToestel {
        public int ToestelID { get; } //Moet door systeem aangemaakt worden
        private const int slots = 14; //slots per dag
        public bool Beschikbaar { get; private set; }

        protected FitnessToestel(int toestelID, bool beschikbaar) {
            ToestelID = toestelID;
            Beschikbaar = beschikbaar;
        }
    }
}
