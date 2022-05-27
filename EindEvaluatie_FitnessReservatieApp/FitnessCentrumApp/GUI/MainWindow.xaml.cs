using Domein;
using Domein.Exceptions;
using System.Windows;

namespace Gui {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        private readonly DomeinController _domeinController;
        private int _aangemeldeKlantNummer;
        public MainWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;

            Title = "Login Scherm";
            LoginInputBox.Focus();
        }

        private void Button_Click_Login(object sender, RoutedEventArgs e) {
            try {
                string identificatieString = LoginInputBox.Text;
                _aangemeldeKlantNummer = _domeinController.SelecteerKlantData(identificatieString);

                //admin panel mogelijk maken
                if (_domeinController.IsBeheerder()) {
                    AdminWindow adminWindow = new(_domeinController);
                    Close();
                    adminWindow.Show();
                }
                if (!_domeinController.IsBeheerder()) {
                    RegistratieWindow registratieWindow = new(_domeinController, _aangemeldeKlantNummer);
                    Close();
                    registratieWindow.Show();
                }
            }
            catch (LoginException loginE) {
                MessageBox.Show(loginE.Message);
            }
            catch (RepoException repoE) {
                MessageBox.Show(repoE.Message);
            }
        }
    }
}




