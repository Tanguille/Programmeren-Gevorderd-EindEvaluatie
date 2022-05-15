using Domein;
using Persistentie;
using System;

namespace Cui {
    public class StartUp {
        public static void Main() {
            IKlantRepo klantRepo = new KlantRepo(DBinfo.DBconnectionString);
            IReservationRepo reservationRepo = new ReservationRepo(DBinfo.DBconnectionString);
            IToestellenRepo toestellenRepo = new ToestellenRepo(DBinfo.DBconnectionString);
            DomeinController domeinController = new DomeinController(klantRepo, reservationRepo, toestellenRepo);
            FitnessApp fitnessApp = new FitnessApp(domeinController);

            toestellenRepo.VeranderToestelStatus(1, "Bezet");

            //klantRepo.KlantenDataInDatabank();           
            Klant goedele = klantRepo.SelecteerKlantData("Goedele.Jackson@telenet.com");

            //toestellenRepo.ToestellenDataInDatabank();
            FitnessToestel testToestel = toestellenRepo.SelecteerToestelData(1, "");


            Reservatie reservatieTest = new(new DateTime(2022 - 05 - 25), goedele, testToestel, 2, 2);
            reservationRepo.ZetReservatieInDB(reservatieTest);

            #region KlantIdentificeren
            Console.WriteLine("Welkom bij FitnessCentrum TangFit! About time to get ripped ;)");
            Console.Write("Gelieve uw klantummer of emailadres in te geven om in te loggen: ");
            string identificatieString = Console.ReadLine();

            bool gelukt = true;
            do {
                try {
                    //domeinController.KlantIdentificeren(identificatieString);
                }
                catch (FormatException) {
                    gelukt = false;
                    throw new FormatException("Login is mislukt, probeer opnieuw.");
                }
            } while (!gelukt);
            #endregion

            #region ReservatieMaken
            //1. naar datum vragen
            Console.WriteLine("Dit is het menu om een reservatie te maken.");
            Console.Write("Op welke datum wenst u een reservatie te maken? (Gelieve dd/mm/yyyy formaat te gebruiken): ");
            DateTime datumReservatie = DateTime.Parse(Console.ReadLine());
            Console.WriteLine(datumReservatie);
            #endregion             
        }


    }
}
