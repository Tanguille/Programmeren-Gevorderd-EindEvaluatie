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
        
        public RegistratieWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;            

            txtLabel_Titel.Content = "Welkom " + domeinController.GetKlantNaam() + "!";

            RegistrationDatePicker.BlackoutDates.AddDatesInPast();
            RegistrationDatePicker.BlackoutDates.Add(new CalendarDateRange(DateTime.Today.AddDays(8), DateTime.MaxValue));
        }

        //TODO: Toepassen
        private void ToestelWeergevenOpType(string toestelType) {
            string toestelInfo = _domeinController.SelecteerToestelData(null, toestelType);            
        }

        private void ReserveerButton_Click(object sender, RoutedEventArgs e) {
            string geselecteerdToestel = ToestelSelectieBox.Text.ToLower();
            //TODO: Reservatie implementeren
            //_geselecteerdToestel = _domeinController.SelecteerToestelData(null, geselecteerdToestel);
            //_domeinController.MaakReservatie(RegistrationDatePicker.Text, _aangemeldeKlant.KlantNummer, _geselecteerdToestel);

            RegistratieLandingWindow registratieLandingWindow = new(_domeinController);
            this.Close();
            registratieLandingWindow.Show();
        }
    }
}
