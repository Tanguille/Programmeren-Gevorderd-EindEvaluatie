using Domein;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace DomeinTests {
    public class TestKlantRepo : IKlantRepo {
        private readonly List<Klant> TestKlanten = new() {
        new Klant(1, "tanguille@hotmail.be", "Tanguille", "Grootaert", "Merelbeke", DateTime.Parse("01 / 09 / 1999"), "pcs", EKlantType.GOLD),
            new Klant(2, "Goedele.Jackson@telenet.com", "Goedele", "Jackson", "Eeklo", DateTime.Parse("1970-09-04"), "running", EKlantType.BRONZE),
            new Klant(3, "Jesse.Parkinson@telenet.com", "Jesse", "Parkinson", "Melle", DateTime.Parse("1984-07-25"), "cycling", EKlantType.SILVER)
        };

        public void KlantenDataInDatabank() {
            string[] values;
            string[] rows = File.ReadAllLines("klanten.csv");

            for (int i = 0; i < rows.Length; i++) {
                values = rows[i].Split(',');
                List<string> trimmedValues = new();

                for (int j = 0; j < values.Length; j++) {
                    trimmedValues.Add(values[j].Trim('\''));
                }
                TestKlanten.Add(new Klant(i + 1, trimmedValues[2], trimmedValues[0], trimmedValues[1], trimmedValues[3],
                    DateTime.Parse(trimmedValues[4]), trimmedValues[5], (EKlantType)Enum.Parse(typeof(EKlantType), trimmedValues[6].ToString().ToUpper())));
            }
        }

        public Klant SelecteerKlantData(string identificatieString) {
            if (int.TryParse(identificatieString, out int klantNummer)) {
                return TestKlanten.First(k => k.KlantNummer.Equals(klantNummer));
            }
            else {
                return TestKlanten.First(k => k.EmailAdres == identificatieString);
            }
        }
    }
}
