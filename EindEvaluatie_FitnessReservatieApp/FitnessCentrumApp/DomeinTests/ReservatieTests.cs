using Domein.Exceptions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Domein.Tests {
    [TestClass()]
    public class FitnessToestelTests {
        private Klant _klant;
        private FitnessToestel _fitnessToestel;
        private Reservatie _reservatie;

        [TestInitialize()]
        public void Init() {
            _klant = new("TanGuille@hotmail.be", "TanGuille", "Grootaert", "Schoolstraat 25", new DateTime(01 / 09 / 1999), "pcs", EKlantType.GOLD);
            _fitnessToestel = new Fiets(1);
            _reservatie = new(DateTime.Today, _klant, _fitnessToestel, 12, 1);
        }

        [TestMethod()]
        //Test op datum
        [DataRow(8)]
        [DataRow(-2)]
        public void MaakFitnessToestelTest_DatumException(int dagIndex) {
            Assert.ThrowsException<ReserveerException>(() => _reservatie.MaakReservatie(DateTime.Today.AddDays(dagIndex), _klant, _fitnessToestel, 10, 2));
        }

        //[TestMethod()]
        ////Test op datum
        //[DataRow(7, true)]
        //[DataRow(0, true)]
        //public void MaakFitnessToestelTest_DatumNOException(int dagIndex, bool expected) {
        //    Assert.AreEqual(expected, _reservatie.MaakReservatie(DateTime.Today.AddDays(dagIndex), _klant, _fitnessToestel, 10, 2));
        //}



        [TestMethod()]
        //Testen op openingsuren, aangevuld in domeincontroller door OpeningsUrenValid
        [DataRow(7)]
        [DataRow(22)]
        public void MaakFitnessToestelTest_OpeningsurenException(int beginSlot) {
            Assert.ThrowsException<ReserveerException>(() => _reservatie.MaakReservatie(DateTime.Today, _klant, _fitnessToestel, beginSlot, 1));
        }

        [TestMethod()]
        //Testen op duur
        [DataRow(-1)]
        [DataRow(0)]
        [DataRow(3)]
        public void MaakFitnessToestelTest_DuurException(int aantalSlots) {
            Assert.ThrowsException<ReserveerException>(() => _reservatie.MaakReservatie(DateTime.Today, _klant, _fitnessToestel, 10, aantalSlots));
        }
    }
}
