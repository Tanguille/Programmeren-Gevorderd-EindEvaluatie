using Domein.Exceptions;
using System;

namespace Domein {
    public class Reservatie {
        public int ReservatieNummer { get; } //Moet door systeem aangemaakt worden
        public Klant Klant { get; }
        public FitnessToestel GereserveerdToestel { get; private set; }
        public DateTime Datum { get; private set; }

        //Max 2 slots per Reservatie
        private int _aantalSlots;
        public int AantalSlots {
            get => _aantalSlots;
            private set {
                if (value > 0 && value < 3) {
                    _aantalSlots = value;
                }
                else {
                    throw new ReserveerException("De waarde voor aantal slots is verkeerd ingevoerd.");
                }
            }
        }

        //Openingsuren afdwingen, aangevuld in domeincontroller door OpeningsUrenValid
        private int _beginSlot;
        public int BeginSlot {
            get => _beginSlot;
            private set {
                if (value < 23 && value > 7) {
                    _beginSlot = value;
                }
                else {
                    throw new ReserveerException("Ons fitnesscentrum is jammergenoeg slechts van 8u tot 22u open.");
                }
            }
        }

        public Reservatie(int reservatieNummer, DateTime datum, Klant klant, FitnessToestel gereserveerdToestel, int beginSlot, int aantalSlots)
           : this(datum, klant, gereserveerdToestel, beginSlot, aantalSlots) {
            ReservatieNummer = reservatieNummer;
        }

        public Reservatie(DateTime datum, Klant klant, FitnessToestel gereserveerdToestel, int beginSlot, int aantalSlots) {
            Klant = klant;
            Datum = datum;
            GereserveerdToestel = gereserveerdToestel;
            BeginSlot = beginSlot;
            AantalSlots = aantalSlots;
        }

        public override string ToString() {
            return $"{ReservatieNummer} {Datum.Day} {GereserveerdToestel} {BeginSlot} {AantalSlots}";
        }
    }
}
