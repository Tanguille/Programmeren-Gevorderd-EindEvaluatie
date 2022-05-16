using Domein;
using System.Windows;
using Domein.Exceptions;

namespace GUI {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        private DomeinController _domeinController;
        public MainWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;
        } 
        
        private void Button_Click_Login(object sender, RoutedEventArgs e) {
            try {
                string identificatieString = LoginInputBox.Text;
                int klantNummer = _domeinController.SelecteerKlantData(identificatieString);

                //admin panel mogelijk maken
                if (_domeinController.IsBeheerder()) {
                    AdminWindow adminWindow = new AdminWindow(_domeinController);
                    this.Close();
                    adminWindow.Show();
                }
                else {
                    RegistratieWindow registratieWindow = new(_domeinController);
                    this.Close();
                    registratieWindow.Show();
                }
            }
            catch (LoginException loginE) {
                //HACK: Exceptions herzien
                MessageBox.Show(loginE.Message);
                throw new LoginException("Er ging iets mis met uw login.", loginE);            
            }           
        }
    }
}




