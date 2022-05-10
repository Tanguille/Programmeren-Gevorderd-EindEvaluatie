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
            KlantNummer = klantNummer;
            EmailAdres = emailAdres;
            VoorNaam = voorNaam;
            AchterNaam = achterNaam;
            Adres = adres;
            GeboorteDatum = geboorteDatum;
            Interesses = interesses;
            KlantType = klantType;
        }

        //Nodig om object aan te maken in UnitTests
        public Klant() {
        }

        /// <summary>
        /// Checkt of klant klantnummer of emailadres gebruikt en zoekt op basis daarop klant op        
        /// HACK: Moet Klant returnen
        /// </summary>
        /// <param name="identificatieString"></param>
        public void KlantIdentificeren(string identificatieString) {
            bool numeriek = int.TryParse(identificatieString, out int klantNummer);
            bool gelukt = true;

            do {
                try {
                    if (numeriek) {
                        if (klantNummer == 0) {
                            throw new Exception("Klantnummer kan niet 0 zijn.");
                        }
                    }
                    else {
                        if (!IsValidEmail(identificatieString)) {
                            throw new Exception("Email ongeldig.");
                        }
                        else {
                            MailAddress verifiedMail = new(identificatieString);
                            //return _klant.LeesKlantenData();
                        }
                    }
                }
                catch (Exception e) {
                    gelukt = false;
                    throw new Exception("Identificatie ongeldig. Probeer opnieuw", e);
                }
            } while (!gelukt);
        }
        public bool IsValidEmail(string email) {
            string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            var regex = new Regex(pattern, RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }
    }
}