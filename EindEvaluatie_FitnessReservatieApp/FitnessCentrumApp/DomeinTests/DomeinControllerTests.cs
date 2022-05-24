
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Domein.Tests {
    [TestClass()]
    public class DomeinControllerTests {
        private DomeinController _controller;
        private IKlantRepo _klantRepo;
        private IReservationRepo _reservationRepo;
        private IToestelRepo _toestelRepo;

        [TestInitialize()]
        public void Init() {
            _controller = new(_klantRepo, _reservationRepo, _toestelRepo);
        }

        [TestMethod()]
        public void MaakReservatieTest() {
            //Assert.ThrowsException<ReserveerException>(() => _controller.MaakReservatie());
        }
    }
}