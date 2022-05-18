using Domein;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieLandingWindow.xaml
    /// </summary>
    public partial class RegistratieLandingWindow : Window {
        private DomeinController _domeinController;
        private int _aangemeldeKlantNummer;
        public RegistratieLandingWindow(DomeinController domeinController, int aangemeldeKlantNummer) {
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlantNummer = aangemeldeKlantNummer;
        }
        public string InfoString {
            get {
                return string.Format("U kan per dag max 4 uur bij ons sporten. \\n"
                    + "Maak een tweedde afspraak om meer dan 2 uur een toestel te gebruiken");
            }
        }
        private void NieuweAfspraakButton_Click(object sender, RoutedEventArgs e) {
            RegistratieWindow registratieWindow = new(_domeinController, _aangemeldeKlantNummer);
            this.Close();
            registratieWindow.Show();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e) {
            MainWindow mainWindow = new(_domeinController);

            //_aangemeldeKlant.ClearValue(); Afmelden van de klant

            this.Close();
            mainWindow.Show();
        }


        //TODO: Toepassen: Veranderen naar method die gemaakte reservaties returned?

        private int GeefReservaties(string toestelType) {
            return _domeinController.SelecteerToestelData(null, toestelType);
        }

    }
}

