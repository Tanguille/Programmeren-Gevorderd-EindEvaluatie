using Domein;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.IO;

namespace Persistentie {
    public class ToestellenRepo : IToestellenRepo {
        private FitnessToestel _geselecteerdToestel;
        private readonly string _connectionString;

        public ToestellenRepo(string connectionString) {
            _connectionString = connectionString;
        }

        /// <summary>
        /// Selecteert een toestel met al zijn data uit de database.
        /// </summary>
        public FitnessToestel SelecteerToestelData(int? _toestelID, string _toestelType) {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                string query = "SELECT ToestelID, ToestelType FROM Klant WHERE ";
                if (_toestelID.HasValue) {
                    query += "WHERE ToestelID = @ToestelID;";
                }
                else {
                    query += "WHERE ToestelType = @ToestelType;";
                }

                SqlCommand sqlCommand = new(query, connection);

                if (_toestelID.HasValue) {
                    sqlCommand.Parameters.AddWithValue("@ToestelID", _toestelID);
                }
                else {
                    sqlCommand.Parameters.AddWithValue("@ToestelType", _toestelType);
                }

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int toestelID = (int)dataReader["ToestelID"];
                        string toestelType = (string)dataReader["ToestelType"];


                        if (toestelType.ToLower() == "loopband") {
                            FitnessToestel fitnessToestel = new Loopband(int.Parse(toestelType));
                            _geselecteerdToestel = fitnessToestel;
                            return _geselecteerdToestel;
                        }
                        else if (toestelType.ToLower() == "fiets") {
                            FitnessToestel fitnessToestel = new Fiets(int.Parse(toestelType));
                            _geselecteerdToestel = fitnessToestel;
                            return _geselecteerdToestel;
                        }
                    }
                    return _geselecteerdToestel;
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
        /// Haalt toestellendata uit CSV file en steekt die in databank
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotSupportedException"></exception>
        public void ToestellenDataInDatabank() {
            try {
                string[] values = new string[2];
                string[] rows = File.ReadAllLines("FitnessToestellen.csv");

                for (int i = 0; i < rows.Length; i++) {
                    values = rows[i].Split(',');

                    using SqlConnection connection = new(_connectionString);
                    connection.Open();

                    string insertSql = $"INSERT INTO FitnessToestel (ToestelType) "
                        + $"VALUES (@ToestelType);";

                    SqlCommand insertCommand = new(insertSql, connection);
                    insertCommand.Parameters.Add("@ToestelType", SqlDbType.VarChar);
                    insertCommand.Parameters["@ToestelType"].Value = values[1].ToString();

                    insertCommand.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e) {
                throw new NotSupportedException("Toestel is niet gekend.", e);
            }
        }

    }
}


