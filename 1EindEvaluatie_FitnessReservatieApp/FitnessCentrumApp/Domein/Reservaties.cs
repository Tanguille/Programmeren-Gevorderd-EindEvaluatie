using System;

namespace Domein {
    public class Reservaties {
        public int ReservatieNummer { get; } //Moet door systeem aangemaakt worden
        public Klant Klant { get; }
        public DateTime Datum { get; private set; }
        public FitnessToestel GereserveerdToestel { get; private set; }
        public int BeginSlot { get; private set; }
        public int AantalSlots { get; private set; } //max 2

        public Reservaties(DateTime datum, Klant klant, FitnessToestel gereserveerdToestel, int reservatieNummer, int beginSlot, int aantalSlots) {
            Klant = klant;
            Datum = datum;
            GereserveerdToestel = gereserveerdToestel;
            ReservatieNummer += 1;
            BeginSlot = beginSlot;

            if (aantalSlots < 1 || aantalSlots > 2) {
                throw new ArgumentOutOfRangeException("De waarde voor aantal slots is verkeerd ingevoerd.");
            }
            else {
                AantalSlots = aantalSlots;
            }
        }

        public void MaakReservatie(DateTime dag, int slot, FitnessToestel toestel) {
            throw new System.NotImplementedException("Not implemented");
        }
    }
}
