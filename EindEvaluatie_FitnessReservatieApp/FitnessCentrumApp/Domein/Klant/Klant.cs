using Domein.Exceptions;
using System;
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace Domein {
    public class Klant {
        public int KlantNummer { get; private set; }
        public string EmailAdres { get; private set; }
        public string VoorNaam { get; private set; }
        public string AchterNaam { get; private set; }
        public string Adres { get; private set; }
        public DateTime GeboorteDatum { get; private set; }
        public string Interesses { get; private set; }
        public EKlantType KlantType { get; private set; }

        public Klant(string emailAdres, string voorNaam, string achterNaam, string adres, DateTime geboorteDatum, string interesses, EKlantType klantType) {
            EmailAdres = emailAdres;
            VoorNaam = voorNaam;
            AchterNaam = achterNaam;
            Adres = adres;
            GeboorteDatum = geboorteDatum;
            Interesses = interesses;
            KlantType = klantType;
        }

        public Klant(int klantNummer, string emailAdres, string voorNaam, string achterNaam, string adres, DateTime geboorteDatum, string interesses, EKlantType klantType) {
            if (klantNummer < 1) {
                throw new KlantException("KlantNummer mag niet kleiner dan 1 zijn.");
            }
            else {
                klantNummer = KlantNummer;
            }

            EmailAdres = emailAdres;
            VoorNaam = voorNaam;
            AchterNaam = achterNaam;
            Adres = adres;
            GeboorteDatum = geboorteDatum;
            Interesses = interesses;
            KlantType = klantType;
        }

        //Nodig om klant aan te maken in ReservationRepo
        public Klant(int klantNummer) {
            KlantNummer = klantNummer;
        }

        //Nodig om object aan te maken in UnitTests
        public Klant() {
        }

        public bool IsValidEmail(string email) {
            try {
                MailAddress verifiedMail = new(email);
                string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
                var regex = new Regex(pattern, RegexOptions.IgnoreCase);
                //Extra check omdat dit betere resultaten gaf bij UnitTests.
                return regex.IsMatch(verifiedMail.ToString());
            }
            catch (RepoException e) {
                throw new RepoException("Email valideren ging mis.", e);
            }
        }
    }
}