using Domein;
using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.FileIO;
using System;

namespace Persistentie {
    public class KlantRepo : IKlantRepo {
        private Klant _geselecteerdeKlant;
        private string _connectionString;
        public KlantRepo(string connectionString) {
            _connectionString = connectionString;
        }

        /// <summary>
        /// Selecteert een klant met al zijn data uit de database.
        /// </summary>
        public Klant SelecteerKlantData(int? klantNummer, string emailAdres) {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT KlantNummer, EmailAdres, VoorNaam, Achternaam, GeboorteDatum, Interesses, KlantType FROM Klant;", connection);

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int KlantNummer = (int)dataReader["KlantNummer"];
                        string EmailAdres = (string)dataReader["EmailAdres"];
                        string VoorNaam = (string)dataReader["VoorNaam"];
                        string AchterNaam = (string)dataReader["AchterNaam"];
                        DateTime GeboorteDatum = (DateTime)dataReader["GeboorteDatum"];
                        string Interesses = (string)dataReader["Interesses"];
                        KlantType KlantType = (KlantType)dataReader["KlantType"];

                        _geselecteerdeKlant = new Klant(EmailAdres, VoorNaam, AchterNaam, GeboorteDatum, Interesses, KlantType);
                    }
                    return _geselecteerdeKlant;
                }
                else {
                    throw new Exception("Geen overeenkomstige data in de databank.");
                }
            }
            catch (Exception) {
                throw new Exception("SelecteerKlantData uit database ging mis.");
            }
        }

        public void klantenDataInDatabank() {
            using TextFieldParser parser = new TextFieldParser("Klanten.csv");
            parser.TextFieldType = FieldType.Delimited;
            parser.SetDelimiters(",");
            while (!parser.EndOfData) {
                //Process row
                string[] fields = parser.ReadFields();
                for (int i = 0; i < fields.Length; i++) {                    
                    string[] values = fields[i].Split(',');
                    Klant klant = new Klant(values[0], values[1], values[2], DateTime.Parse(values[3]), values[4], (KlantType)Enum.Parse(typeof(KlantType), values[5]));
                  
                }
            }           
        }
    }
}



