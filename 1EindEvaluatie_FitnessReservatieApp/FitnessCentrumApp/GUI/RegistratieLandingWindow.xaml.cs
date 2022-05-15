﻿using Domein;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieLandingWindow.xaml
    /// </summary>
    public partial class RegistratieLandingWindow : Window {
        private DomeinController _domeinController;
        private Klant _aangemeldeKlant;
        public RegistratieLandingWindow(DomeinController domeinController, Klant klant) {
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlant = klant;
        }
        public string InfoString {
            get {
                return string.Format("U kan per dag max 4 uur bij ons sporten. \\n"
                    + "Maak een tweedde afspraak om meer dan 2 uur een toestel te gebruiken");
            }
        }
        private void NieuweAfspraakButton_Click(object sender, RoutedEventArgs e) {
            RegistratieWindow registratieWindow = new(_domeinController, _aangemeldeKlant);
            this.Close();
            registratieWindow.Show();
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e) {
            MainWindow mainWindow = new(_domeinController);
            this.Close();
            mainWindow.Show();
        }

    }
}
