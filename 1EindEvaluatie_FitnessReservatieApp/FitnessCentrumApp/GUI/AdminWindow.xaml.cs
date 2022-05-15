using Domein;
using System.Windows;

namespace GUI {
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window {
        private DomeinController _domeinController;
        public AdminWindow(DomeinController domeinController) {
            InitializeComponent();
            _domeinController = domeinController;
        }
    }
}
