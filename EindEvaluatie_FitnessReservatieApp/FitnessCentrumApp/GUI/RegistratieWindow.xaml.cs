using Domein;
using Domein.Exceptions;
using System;
using System.Windows;
using System.Windows.Controls;

namespace GUI {
    /// <summary>
    /// Interaction logic for RegistratieWindow.xaml
    /// </summary>
    public partial class RegistratieWindow : Window {
        private DomeinController _domeinController;
        private int _aangemeldeKlantNummer;

        public RegistratieWindow(DomeinController domeinController, int aangemeldeKlantNummer) {
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlantNummer = aangemeldeKlantNummer;

            txtLabel_Titel.Content = "Welkom " + _domeinController.KlantToString() + "!";

            RegistrationDatePicker.BlackoutDates.AddDatesInPast();
            RegistrationDatePicker.BlackoutDates.Add(new CalendarDateRange(DateTime.Today.AddDays(8), DateTime.MaxValue));
        }

        private void ReserveerButton_Click(object sender, RoutedEventArgs e) {
            try {
                string geselecteerdToestel = ToestelSelectieBox.Text.ToLower();
                int beginUur = RegistrationHourPicker.SelectedTime.Value.Hour;
                int duur;

                if (DuurSelectieBox.SelectedIndex == 0) {
                    duur = 1;
                }
                else {
                    duur = 2;
                }

                _domeinController.MaakReservatie(RegistrationDatePicker.SelectedDate.Value, _domeinController.SelecteerToestelData(null, geselecteerdToestel), beginUur, duur);

                RegistratieLandingWindow registratieLandingWindow = new(_domeinController, _aangemeldeKlantNummer);
                this.Close();
                registratieLandingWindow.Show();
            }
            catch (ReserveerException reserveerE) {
                MessageBox.Show(reserveerE.Message);
            }
        }
    }
}
