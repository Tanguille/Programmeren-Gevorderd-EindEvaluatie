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
            //TODO:
            //_domeinController.VeranderToestelStatus(iD, "onderhoud");
            RefreshListView();
        }

        private void UitOnderhoudButton_Click_1(object sender, RoutedEventArgs e) {
            //_domeinController.VeranderToestelStatus(iD, "beschikbaar");
            RefreshListView();
        }

        private void ToevoegButton_Click(object sender, RoutedEventArgs e) {
            RefreshListView();
        }

        private void VerwijderButton_Click(object sender, RoutedEventArgs e) {
            //_domeinController.VeranderToestelStatus(iD, "verwijderd");
            RefreshListView();
        }
    }
}
