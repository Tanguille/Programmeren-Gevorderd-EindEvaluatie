using System;

namespace Domein.Exceptions {
    public class FitnessToestelException : Exception {
        private readonly string _message;
        public override string Message => _message;
        public FitnessToestelException(string message) {
            _message = message;
        }

        public FitnessToestelException() : base("Er zijn geen toestellen die voldoen aan uw vereisten. Onze excuses voor dit ongemak.") {

        }

        public FitnessToestelException(string message, Exception innerException)
            : base("Er zijn geen toestellen die voldoen aan uw vereisten.Onze excuses voor dit ongemak.", innerException) {
            _message = message;
        }
    }
}
