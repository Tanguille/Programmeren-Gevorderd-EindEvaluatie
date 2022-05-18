using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Domein.Tests {
    [TestClass()]
    public class KlantTests {
        private Klant _klant;

        [TestInitialize()]
        public void Init() {
            _klant = new();
        }


        [TestMethod()]
        [DataRow("0")]
        [DataRow("test")]
        [DataRow("@test.be")]
        [DataRow("1.1")]
        [DataRow("1,1")]
        [DataRow("email@kaas")]
        [DataRow("email@kaas.")]
        [DataRow("e.email@kaas")]
        [DataRow(null)]
        [DataRow("")]
        [DataRow("..@test.com")]
        [DataRow(".a@test.com")]
        [DataRow("ab@sd@dd")]
        [DataRow(".@s.dd")]
        [DataRow("ab@988.120.150.10")]
        [DataRow("ab@120.256.256.120")]
        [DataRow("ab@120.25.1111.120")]
        [DataRow("ab@[188.120.150.10")]
        [DataRow("ab@188.120.150.10]")]
        [DataRow("ab@[188.120.150.10].com")]
        [DataRow("a@bde-.cc")]
        [DataRow("a@bde.c-c")]
        [DataRow("a@bde.cc.")]
        [DataRow("ab@b+de.cc")]
        [DataRow("a..b@bde.cc")]
        [DataRow("_@bde.cc,")]
        [DataRow("plainaddress")]
        [DataRow("plain.address")]
        [DataRow("@%^%#$@#$@#.com")]
        [DataRow("@domain.com")]
        [DataRow("Joe Smith &lt;email@domain.com&gt;")]
        [DataRow("email.domain.com")]
        [DataRow("email@domain@domain.com")]
        [DataRow(".email@domain.com")]
        [DataRow("email.@domain.com")]
        [DataRow("email..email@domain.com")]
        [DataRow("email@-domain.com")]
        [DataRow("email@domain-.com")]
        [DataRow("email@domain.com-")]
        [DataRow("email@.domain.com")]
        [DataRow("email@domain.com.")]
        [DataRow("email@domain..com")]
        [DataRow("email@111.222.333")]
        [DataRow("email@111.222.333.256")]
        [DataRow("email@[123.123.123.123")]
        [DataRow("email@[123.123.123].123")]
        [DataRow("email@123.123.123.123]")]
        [DataRow("email@123.123.[123.123]")]
        [DataRow("email@{leftbracket.com")]
        [DataRow("email@rightbracket}.com")]
        [DataRow("email@p|pe.com")]
        [DataRow("isis@100%.nl")]
        [DataRow("email@dollar$.com")]
        [DataRow("email@r&amp;d.com")]
        [DataRow("email@#hash.com")]
        [DataRow("email@wave~tilde.com")]
        [DataRow("email@exclamation!mark.com")]
        [DataRow("email@question?mark.com")]
        [DataRow("email@obelix*asterisk.com")]
        [DataRow("email@grave`accent.com")]
        [DataRow("email@colon:colon.com")]
        [DataRow("email@caret^xor.com")]
        [DataRow("email@=qowaiv.com")]
        [DataRow("email@plus+.com")]
        [DataRow("email@domain.com>")]
        [DataRow("email( (nested) )@plus.com")]
        [DataRow("email)mirror(@plus.com")]
        [DataRow("email@plus.com (not closed comment")]
        [DataRow("email(with @ in comment)plus.com")]
        [DataRow(@"""Joe Smith email@domain.com")]
        [DataRow(@"""Joe Smith' email@domain.com")]
        [DataRow(@"""Joe Smith""email@domain.com")]
        [DataRow("email@mailto:domain.com")]
        [DataRow("mailto:mailto:email@domain.com")]
        [DataRow("Display Name <email@plus.com> (after name with display)")]
        public void KlantIdentificerenTest_Exception(string testString) {
            Assert.ThrowsException<Exception>(() => _klant.IsValidEmail(testString));
        }

        [TestMethod()]
        [DataRow("1")]
        [DataRow("tanguille@hotmail.be")]
        public void KlantIdentificerenTest_NonException(string testString) {
            _klant.IsValidEmail(testString);
        }
    }
}