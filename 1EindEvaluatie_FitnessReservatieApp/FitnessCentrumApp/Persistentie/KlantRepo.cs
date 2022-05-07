using Domein;
using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.FileIO;
using System;
using System.Data;

namespace Persistentie {
    public class KlantRepo : IKlantRepo {
        private Klant _geselecteerdeKlant;
        private readonly string _connectionString;
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

        public void KlantenDataInDatabank() {
            try {
                using TextFieldParser parser = new("Klanten.csv");
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");
                while (!parser.EndOfData) {
                    //Process row
                    string[] fields = parser.ReadFields();
                    for (int i = 0; i < fields.Length; i++) {
                        string[] values = fields[i].Split(',');

                        using SqlConnection connection = new(_connectionString);
                        connection.Open();

                        string insertSql = $"INSERT INTO Personen (EmailAdres, VoorNaam, AchterNaam, GeboorteDatum, Interesses, KlantType) VALUES (@EmailAdres, @VoorNaam, @AchterNaam, @GeboorteDatum, @Interesses, @KlantType);";
                        SqlCommand insertCommand = new(insertSql, connection);
                        insertCommand.Parameters.Add("@EmailAdres", SqlDbType.VarChar);
                        insertCommand.Parameters["@EmailAdres"].Value = values[0].ToString();
                        insertCommand.Parameters.Add("@VoorNaam", SqlDbType.VarChar);
                        insertCommand.Parameters["@VoorNaam"].Value = values[1].ToString();
                        insertCommand.Parameters.Add("@AchterNaam", SqlDbType.VarChar);
                        insertCommand.Parameters["@AchterNaam"].Value = values[2].ToString();
                        insertCommand.Parameters.Add("@GeboorteDatum", SqlDbType.DateTime);
                        insertCommand.Parameters["@GeboorteDatum"].Value = DateTime.Parse(values[3]);
                        insertCommand.Parameters.Add("@Interesses", SqlDbType.VarChar);
                        insertCommand.Parameters["@Interesses"].Value = values[4].ToString();
                        insertCommand.Parameters.Add("@KlantType", SqlDbType.VarChar);
                        insertCommand.Parameters["@KlantType"].Value = values[5].ToString();

                        insertCommand.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception) {
                throw new Exception("Fout bij data in databank steken.");
            }
        }
    }
}



