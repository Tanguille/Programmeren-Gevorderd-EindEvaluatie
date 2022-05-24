using Domein;
using Domein.Exceptions;
using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace Gui {
    /// <summary>
    /// Interaction logic for RegistratieWindow.xaml
    /// </summary>
    public partial class RegistratieWindow : Window {
        private DomeinController _domeinController;
        private int _aangemeldeKlantNummer;

        private List<int> BeginUurList = new();

        public RegistratieWindow(DomeinController domeinController, int aangemeldeKlantNummer) {
            InitializeComponent();
            _domeinController = domeinController;
            _aangemeldeKlantNummer = aangemeldeKlantNummer;

            Title = "Reservatiescherm";
            RefreshCombobox();

            txtLabel_Titel.Content = "Welkom " + _domeinController.KlantToString() + "!";

            RegistrationDatePicker.BlackoutDates.AddDatesInPast();
            RegistrationDatePicker.BlackoutDates.Add(new CalendarDateRange(DateTime.Today.AddDays(8), DateTime.MaxValue));
        }

        private void ReserveerButton_Click(object sender, RoutedEventArgs e) {
            try {
                DateTime datum = RegistrationDatePicker.SelectedDate.Value;
                string geselecteerdToestel = ToestelSelectieBox.Text.ToLower();
                int beginUurIndex = RegistrationHourComboBox.SelectedIndex;
                int beginUur = BeginUurList[beginUurIndex];
                int duur;

                if (DuurSelectieBox.SelectedIndex == 0) {
                    duur = 1;
                }
                else {
                    duur = 2;
                }

                _domeinController.MaakReservatie(datum, beginUur, duur, geselecteerdToestel);

                RegistratieLandingWindow registratieLandingWindow = new(_domeinController, _aangemeldeKlantNummer);
                Close();
                registratieLandingWindow.Show();
            }
            catch (ReserveerException reserveerE) {
                MessageBox.Show(reserveerE.Message);
            }
            catch (FitnessToestelException toestelE) {
                MessageBox.Show(toestelE.Message);
            }
        }

        private List<string> HourPickerData() {
            BeginUurList.Clear();
            List<string> beginSlotList = new();
            if (RegistrationDatePicker.SelectedDate.Value > DateTime.Today) {
                for (int i = 8; i < 22; i++) {
                    beginSlotList.Add($"{i} uur");
                    BeginUurList.Add(i);
                }
            }
            else {
                for (int i = DateTime.Now.AddHours(1).Hour; i < 22; i++) {
                    beginSlotList.Add($"{i} uur");
                    BeginUurList.Add(i);
                }
            }
            return beginSlotList;
        }

        private void RefreshCombobox() {
            if (RegistrationHourComboBox is not null) {
                RegistrationHourComboBox.ItemsSource = HourPickerData();
            }
            //Als het te laat is om nog afspraak te maken wordt bij datepicker automatisch morgen geselecteerd
            else if (DateTime.Now.Hour > 21) {
                RegistrationDatePicker.SelectedDate = DateTime.Today.AddDays(1);
            }
        }

        private void RegistrationDatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e) {
            RefreshCombobox();
        }
    }
}
