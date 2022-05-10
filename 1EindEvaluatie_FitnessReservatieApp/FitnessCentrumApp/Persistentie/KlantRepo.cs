using Domein;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.IO;

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

                string query = "SELECT KlantNummer, EmailAdres, VoorNaam, Achternaam, Adres, GeboorteDatum, Interesses, KlantType FROM Klant ";
                if (_klantNummer.HasValue) {
                    query += "WHERE KlantNummer = @KlantNummer;";
                }
                else {
                    query += "WHERE EmailAdres = @EmailAdres;";
                }

                SqlCommand sqlCommand = new(query, connection);

                if (_klantNummer.HasValue) {
                    sqlCommand.Parameters.AddWithValue("@KlantNummer", _klantNummer);
                }
                else {
                    sqlCommand.Parameters.AddWithValue("@EmailAdres", _emailAdres);
                }

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int klantNummer = (int)dataReader["KlantNummer"];
                        string emailAdres = (string)dataReader["EmailAdres"];
                        string voorNaam = (string)dataReader["VoorNaam"];
                        string achterNaam = (string)dataReader["AchterNaam"];
                        string adres = (string)dataReader["Adres"];
                        DateTime geboorteDatum = (DateTime)dataReader["GeboorteDatum"];

                        string interesses;
                        if (dataReader["Interesses"] == DBNull.Value) {
                            interesses = "";
                        }
                        else {
                            interesses = (string)dataReader["Interesses"];
                        }

                        string klantType = (string)dataReader["KlantType"];

                        _geselecteerdeKlant = new Klant(klantNummer, emailAdres, voorNaam, achterNaam, adres, geboorteDatum, interesses, (EKlantType)Enum.Parse(typeof(EKlantType), klantType.ToString().ToUpper()));
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

        /// <summary>
        /// Haalt data uit CSV file en steekt die in databank
        /// </summary>
        /// <exception cref="Exception"></exception>
        public void KlantenDataInDatabank() {
            try {
                string[] values = new string[7];
                string[] rows = File.ReadAllLines("klanten.csv");

                for (int i = 0; i < rows.Length; i++) {
                    values = rows[i].Split(',');

                    using SqlConnection connection = new(_connectionString);
                    connection.Open();

                    string insertSql = $"INSERT INTO Klant (EmailAdres, VoorNaam, AchterNaam, Adres, GeboorteDatum, Interesses, KlantType) " +
                        $"VALUES (@EmailAdres, @VoorNaam, @AchterNaam, @Adres, @GeboorteDatum, @Interesses, @KlantType);";

                    SqlCommand insertCommand = new(insertSql, connection);
                    insertCommand.Parameters.Add("@EmailAdres", SqlDbType.VarChar);
                    insertCommand.Parameters["@EmailAdres"].Value = values[2].ToString().Trim('\'');
                    insertCommand.Parameters.Add("@VoorNaam", SqlDbType.VarChar);
                    insertCommand.Parameters["@VoorNaam"].Value = values[0].ToString().Trim('\'');
                    insertCommand.Parameters.Add("@AchterNaam", SqlDbType.VarChar);
                    insertCommand.Parameters["@AchterNaam"].Value = values[1].ToString().Trim('\'');
                    insertCommand.Parameters.Add("@Adres", SqlDbType.VarChar);
                    insertCommand.Parameters["@Adres"].Value = values[3].ToString().Trim('\'');
                    insertCommand.Parameters.Add("@GeboorteDatum", SqlDbType.DateTime);
                    insertCommand.Parameters["@GeboorteDatum"].Value = values[4].ToString().Trim('\''); //Databank parsed automatisch datum strings

                    //Rekening houden met nullable value
                    insertCommand.Parameters.Add("@Interesses", SqlDbType.VarChar);
                    if (values[5] == "") {
                        insertCommand.Parameters["@Interesses"].Value = DBNull.Value;
                    }
                    else {
                        insertCommand.Parameters["@Interesses"].Value = values[5].ToString().Trim('\'');
                    }

                    insertCommand.Parameters.Add("@KlantType", SqlDbType.VarChar);
                    insertCommand.Parameters["@KlantType"].Value = values[6].ToString().Trim('\'').ToUpper();

                    insertCommand.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e) {
                throw new Exception("Fout bij data in databank steken.", e);
            }
        }
    }
}



