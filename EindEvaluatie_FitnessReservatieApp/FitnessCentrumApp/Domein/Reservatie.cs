using System;

namespace Domein {
    public class Reservatie {
        public int ReservatieNummer { get; } //Moet door systeem aangemaakt worden
        public Klant Klant { get; }
        public FitnessToestel GereserveerdToestel { get; private set; }
        public DateTime Datum { get; private set; }
        public int BeginSlot { get; private set; }
        public int AantalSlots { get; private set; } //max 2        

        public Reservatie(int reservatieNummer, DateTime datum, Klant klant, FitnessToestel gereserveerdToestel, int beginSlot, int aantalSlots)
            : this(datum, klant, gereserveerdToestel, beginSlot, aantalSlots) {
            ReservatieNummer = reservatieNummer;
        }

        public Reservatie(DateTime datum, Klant klant, FitnessToestel gereserveerdToestel, int beginSlot, int aantalSlots) {
            Klant = klant;
            Datum = datum;
            GereserveerdToestel = gereserveerdToestel;
            BeginSlot = beginSlot;

            if (aantalSlots < 1 || aantalSlots > 2) {
                throw new ArgumentOutOfRangeException("De waarde voor aantal slots is verkeerd ingevoerd.");
            }
            else {
                AantalSlots = aantalSlots;
            }
        }

        public override string ToString() {
            return $"{ReservatieNummer} {Datum.Day} {GereserveerdToestel} {BeginSlot} {AantalSlots}";
        }

        public Reservatie MaakReservatie(DateTime dag, Klant klant, FitnessToestel fitnessToestel, int beginSlot, int aantalSlots) {
            Reservatie reservatie = new Reservatie(dag, klant, fitnessToestel, beginSlot, aantalSlots);
            return reservatie;
        }
    }
}
