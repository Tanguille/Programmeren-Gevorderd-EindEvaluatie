namespace Domein {
    public interface IReservationRepo {
        public Reservatie SelecteerReservaties(int klantNummer);
        public void ZetReservatieInDB(Reservatie reservatie);
    }
}
