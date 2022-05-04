using System;
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace Domein {
    public class Klant {
        public int KlantNummer { get; private set; }
        public string EmailAdres { get; private set; }
        public string VoorNaam { get; private set; }
        public string AchterNaam { get; private set; }
        public DateTime GeboorteDatum { get; private set; }
        public string Interesses { get; private set; }
        public KlantType KlantType { get; private set; }

        public Klant(string emailAdres, string voorNaam, string achterNaam, DateTime geboorteDatum, string interesses, KlantType klantType) {
            EmailAdres = emailAdres;
            VoorNaam = voorNaam;
            AchterNaam = achterNaam;
            GeboorteDatum = geboorteDatum;
            Interesses = interesses;
            KlantType = klantType;
        }

        //gegevens die nodig zijn voor reservatie aan te maken
        public Klant(int klantnummer, string emailAdres, string voorNaam, string achterNaam) : base() {
        }

        /// <summary>
        /// Checkt of klant klantnummer of emailadres gebruikt en zoekt op basis daarop klant op
        /// TODO: Logica zoeken in databank uitwerken
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
                //HACK: Nut custom exception?
                catch (Exception) {
                    gelukt = false;
                    throw new Exception("Identificatie ongeldig. Probeer opnieuw");
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