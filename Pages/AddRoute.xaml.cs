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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TrainDataBase.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddRoute.xaml
    /// </summary>
    public partial class AddRoute : Page
    {
        TrainEntities _context;
        Route edit;
        public AddRoute(TrainEntities context)
        {
            InitializeComponent();
            _context = context;
            buttonAdd.Click += AddRouteClick;
        }
        public AddRoute(TrainEntities context, Route edit)
        {
            InitializeComponent();
            _context = context;
            this.edit = edit;
            buttonAdd.Content = "Сохранить";
            buttonAdd.Click += EditRouteClick;
            header.Content = "Редактировать маршрут";
            numBox.Text = edit.number.ToString();
            numBox.IsEnabled = false;
            startBox.Text = edit.startStation;
            finishBox.Text = edit.finishStation;
            lenBox.Text = edit.lenght.ToString();
        }

        private void EditRouteClick(object sender, RoutedEventArgs e)
        {
            try
            {
                _context.Route.Find(edit.number).number = Convert.ToInt32(numBox.Text);
                _context.Route.Find(edit.number).startStation = startBox.Text;
                _context.Route.Find(edit.number).finishStation = finishBox.Text;
                _context.Route.Find(edit.number).lenght = Convert.ToInt32(lenBox.Text);
                _context.SaveChanges();
                NavigationService.Navigate(new RoutesPage());
            }
            catch (FormatException)//если неверные данные
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddRouteClick(object sender, RoutedEventArgs e)
        {
            try
            {
                Route route = new Route()
                {
                    number = Convert.ToInt32(numBox.Text),
                    startStation = startBox.Text,
                    finishStation = finishBox.Text,
                    lenght = Convert.ToInt32(lenBox.Text)
                };
                _context.Route.Add(route);
                _context.SaveChanges();
                NavigationService.Navigate(new RoutesPage());
            }
            catch (FormatException)//если неверные данные
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception) //если повториться табельный
            {
                MessageBox.Show("Водитель с таким табельным номером уже существует", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Cancel(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
