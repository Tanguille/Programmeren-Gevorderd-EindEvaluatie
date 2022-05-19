using Domein;
using Gui;
using System.Collections.Generic;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieLandingWindow.xaml
    /// </summary>
    public partial class RegistratieLandingWindow : Window {
        private DomeinController _domeinController;
        private int _aangemeldeKlantNummer;
        public RegistratieLandingWindow(DomeinController domeinController, int aangemeldeKlantNummer) {
            this.DataContext = this;
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlantNummer = aangemeldeKlantNummer;

            List<string[]> reservatieStrings = _domeinController.ReservatiesToString();

            List<RegistratieLandingStrings> registratieLandingStrings = new();
            foreach (string[] reservatieString in reservatieStrings) {
                registratieLandingStrings.Add(new RegistratieLandingStrings() {
                    ReservatieNummer = reservatieString[0],
                    Datum = reservatieString[1],
                    ToestelID = reservatieString[2],
                    TijdSlot = reservatieString[3],
                    AantalSlots = reservatieString[4]
                });
            }
            ReservationListView.ItemsSource = registratieLandingStrings;
        }

        public string InfoString {
            get {
                return $"U kan per dag max 4 uur bij ons sporten. \n"
                    + "Maak een tweede afspraak om meer dan 2 uur een toestel te gebruiken";
            }
        }
        private void NieuweAfspraakButton_Click(object sender, RoutedEventArgs e) {
            RegistratieWindow registratieWindow = new(_domeinController, _aangemeldeKlantNummer);
            this.Close();
            registratieWindow.Show();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e) {
            MainWindow mainWindow = new(_domeinController);

            _aangemeldeKlantNummer = 0; //Afmelden van de klant

            this.Close();
            mainWindow.Show();
        }
    }
}

