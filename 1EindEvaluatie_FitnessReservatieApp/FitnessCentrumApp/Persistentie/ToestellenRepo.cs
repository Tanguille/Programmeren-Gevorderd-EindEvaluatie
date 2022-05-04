using Domein;
using Microsoft.VisualBasic.FileIO;
using System;

namespace Persistentie {
    public class ToestellenRepo : IToestellenRepo {

        public FitnessToestel LeesToestellenData() {
            try {
                using (TextFieldParser parser = new TextFieldParser("Toestellen.csv")) {
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
            }
            catch (Exception) {
                throw new NotSupportedException("Toestel is niet gekend.");
            }
            return null;
        }
    }
}
