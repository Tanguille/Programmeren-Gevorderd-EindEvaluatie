namespace Domein {
    public class Fiets : FitnessToestel {
        public Fiets(int toestelID) : base(toestelID) {
        }

        public Fiets(int iD, EToestelStatus toestelStatus) : base(iD, toestelStatus) {
        }
    }
}
