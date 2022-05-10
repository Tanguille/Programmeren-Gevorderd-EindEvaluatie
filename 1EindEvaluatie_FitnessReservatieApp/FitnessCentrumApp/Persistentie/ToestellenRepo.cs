using Domein;
using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.FileIO;
using System;

namespace Persistentie {
    public class ToestellenRepo : IToestellenRepo {
        private readonly FitnessToestel _geselecteerdToestel;
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
                            return _geselecteerdToestel;
                        }
                        else if (toestelType.ToLower() == "fiets") {
                            FitnessToestel fitnessToestel = new Fiets(int.Parse(toestelType));
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
        /// TODO: Hier voortwerken
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotSupportedException"></exception>
        public FitnessToestel ToestellenDataInDatabank() {
            try {
                using TextFieldParser parser = new TextFieldParser("Toestellen.csv");
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");
                while (!parser.EndOfData) {
                    //Process row
                    string[] fields = parser.ReadFields();
                    for (int i = 0; i < fields.Length; i++) {
                        string[] values = fields[i].Split(',');

                        if (values[1].ToLower() == "loopband") {
                            FitnessToestel fitnessToestel = new Loopband(int.Parse(values[0]));
                            return fitnessToestel;
                        }
                        else if (values[1].ToLower() == "fiets") {
                            FitnessToestel fitnessToestel = new Fiets(int.Parse(values[0]));
                            return fitnessToestel;
                        }
                    }
                }
            }
            catch (Exception) {
                throw new NotSupportedException("Toestel is niet gekend.");
            }
            return null;
        }
    }
}
