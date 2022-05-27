using Domein.Exceptions;
using System;

namespace Domein {
    public static class FitnessCentrum {
        /// <summary>
        /// Checkt of reservatie binnen openingsuren valt vooraleer ze goedgekeurd wordt
        /// </summary>
        /// <param name="beginSlot"></param>
        /// <param name="aantalSlots"></param>
        /// <returns></returns>
        /// <exception cref="ReserveerException"></exception>
        public static bool OpeningsUrenValid(int beginSlot, int aantalSlots) {
            if ((beginSlot + aantalSlots) < 23 && beginSlot > 7) {
                return true;
            }
            else {
                return false;
                throw new ReserveerException("Ons fitnesscentrum is jammergenoeg slechts van 8u tot 22u open.");
            }
        }

        /// <summary>
        /// Checkt of reservatie niet in verleden of meer dan 7 dagen in de toekomst gemaakt wordt.
        /// </summary>
        /// <param name="reservatieDag"></param>
        /// <returns></returns>
        /// <exception cref="ReserveerException"></exception>
        public static bool ReservatieDagValid(DateTime reservatieDag, int beginSlot) {
            if (reservatieDag < DateTime.Today.AddDays(8) && reservatieDag > DateTime.Today) {
                return true;
            }
            else if (reservatieDag == DateTime.Today && beginSlot >= DateTime.Now.Hour) {
                return true;
            }
            else {
                return false;
                throw new ReserveerException("U kan bij ons jammergenoeg slechts 7 dagen op voorhand reserveren.");
            }
        }
    }
}

