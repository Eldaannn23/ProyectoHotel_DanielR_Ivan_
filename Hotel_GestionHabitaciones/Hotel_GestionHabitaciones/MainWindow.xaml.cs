using System.Windows;

namespace Hotel_GestionHabitaciones
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = new MainViewModel();   // de aqui salen los datos de los Binding
        }

        // Login. Se hace aqui porque el PasswordBox no permite Binding (por seguridad).
        private void Entrar_Click(object sender, RoutedEventArgs e)
        {
            if (txtUsuario.Text == "admin" && txtPassword.Password == "1234")
            {
                panelLogin.Visibility = Visibility.Collapsed;   // ocultamos el login
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos");
            }
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
