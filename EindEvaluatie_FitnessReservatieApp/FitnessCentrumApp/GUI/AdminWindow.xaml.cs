using Domein;
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
            //TODO: ToestelToevoegen
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
            dynamic selectedItem = ToestellenListView.SelectedItem;
            return int.Parse(selectedItem.ID);
        }
    }
}
