using Domein;
using Persistentie;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application {
        public void Application_Startup(object sender, StartupEventArgs e) {
            //Repos
            IKlantRepo klantRepo = new KlantRepo(DBinfo.DBconnectionString);
            IReservationRepo reservationRepo = new ReservationRepo(DBinfo.DBconnectionString);
            IToestellenRepo toestellenRepo = new ToestellenRepo(DBinfo.DBconnectionString);

            //Instantieren domeincontrollers
            DomeinController domeinController = new DomeinController(klantRepo, reservationRepo, toestellenRepo);

            //Create the startup window
            MainWindow startScreen = new GUI.MainWindow(domeinController);

            //Do stuff here, e.g. to the windows
            startScreen.Title = "FitnessCentrum TangFit Login";

            //Show the window
            startScreen.Show();
        }
    }
}
