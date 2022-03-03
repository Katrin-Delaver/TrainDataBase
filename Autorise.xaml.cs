using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace TrainDataBase
{
    /// <summary>
    /// Логика взаимодействия для Autorise.xaml
    /// </summary>
    public partial class Autorise : Window
    {
        TrainEntities _context;
        public Autorise()
        {
            InitializeComponent();
            _context = new TrainEntities(); //ПОдключение к БД
            tabBox.ItemsSource = _context.User.ToList(); //Закинуть в комбобокс список пользоватетелей. Из-за привязки выведутся только таб.нмоера
        }
        public void ChekAutorisation() //проверка авторизации
        {
            if (tabBox.SelectedItem == null || string.IsNullOrEmpty(passBox.Password)) //если не выбран таб.№ или пароль не введен
            {
                MessageBox.Show("Выберите табельный номер и введите пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Information);
                return; //выход из функции авторизации

            }
            User user = tabBox.SelectedItem as User; //получаем из комбобокса пользователя
            String pas = passBox.Password; //получаем пароль который чел ввел
            if (user.password.Equals(pas)) //если пароль совпадает с паролем пользователя
            {
                MessageBox.Show("Авторизация успешна!", "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
                MainWindow main = new MainWindow(); //создаем основное окно
                main.Show(); //открываем окно
                main.Closed += WindowClosed;//Создаем функцию, которая среагирует, если MainWindow закроется      
                this.Hide(); //скрываем окно авторизации
            }
            else
            {
                MessageBox.Show("Вы ввели неправильный пароль!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }        
        }


        private void EnterClick(object sender, RoutedEventArgs e) //нажатие на кнопку "Вход"
        {
            ChekAutorisation(); 
        }

        private void WindowClosed(object sender, EventArgs e) //Если MainWindow закрылась
        {
            this.Close(); //закрыть окно авторизации, которые невидимо
        }

        private void EnterDown(object sender, KeyEventArgs e) //нажатие на кнопку на клавиатуре
        {
            if (e.Key == Key.Enter) 
            { 
                ChekAutorisation();
            }
            if (e.Key == Key.Escape)
            {
                this.Close();
            }
        }
    }
}
