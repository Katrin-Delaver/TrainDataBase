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
    /// Логика взаимодействия для RoutesPage.xaml
    /// </summary>
    public partial class RoutesPage : Page
    {
        TrainEntities _context;
        public RoutesPage()
        {
            InitializeComponent();
            _context = new TrainEntities();
            routeTable.ItemsSource = _context.Route.ToList();
        }

        private void AddRouteClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddRoute(_context));
        }

        private void EditRouteClick(object sender, RoutedEventArgs e)
        {
            Route route = routeTable.SelectedItem as Route;
            NavigationService.Navigate(new AddRoute(_context, route));
        }

        private void DeleteRouteClick(object sender, RoutedEventArgs e)
        {
            Route route = routeTable.SelectedItem as Route;
            _context.Route.Remove(route);
            _context.SaveChanges();
            routeTable.ItemsSource = _context.Route.ToList();

        }
    }
}
