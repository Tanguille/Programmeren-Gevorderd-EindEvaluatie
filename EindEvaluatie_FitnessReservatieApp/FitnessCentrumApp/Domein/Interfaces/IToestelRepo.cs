using System.Collections.Generic;

namespace Domein {
    public interface IToestelRepo {
        FitnessToestel SelecteerToestelData(int? _toestelID, string _toestelType);
        public void ToestellenDataInDatabank();
        public List<FitnessToestel> GeefToestellen();
        public void VeranderToestelStatus(int iD, string toestelStatus);
    }
}
