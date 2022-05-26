using Domein;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DomeinTests {
    public class TestReservatieRepo : IReservationRepo {
        public List<Reservatie> reservaties = new();
        private readonly TestKlantRepo _testKlantRepo = new();
        private readonly TestToestelRepo _testToestelRepo = new();

        public List<Reservatie> ReservatiesVoorTesten() {
            Klant klant = _testKlantRepo.SelecteerKlantData(2.ToString());
            Fiets fiets = (Fiets)_testToestelRepo.SelecteerToestelData(null, "fiets");
            Loopband loopband = (Loopband)_testToestelRepo.SelecteerToestelData(null, "loopband");

            reservaties.Add(new Reservatie(DateTime.Today.AddDays(1), klant, fiets, 12, 2));
            reservaties.Add(new Reservatie(DateTime.Today.AddDays(1), klant, loopband, 16, 2));

            return reservaties;
        }

        public List<Reservatie> GeefReservatiesOpKlantNummer(int klantNummer) {
            Klant klant = _testKlantRepo.SelecteerKlantData(klantNummer.ToString());

            return reservaties.Where(r => r.Klant == klant).ToList();
        }

        public List<Reservatie> GeefReservatiesVanafVandaag() {
            return reservaties.Where(r => r.Datum > DateTime.Today).ToList();
        }

        public void MaakReservatie(DateTime dag, Klant klant, FitnessToestel fitnessToestel, int beginSlot, int aantalSlots) {
            Reservatie reservatie = new(dag, klant, fitnessToestel, beginSlot, aantalSlots);
            reservaties.Add(reservatie);
        }
    }
}
