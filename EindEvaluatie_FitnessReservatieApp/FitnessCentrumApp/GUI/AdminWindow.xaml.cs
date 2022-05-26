using Domein;
using Microsoft.CSharp.RuntimeBinder;
using System.Collections.Generic;
using System.Windows;

namespace Gui {
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window {
        private readonly DomeinController _domeinController;
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
            if (MessageBoxHandler() == 1) {
                _domeinController.VeranderToestelStatus(GetIDListView(), "inOnderhoud");
                RefreshListView();
            }

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
            if (MessageBoxHandler() == 1) {
                _domeinController.VeranderToestelStatus(GetIDListView(), "verwijderd");
                RefreshListView();
            }
        }

        /// <summary>
        /// Zorgt ervoor dat ik waarde van ID kolom uit Listview kan halen
        /// </summary>
        /// <returns></returns>
        private int GetIDListView() {
            try {
                dynamic selectedItem = ToestellenListView.SelectedItem;
                return int.Parse(selectedItem.ID);
            }
            catch (RuntimeBinderException) {
                MessageBox.Show("U heeft geen toestel geselecteerd");
                return 0;
            }
        }

        private int MessageBoxHandler() {
            int iD = GetIDListView();
            if (_domeinController.IsToestelGereserveerd(iD)) {
                MessageBox.Show("Er zijn één of meer reservaties op dit toestel!", "Opgelet!");
                return 0;
            }
            else {
                MessageBoxResult result = MessageBox.Show("Bent u zeker dat u door wilt gaan?",
                "Confirmation", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (result == MessageBoxResult.Yes) {
                    return 1;
                }
                else {
                    return 0;
                }
            }
        }
    }
}
