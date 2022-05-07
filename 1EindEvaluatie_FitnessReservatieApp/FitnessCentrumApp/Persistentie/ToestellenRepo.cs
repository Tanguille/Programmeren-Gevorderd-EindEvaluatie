using Domein;
using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.FileIO;
using System;

namespace Persistentie {
    public class ToestellenRepo : IToestellenRepo {
        private readonly FitnessToestel _geselecteerdToestel;
        private readonly string _connectionString;

        public FitnessToestel SelecteerToestelData() {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT ToestelID, ToestelType FROM Klant;", connection);

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int toestelID = (int)dataReader["ToestelID"];
                        string toestelType = (string)dataReader["ToestelType"];

                        string[] values = new string[2];
                        if (values[1].ToLower() == "loopband") {
                            FitnessToestel fitnessToestel = new Loopband(int.Parse(values[1]));
                            return fitnessToestel;
                        }
                        else if (values[1].ToLower() == "fiets") {
                            FitnessToestel fitnessToestel = new Fiets(int.Parse(values[1]));
                            return fitnessToestel;
                        }
                    }
                    return _geselecteerdToestel;
                }
                else {
                    throw new Exception("Geen overeenkomstige data in de databank.");
                }
            }
            catch (Exception) {
                throw new Exception("SelecteerKlantData uit database ging mis.");
            }
        }

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
