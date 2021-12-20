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
    /// Логика взаимодействия для RoutePage.xaml
    /// </summary>
    public partial class PassagePage : Page
    {
        TrainEntities _context;
        public PassagePage()
        {
            InitializeComponent();
            _context = new TrainEntities();
            passageTable.ItemsSource = _context.Passage.ToList();
            List<string> trains = new List<string>();
            _context.Train.ToList().ForEach(x => trains.Add(x.number.ToString()));
            trains.Insert(0,"Все вагоны");
            trainComboBox.ItemsSource = trains;
            trainComboBox.SelectedIndex = 0;
            List<string> routes = new List<string>();
            _context.Route.ToList().ForEach(x => routes.Add(x.number.ToString()));
            routes.Insert(0,"Все маршруты");
            routeComboBox.ItemsSource = routes;
            routeComboBox.SelectedIndex = 0;
            RefreshPassage();
        }

        private void RefreshPassage()
        {
            List<Passage> passages = _context.Passage.ToList();
            if (trainComboBox.SelectedIndex > 0)
            {
                passages = passages.Where(x => x.numberTrain == Convert.ToInt32(trainComboBox.SelectedItem.ToString())).ToList();
            }
            if (routeComboBox.SelectedIndex>0)
            {
                passages = passages.Where(x => x.numberRoute == Convert.ToInt32(routeComboBox.SelectedItem.ToString())).ToList();
            }
            string searchDriver = driverBox.Text;
            if (!string.IsNullOrWhiteSpace(searchDriver))
            {
                try
                {
                    int tabNum = Convert.ToInt32(searchDriver);
                    passages = passages.Where(x => x.idDriver.ToString().Contains(tabNum.ToString())).ToList();
                }
                catch(FormatException)
                {
                    passages = passages.Where(x => x.Driver.name.Contains(searchDriver)).ToList();
                }
            }
            passageTable.ItemsSource = passages;
        }

        private void EditPassage(object sender, RoutedEventArgs e)
        {
            Passage passage = passageTable.SelectedItem as Passage;
            NavigationService.Navigate(new AddPassage(_context, passage));
        }

        private void DeletePassage(object sender, RoutedEventArgs e)
        {
            Passage passage = passageTable.SelectedItem as Passage;
            _context.Passage.Remove(passage);
            _context.SaveChanges();
            passageTable.ItemsSource = _context.Passage.ToList();
        }

        private void AddPassage(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPassage(_context));
        }

        private void EnterDriver(object sender, TextChangedEventArgs e)
        {
            RefreshPassage();
        }

        private void ChangeTrain(object sender, SelectionChangedEventArgs e)
        {
            RefreshPassage();
        }

        private void ChangeRoute(object sender, SelectionChangedEventArgs e)
        {
            RefreshPassage();
        }
    }
}
