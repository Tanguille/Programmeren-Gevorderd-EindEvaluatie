using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Domein.Tests {
    [TestClass()]
    public class FitnessCentrumTests {
        [TestMethod()]
        [DataRow(7, 1)]
        [DataRow(7, 2)]
        public void OpeningsUrenValidTest_OpeningsUrenTeVroeg_ReturnFalse(int beginSlot, int aantalSlots) {
            Assert.AreEqual(false, FitnessCentrum.OpeningsUrenValid(beginSlot, aantalSlots));
        }

        [TestMethod()]
        [DataRow(21, 2)]
        [DataRow(22, 1)]
        public void OpeningsUrenValidTest_OpeningsUrenTeLaat_ReturnFalse(int beginSlot, int aantalSlots) {
            Assert.AreEqual(false, FitnessCentrum.OpeningsUrenValid(beginSlot, aantalSlots));
        }

        [TestMethod()]
        [DataRow(8, 1)]
        [DataRow(8, 2)]
        [DataRow(20, 2)]
        [DataRow(21, 1)]
        public void OpeningsUrenValidTest_OpeningsUrenCorrect_ReturnTrue(int beginSlot, int aantalSlots) {
            Assert.AreEqual(true, FitnessCentrum.OpeningsUrenValid(beginSlot, aantalSlots));
        }

        [TestMethod()]
        [DataRow(-1, 1)]
        [DataRow(0, -1)]
        public void ReservatieDagValidTest_TeVroegGereserveerd_ReturnFalse(int dagIndex, int uurIndex) {
            Assert.AreEqual(false, FitnessCentrum.ReservatieDagValid(DateTime.Today.AddDays(dagIndex), DateTime.Now.AddHours(uurIndex).Hour));
        }

        [TestMethod()]
        [DataRow(8)]
        public void ReservatieDagValidTest_TeLaatGereserveerd_ReturnFalse(int dagIndex) {
            Assert.AreEqual(false, FitnessCentrum.ReservatieDagValid(DateTime.Now.AddDays(dagIndex), 12));
        }

        [TestMethod()]
        [DataRow(0, 1)]
        [DataRow(7, 1)]
        public void ReservatieDagValidTest_JuistGereserveerd_ReturnTrue(int dagIndex, int uurIndex) {
            Assert.AreEqual(true, FitnessCentrum.ReservatieDagValid(DateTime.Today.AddDays(dagIndex), DateTime.Now.AddHours(uurIndex).Hour));
        }
    }
}