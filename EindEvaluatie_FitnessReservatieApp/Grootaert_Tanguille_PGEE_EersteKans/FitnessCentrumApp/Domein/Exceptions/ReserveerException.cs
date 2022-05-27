using System;

namespace Domein.Exceptions {
    public class ReserveerException : Exception {
        private string _message;
        public override string Message => _message;
        public ReserveerException(string message) {
            _message = message;
        }

        public ReserveerException() : base("Er ging iets mis met de FitnessToestel.") {
        }

        public ReserveerException(string message, Exception innerException) : base("Er ging iets mis met de FitnessToestel.", innerException) {
        }
    }
}
