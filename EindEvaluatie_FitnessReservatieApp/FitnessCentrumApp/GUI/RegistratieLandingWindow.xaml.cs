using Domein;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieLandingWindow.xaml
    /// </summary>
    public partial class RegistratieLandingWindow : Window {
        private DomeinController _domeinController;        
        public RegistratieLandingWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;            
        }
        public string InfoString {
            get {
                return string.Format("U kan per dag max 4 uur bij ons sporten. \\n"
                    + "Maak een tweedde afspraak om meer dan 2 uur een toestel te gebruiken");
            }
        }
        private void NieuweAfspraakButton_Click(object sender, RoutedEventArgs e) {
            RegistratieWindow registratieWindow = new(_domeinController);
            this.Close();
            registratieWindow.Show();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e) {
            MainWindow mainWindow = new(_domeinController);

            //_aangemeldeKlant.ClearValue(); Afmelden van de klant

            this.Close();
            mainWindow.Show();
        }

    }
}

