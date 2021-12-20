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
    /// Логика взаимодействия для TrainPage.xaml
    /// </summary>
    public partial class TrainPage : Page
    {
        TrainEntities _context;
        public TrainPage()
        {
            InitializeComponent();
            _context = new TrainEntities();
            trainTable.ItemsSource = _context.Train.ToList();
            List<StateTrain> trainStates = _context.StateTrain.ToList();
            StateTrain allState = new StateTrain();
            allState.Titile = "Все трамваи";
            trainStates.Insert(0, allState);
            stateTrainComboBox.ItemsSource = trainStates;
        }

        private void RefreshTrain()
        {
            List<Train> list = _context.Train.ToList();
            if (stateTrainComboBox.SelectedIndex == 0)
            { 
            
            }
            else
            {
                StateTrain category = stateTrainComboBox.SelectedItem as StateTrain;
                list = list.Where(x => x.stateID == category.id).ToList();
            }
            trainTable.ItemsSource = list;
        }

        private void AddTrain(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddTrainPage(_context));
        }

        private void EditTrain(object sender, RoutedEventArgs e)
        {
            Train edit = trainTable.SelectedItem as Train;
            NavigationService.Navigate(new AddTrainPage(_context, edit));
        }

        private void DeleteTrain(object sender, RoutedEventArgs e)
        {
            Train deleted = trainTable.SelectedItem as Train;
            _context.Train.Remove(deleted);
            _context.SaveChanges();
            trainTable.ItemsSource = _context.Train.ToList();
        }

        private void NewCategory(object sender, SelectionChangedEventArgs e)
        {
            RefreshTrain();
        }
    }
}
