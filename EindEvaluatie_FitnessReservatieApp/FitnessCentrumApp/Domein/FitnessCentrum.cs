using Domein.Exceptions;

namespace Domein {
    public class FitnessCentrum {
        /// <summary>
        /// Checkt of reservatie binnen openingsuren valt vooraleer ze goedgekeurd wordt
        /// </summary>
        /// <param name="beginSlot"></param>
        /// <param name="aantalSlots"></param>
        /// <returns></returns>
        /// <exception cref="ReserveerException"></exception>
        public bool OpeningsUrenValid(int beginSlot, int aantalSlots) {
            if ((beginSlot + aantalSlots) < 23 && beginSlot > 8) {
                return true;
            }
            else {
                return false;
                throw new ReserveerException("Ons fitnesscentrum is jammergenoeg slechts van 8u tot 22u open.");
            }
        }
    }
}

