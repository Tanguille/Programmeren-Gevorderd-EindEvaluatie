using Domein;
using Persistentie;
using System.Windows;

namespace Gui {
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application {
        public void Application_Startup(object sender, StartupEventArgs e) {
            //Repos
            IKlantRepo klantRepo = new KlantRepo(DBinfo.DBconnectionString);
            IReservationRepo reservationRepo = new ReservatieRepo(DBinfo.DBconnectionString);
            IToestelRepo toestellenRepo = new ToestelRepo(DBinfo.DBconnectionString);

            //Instantieren domeincontrollers
            DomeinController domeinController = new DomeinController(klantRepo, reservationRepo, toestellenRepo);

            //Create the startup window
            MainWindow startScreen = new Gui.MainWindow(domeinController);

            //Do stuff here, e.g. to the windows
            startScreen.Title = "FitnessCentrum TangFit Login";

            //Show the window
            startScreen.Show();
        }
    }
}
