using System;

namespace Domein.Exceptions {
    public class KlantException : Exception {
        private readonly string _message;
        public override string Message => _message;
        public KlantException(string message) {
            _message = message;
        }

        public KlantException() : base("De klantgegevens zijn niet geldig.") {

        }

        public KlantException(string message, Exception innerException) : base("De klantgegevens zijn niet geldig.", innerException) {
            _message = message;
        }
    }
}
