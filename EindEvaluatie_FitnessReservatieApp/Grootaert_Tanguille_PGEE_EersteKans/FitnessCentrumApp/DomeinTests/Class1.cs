using Domein;
using System.Collections.Generic;

namespace DomeinTests {
    public class Class1 {
        static void Main(string[] args) {
            DomeinController _controller;
            TestToestelRepo _toestelRepo = new();
            TestReservatieRepo _reservatieRepo = new();
            TestKlantRepo _klantRepo = new();

            _controller = new(_klantRepo, _reservatieRepo, _toestelRepo);

            List<Reservatie> reservaties = _reservatieRepo.GeefReservatiesVanafVandaag();

            foreach (var item in reservaties) {
                System.Console.WriteLine(item);
            }
        }
    }
}
