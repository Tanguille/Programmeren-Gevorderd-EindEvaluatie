using System;

namespace Domein {
    public abstract class FitnessToestel : IEquatable<FitnessToestel> {
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

        public bool Equals(FitnessToestel other) {
            return ToString() == other.ToString();
        }
    }
}
