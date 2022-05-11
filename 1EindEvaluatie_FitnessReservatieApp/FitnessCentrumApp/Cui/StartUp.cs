using Domein;
using Persistentie;
using System;

namespace Cui {
    public class StartUp {
        public static void Main() {
            DomeinController domeinController = new DomeinController();
            IKlantRepo klantRepo = new KlantRepo(DBinfo.DBconnectionString);
            IReservationRepo reservationRepo = new ReservationRepo(DBinfo.DBconnectionString);
            IToestellenRepo toestellenRepo = new ToestellenRepo(DBinfo.DBconnectionString);
            FitnessApp fitnessApp = new FitnessApp(domeinController);

            //klantRepo.KlantenDataInDatabank();
            Klant goedele = klantRepo.SelecteerKlantData(null, "Goedele.Jackson@telenet.com");

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
                    domeinController.KlantIdentificeren(identificatieString);
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

            //List<string> menu = new List<string>() { "Add aircraft", "Add charter" };
            //List<string> types = new List<string>() { "Passenger", "Cargo" };
            //int destinationIndex;
            //int typeChoice;
            //int loadAmount;
            //bool stop = false;
            //try {
            //    do {
            //        Console.Clear();
            //        int optionChoice = fitnessApp.MakeChoiceFromOptions("Menu", menu, "Stop");
            //        switch (optionChoice) {
            //            case 0:
            //                stop = true;
            //                //if (!domeinController.GetAircraftOnPlanner().Any()) {
            //                //    Console.WriteLine("No flights were added to planner!");
            //                //}
            //                //else {
            //                //    foreach (string aircraft in domeinController.GetAircraftOnPlanner()) {
            //                //        Console.WriteLine(aircraft);
            //                //    }
            //                //}
            //                break;
            //            case 1:
            //                destinationIndex = fitnessApp.MakeChoiceFromOptions("Pick a destination", destinationMapper.GetDestinations(), "Don't select a destination.");
            //                typeChoice = fitnessApp.MakeChoiceFromOptions("Pick an aircraft type", types, "don't select a type");
            //                loadAmount = fitnessApp.LoadAmountSelector(typeChoice == 1 ? "Passenger" : typeChoice == 2 ? "Cargo" : throw new FormatException());
            //                domeinController.PlaceAircraftOnPlanner(destinationIndex - 1, loadAmount.ToString(), typeChoice.ToString());
            //                break;
            //            case 2:
            //                Console.WriteLine("Please provide amount of fuel");
            //                domeinController.PlaceCharterAircraftOnPlanner(double.Parse(Console.ReadLine()));
            //                break;
            //            default:
            //                throw new FormatException();
            //        }
            //    } while (!stop);
            //}
            //catch (Exception exception) {
            //    Console.WriteLine($"{exception.GetType().Name}: {exception.Message}");

            //    //DEBUG
            //    //Console.WriteLine(exception.StackTrace);
            //}
        }


    }
}
