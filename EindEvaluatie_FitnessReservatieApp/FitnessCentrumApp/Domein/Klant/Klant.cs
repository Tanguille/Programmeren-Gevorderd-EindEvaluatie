using Domein.Exceptions;
using System;
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
            if (klantNummer > 0) {
                KlantNummer = klantNummer;
            }
            else {
                throw new KlantException("KlantNummer mag niet kleiner dan 1 zijn.");
            }

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

        public bool IsValidEmail(string email) {
            try {
                string pattern = @"^\\S+@\\S+\\.\\S+$";
                var regex = new Regex(pattern, RegexOptions.IgnoreCase);
                return regex.IsMatch(email);
            }
            catch (RepoException e) {
                throw new NullReferenceException("Email valideren ging mis.", e);
            }
        }
    }
}