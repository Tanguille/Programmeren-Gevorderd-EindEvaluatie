using Domein;
using System;
using System.Windows;
using System.Windows.Controls;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieWindow.xaml
    /// </summary>
    public partial class RegistratieWindow : Window {
        private DomeinController _domeinController;
        private Klant _aangemeldeKlant;
        private FitnessToestel _geselecteerdToestel;
        public RegistratieWindow(DomeinController domeinController, Klant klant) {
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlant = klant;

            txtLabel_Titel.Content = $"Welkom {klant.VoorNaam} {klant.AchterNaam}!";

            RegistrationDatePicker.BlackoutDates.AddDatesInPast();
            RegistrationDatePicker.BlackoutDates.Add(new CalendarDateRange(DateTime.Today.AddDays(8), DateTime.MaxValue));
        }

        private void ToestelWeergevenOpType(string toestelType) {
            FitnessToestel toestel = _domeinController.SelecteerToestelData(null, toestelType);
            _geselecteerdToestel = toestel;
        }

        private void ReserveerButton_Click(object sender, RoutedEventArgs e) {
            string geselecteerdToestel = ToestelSelectieBox.Text.ToLower();
            _geselecteerdToestel = _domeinController.SelecteerToestelData(null, geselecteerdToestel);
            //_domeinController.MaakReservatie(RegistrationDatePicker.Text, _aangemeldeKlant.KlantNummer, _geselecteerdToestel);
        }
    }
}
