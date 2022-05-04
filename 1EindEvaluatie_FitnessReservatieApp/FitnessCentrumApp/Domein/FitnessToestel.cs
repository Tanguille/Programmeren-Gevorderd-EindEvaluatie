namespace Domein {

    public abstract class FitnessToestel {
        public int ID { get; } //Moet door systeem aangemaakt worden
        private const int slots = 14; //slots per dag
        public bool Beschikbaar { get; private set; }

        protected FitnessToestel(int iD, bool beschikbaar) {
            ID = iD;
            Beschikbaar = beschikbaar;
        }
        protected FitnessToestel(int iD) : base() {
            ID = iD;
        }
    }
}
