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
        public Klant SelecteerKlantData(int? _klantNummer, string _emailAdres) {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT KlantNummer, EmailAdres, VoorNaam, Achternaam, GeboorteDatum, Interesses, KlantType FROM Klant;", connection);

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int klantNummer = (int)dataReader["KlantNummer"];
                        string emailAdres = (string)dataReader["EmailAdres"];
                        string voorNaam = (string)dataReader["VoorNaam"];
                        string achterNaam = (string)dataReader["AchterNaam"];
                        DateTime geboorteDatum = (DateTime)dataReader["GeboorteDatum"];
                        string interesses = (string)dataReader["Interesses"];
                        string klantType = (string)dataReader["KlantType"];

                        _geselecteerdeKlant = new Klant(emailAdres, voorNaam, achterNaam, geboorteDatum, interesses, (EKlantType)Enum.Parse(typeof(EKlantType), klantType.ToString().ToUpper()));
                    }
                    return _geselecteerdeKlant;
                }
                else {
                    throw new Exception("Geen overeenkomstige data in de databank.");
                }
            }
            catch (Exception e) {
                throw new Exception("SelecteerKlantData uit database ging mis.", e);
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
                        insertCommand.Parameters["@EmailAdres"].Value = values[0].ToString().Trim('\'');
                        insertCommand.Parameters.Add("@VoorNaam", SqlDbType.VarChar);
                        insertCommand.Parameters["@VoorNaam"].Value = values[1].ToString().Trim('\'');
                        insertCommand.Parameters.Add("@AchterNaam", SqlDbType.VarChar);
                        insertCommand.Parameters["@AchterNaam"].Value = values[2].ToString().Trim('\'');
                        insertCommand.Parameters.Add("@GeboorteDatum", SqlDbType.DateTime);
                        insertCommand.Parameters["@GeboorteDatum"].Value = DateTime.Parse(values[3]);
                        //Rekening houden met nullable value
                        insertCommand.Parameters.Add("@Interesses", SqlDbType.VarChar);
                        if (values[4] == "") {
                            insertCommand.Parameters["@Interesses"].Value = DBNull.Value;
                        }
                        else {
                            insertCommand.Parameters["@Interesses"].Value = values[4].ToString().Trim('\'');
                        }

                        insertCommand.Parameters.Add("@KlantType", SqlDbType.VarChar);
                        insertCommand.Parameters["@KlantType"].Value = values[5].ToString().Trim('\'');

                        insertCommand.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception e) {
                throw new Exception("Fout bij data in databank steken.", e);
            }
        }
    }
}



