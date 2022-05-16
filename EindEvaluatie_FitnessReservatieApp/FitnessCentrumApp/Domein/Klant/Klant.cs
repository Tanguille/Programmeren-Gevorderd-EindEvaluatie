using Domein.Exceptions;
using System;

namespace Domein {
    public class Klant {
        DomeinController domeinController;
        public int KlantNummer {
            get { return KlantNummer; }
            private set {
                if (KlantNummer < 1) {
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

        //Nodig om klant aan te maken in ReservationRepo
        public Klant(int klantNummer) {
            KlantNummer = klantNummer;
        }

        //Nodig om object aan te maken in UnitTests
        public Klant() {
        }
    }
}