using Domein;
using System;
using System.IO;

namespace Persistentie {
    public class ReservationRepo : IReservationRepo {

        /// <summary>
        /// Maakt reservatie en stuurt dit naar file
        /// </summary>
        /// <param name="fitnessToestel"></param>
        /// <param name="dag"></param>
        /// <param name="tijdSlot"></param>
        /// <param name="duur"></param>
        public void MaakReservatie(FitnessToestel fitnessToestel, DateTime dag, int tijdSlot, int duur, Klant klantNummer) {

            using StreamWriter sw = new StreamWriter("Reservaties.csv");

        }
    }
}
