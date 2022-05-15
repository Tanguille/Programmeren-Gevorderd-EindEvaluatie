using Domein;
using System.Windows;

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
            string identificatieString = LoginInputBox.Text;
            Klant klant = _domeinController.SelecteerKlantData(identificatieString);

            //admin panel mogelijk maken
            if (klant.EmailAdres == "beheerder@tangfit.be") {
                AdminWindow adminWindow = new AdminWindow(_domeinController);
                this.Close();
                adminWindow.Show();
            }
            else {
                RegistratieWindow registratieWindow = new(_domeinController, klant);
                this.Close();
                registratieWindow.Show();
            }
        }
    }
}




