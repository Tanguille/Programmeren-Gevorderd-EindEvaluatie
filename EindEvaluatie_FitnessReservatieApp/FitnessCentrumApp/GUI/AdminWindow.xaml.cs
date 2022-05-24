using Domein;
using Microsoft.CSharp.RuntimeBinder;
using System.Collections.Generic;
using System.Windows;

namespace Gui {
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window {
        private DomeinController _domeinController;
        public AdminWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;

            Title = "Beheerder paneel";
            RefreshListView();
        }

        private void RefreshListView() {
            List<string[]> toestellenStrings = _domeinController.ToestellenToString();

            List<AdminPanelStrings> adminPanelStrings = new();
            foreach (string[] reservatieString in toestellenStrings) {
                adminPanelStrings.Add(new AdminPanelStrings() {
                    ID = reservatieString[0],
                    ToestelType = reservatieString[1],
                    ToestelStatus = reservatieString[2],
                });
            }
            ToestellenListView.ItemsSource = adminPanelStrings;
        }

        private void InOnderhoudButton_Click(object sender, RoutedEventArgs e) {
            _domeinController.VeranderToestelStatus(GetIDListView(), "inOnderhoud");
            RefreshListView();
        }

        private void UitOnderhoudButton_Click_1(object sender, RoutedEventArgs e) {
            _domeinController.VeranderToestelStatus(GetIDListView(), "beschikbaar");
            RefreshListView();
        }

        private void ToevoegButton_Click(object sender, RoutedEventArgs e) {
            _domeinController.ToestelToevoegenDatabank(ToestelSelectieComboBox.Text.ToString().ToLower());
            RefreshListView();
        }

        private void VerwijderButton_Click(object sender, RoutedEventArgs e) {
            _domeinController.VeranderToestelStatus(GetIDListView(), "verwijderd");
            RefreshListView();
        }

        /// <summary>
        /// Zorgt ervoor dat ik waarde van ID kolom uit Listview kan halen
        /// </summary>
        /// <returns></returns>
        private int GetIDListView() {
            try {
                dynamic selectedItem = ToestellenListView.SelectedItem;
                int iD = int.Parse(selectedItem.ID);

                if (_domeinController.IsToestelGereserveerd(iD)) {
                    MessageBoxResult result = MessageBox.Show("Bent u zeker dat u door wilt gaan? Er zijn één of meer reservaties op dit toestel.",
                    "Opgelet!", MessageBoxButton.OKCancel, MessageBoxImage.Warning);
                    if (result == MessageBoxResult.OK) {
                        return iD;
                    }
                    else {
                        return 0;
                    }
                }
                else {
                    MessageBoxResult result = MessageBox.Show("Bent u zeker dat u door wilt gaan?",
                    "Confirmation", MessageBoxButton.OKCancel, MessageBoxImage.Question);
                    if (result == MessageBoxResult.OK) {
                        return iD;
                    }
                    else {
                        return 0;
                    }
                }
            }
            catch (RuntimeBinderException) {
                MessageBox.Show("U heeft geen toestel geselecteerd");
                return 0;
            }
        }
    }
}
