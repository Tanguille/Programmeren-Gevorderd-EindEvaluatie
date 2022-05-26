using Domein;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DomeinTests {
    public class TestToestelRepo : IToestelRepo {
        List<FitnessToestel> FitnessToestelList = new() {
            new Fiets(1), new Fiets(2), new Fiets(3), new Fiets(4),
            new Loopband(5), new Loopband(6), new Loopband(7), new Loopband(8)
        };

        public List<FitnessToestel> GeefToestellen() {
            throw new NotImplementedException();
        }

        public List<FitnessToestel> GeefToestellen(string _toestelType) {
            return FitnessToestelList.Where(t => t.GetType().Name.ToLower().Equals(_toestelType)).ToList();
        }

        public FitnessToestel SelecteerToestelData(int? _toestelID, string _toestelType) {
            return FitnessToestelList.First(f => f.ToestelID == _toestelID || f.GetType().Name.ToLower() == _toestelType);
        }

        public void ToestellenDataInDatabank() {
            throw new NotImplementedException();
            //string[] values;
            //string[] rows = File.ReadAllLines("FitnessToestellen.csv");

            //for (int i = 0; i < rows.Length; i++) {
            //    values = rows[i].Split(',');
            //    if (values[1] == "loopband") {
            //        FitnessToestelList.Add(new Loopband(int.Parse(values[0])));
            //    }
            //    else {
            //        FitnessToestelList.Add(new Fiets(int.Parse(values[0])));
            //    }
            //}
        }

        public void ToestelToevoegenDatabank(string toestelType) {
            throw new NotImplementedException();
        }

        public void VeranderToestelStatus(int iD, string toestelStatus) {
            throw new NotImplementedException();
        }
    }
}
