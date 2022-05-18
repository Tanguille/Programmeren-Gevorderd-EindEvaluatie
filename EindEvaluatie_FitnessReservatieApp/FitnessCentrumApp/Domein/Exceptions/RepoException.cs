using System;

namespace Domein.Exceptions {
    public class RepoException : Exception {
        private string _message;
        public override string Message => _message;
        public RepoException(string message) {
            _message = message;
        }

        public RepoException() : base("Er ging iets mis met de verwerking van de database.") {
        }

        public RepoException(string message, Exception innerException) : base("Er ging iets mis met de verwerking van de database.", innerException) {
            _message = message;
        }
    }
}
