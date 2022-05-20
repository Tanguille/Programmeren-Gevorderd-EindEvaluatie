using Domein.Exceptions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Domein.Tests {
    [TestClass()]
    public class ReservatieTests {
        private Klant _klant;
        private FitnessToestel _fitnessToestel;
        private Reservatie _reservatie;

        [TestInitialize()]
        public void Init() {
            _klant = new("Tanguille@hotmail.be", "Tanguille", "Grootaert", "Schoolstraat 25", new DateTime(01 / 09 / 1999), "pcs", EKlantType.GOLD);
            _fitnessToestel = new Fiets(1);
            _reservatie = new(new DateTime(02 / 08 / 2022), _klant, _fitnessToestel, 12, 1);
        }

        [TestMethod()]
        public void ReservatieTest() {
            Assert.Fail();
        }

        [TestMethod()]
        //[DataRow(DateTime.Today.AddDays(9), 10, 2)]
        //[DataRow(DateTime.Today.AddDays(-2), )]
        public void MaakReservatieTest(DateTime dag, int beginSlot, int aantalSlots) => Assert.ThrowsException<ReserveerException>(() => _reservatie.MaakReservatie(dag, _klant, _fitnessToestel, beginSlot, aantalSlots));
    }
}