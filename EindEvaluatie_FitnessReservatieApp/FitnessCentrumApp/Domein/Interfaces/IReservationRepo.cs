using System.Collections.Generic;

namespace Domein {
    public interface IReservationRepo {
        public List<Reservatie> GeefReservatiesVanafVandaag();
        public List<Reservatie> GeefReservatiesOpKlantNummer(int klantNummer);
        public void ZetReservatieInDB(Reservatie Reservatie);
    }
}
