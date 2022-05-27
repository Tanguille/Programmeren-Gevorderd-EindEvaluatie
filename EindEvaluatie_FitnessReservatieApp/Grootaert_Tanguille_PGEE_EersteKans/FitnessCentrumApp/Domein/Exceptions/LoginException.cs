using System;

namespace Domein.Exceptions {
    public class LoginException : Exception {
        private string _message;
        public override string Message => _message;
        public LoginException(string message) {
            _message = message;
        }

        public LoginException() : base("Er ging iets mis met de login.") {
        }

        public LoginException(string message, Exception innerException) : base("Er ging iets mis met de login.", innerException) {
            _message = message;
        }
    }
}
