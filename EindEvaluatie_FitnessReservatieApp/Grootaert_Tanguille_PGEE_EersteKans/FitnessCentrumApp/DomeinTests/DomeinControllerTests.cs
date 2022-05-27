
using Domein.Exceptions;
using DomeinTests;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Domein.Tests {
    [TestClass()]
    public class DomeinControllerTests {
        private DomeinController? _controller;
        private TestToestelRepo? _toestelRepo;
        private TestReservatieRepo? _reservatieRepo;

        [TestInitialize()]
        public void Init() {
            TestKlantRepo klantRepo = new();
            _reservatieRepo = new();
            _toestelRepo = new();

            _controller = new(klantRepo, _reservatieRepo, _toestelRepo) {
                AangemeldeKlant = (new Klant(2, "Goedele.Jackson@telenet.com", "Goedele", "Jackson", "Eeklo", DateTime.Parse("1970-09-04"), "running", EKlantType.BRONZE))
            };
        }

        [TestMethod()]
        [DataRow(1, 12, 3, "fiets")]
        public void MaakReservatieTest_ToestelMeerDan2SlotsReserveren_ThrowReserveerException(int dagIndex, int beginSlot, int aantalSlots, string geselecteerdToestel) {
            Assert.ThrowsException<ReserveerException>(() => _controller?.MaakReservatie(DateTime.Today.AddDays(dagIndex), beginSlot, aantalSlots, geselecteerdToestel));
        }

        [TestMethod()]
        [DataRow(1, 19, 2, "fiets")]
        public void MaakReservatieTest_ToestelMeerDan4SlotsReserverenop1Dag_ThrowReserveerException(int dagIndex, int beginSlot, int aantalSlots, string geselecteerdToestel) {
            //2 reservaties van 2 uur maken met deze klant zodat zijn max quota bereikt wordt            
            _reservatieRepo?.ReservatiesVoorTesten();

            Assert.ThrowsException<ReserveerException>(() => _controller?.MaakReservatie(DateTime.Today.AddDays(dagIndex), beginSlot, aantalSlots, geselecteerdToestel));
        }
    }
}
