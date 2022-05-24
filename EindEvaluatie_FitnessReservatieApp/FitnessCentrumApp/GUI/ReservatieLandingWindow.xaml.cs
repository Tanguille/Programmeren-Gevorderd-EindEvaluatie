using Domein;
using System.Collections.Generic;
using System.Windows;

namespace Gui {
    /// <summary>
    /// Interaction logic for RegistratieLandingWindow.xaml
    /// </summary>
    public partial class RegistratieLandingWindow : Window {
        private DomeinController _domeinController;
        private int _aangemeldeKlantNummer;
        public RegistratieLandingWindow(DomeinController domeinController, int aangemeldeKlantNummer) {
            DataContext = this;
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlantNummer = aangemeldeKlantNummer;

            Title = "Reservatie overzicht";

            List<string[]> reservatieStrings = _domeinController.ReservatiesToString();

            List<ReservatieLandingStrings> registratieLandingStrings = new();
            foreach (string[] reservatieString in reservatieStrings) {
                registratieLandingStrings.Add(new ReservatieLandingStrings() {
                    ReservatieNummer = "   " + reservatieString[0],
                    Datum = reservatieString[1],
                    ToestelID = reservatieString[2],
                    ToestelType = reservatieString[3],
                    TijdSlot = reservatieString[4],
                    AantalSlots = reservatieString[5]
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

