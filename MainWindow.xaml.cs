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

namespace TrainDataBase
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            myFrame.Navigate(new Pages.DriverPage()); 
        }
        //changes in repository
        private void GoToDrivers(object sender, RoutedEventArgs e)
        {
            myFrame.Navigate(new Pages.DriverPage());
        }

        private void GotoTrains(object sender, RoutedEventArgs e)
        {
            myFrame.Navigate(new Pages.TrainPage());
        }

        private void GotoPassage(object sender, RoutedEventArgs e)
        {
            myFrame.Navigate(new Pages.PassagePage());
        }

        private void GotoRoutes(object sender, RoutedEventArgs e)
        {

            myFrame.Navigate(new Pages.RoutesPage());
        }

        private void GotoQuery(object sender, RoutedEventArgs e)
        {
            myFrame.Navigate(new Pages.QueryThreeTables());

        }
    }
}
