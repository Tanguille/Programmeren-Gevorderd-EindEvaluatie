using Domein.Exceptions;
using System;
using System.Text.RegularExpressions;

namespace Domein {
    public class Klant {
        private int _klantNummer;
        public int KlantNummer {
            get { return _klantNummer; }
            private set {
                if (value > 0) {
                    _klantNummer = value;
                }
                else {
                    throw new KlantException("KlantNummer mag niet kleiner dan 1 zijn.");
                }
            }
        }

        public string EmailAdres { get; private set; }
        public string VoorNaam { get; private set; }
        public string AchterNaam { get; private set; }
        public string Adres { get; private set; }
        public DateTime GeboorteDatum { get; private set; }
        public string Interesses { get; private set; }
        public EKlantType KlantType { get; private set; }
        public Klant(int klantNummer, string emailAdres, string voorNaam, string achterNaam, string adres, DateTime geboorteDatum, string interesses, EKlantType klantType)
            : this(emailAdres, voorNaam, achterNaam, adres, geboorteDatum, interesses, klantType) {
            KlantNummer = klantNummer;
        }

        public Klant(string emailAdres, string voorNaam, string achterNaam, string adres, DateTime geboorteDatum, string interesses, EKlantType klantType) {
            EmailAdres = emailAdres;
            VoorNaam = voorNaam;
            AchterNaam = achterNaam;
            Adres = adres;
            GeboorteDatum = geboorteDatum;
            Interesses = interesses;
            KlantType = klantType;
        }

        public override string ToString() {
            return $"{VoorNaam} {AchterNaam}";
        }

        /// <summary>
        /// Email validator
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        /// <exception cref="RepoException"></exception>
        public static bool IsValidEmail(string email) {
            try {
                string pattern = @"^\\S+@\\S+\\.\\S+$";
                var regex = new Regex(pattern, RegexOptions.IgnoreCase);
                return regex.IsMatch(email);
            }
            catch (RepoException e) {
                throw new RepoException("Email valideren ging mis.", e);
            }
        }
    }
}