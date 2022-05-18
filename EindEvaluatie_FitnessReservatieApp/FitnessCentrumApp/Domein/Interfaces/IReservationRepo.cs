using System.Collections.Generic;

namespace Domein {
    public interface IReservationRepo {
        public List<Reservatie> GeefReservaties(int klantNummer);
        public void ZetReservatieInDB(Reservatie reservatie);
    }
}
