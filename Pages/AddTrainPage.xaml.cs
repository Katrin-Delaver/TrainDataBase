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
    /// Логика взаимодействия для AddTrainPage.xaml
    /// </summary>
    public partial class AddTrainPage : Page
    {
        TrainEntities _context;
        Train edit;
        public AddTrainPage(TrainEntities context)
        {
            InitializeComponent();
            this._context = context;
            buttonAdd.Click += AddTrain;
            stateBox.ItemsSource = _context.StateTrain.ToList();
            typeBox.ItemsSource = _context.TypeTrain.ToList();
        }

        public AddTrainPage(TrainEntities context, Train edit)
        {
            InitializeComponent();
            this._context = context;
            this.edit = edit;
            header.Content = "Редактирование трамвая";
            buttonAdd.Content = "Сохранить";
            buttonAdd.Click += EditTrain;
            stateBox.ItemsSource = _context.StateTrain.ToList();
            typeBox.ItemsSource = _context.TypeTrain.ToList();
            numBox.Text = edit.number.ToString();
            numBox.IsEnabled = false;
            stateBox.SelectedIndex = edit.stateID-1;
            typeBox.SelectedIndex = edit.typeId-1;
            timeWorkBox.Visibility = Visibility.Visible;
            timeWorkBox.Text = edit.timeWork.ToString();
        }

        private void AddTrain(object sender, RoutedEventArgs e)
        {
            try
            {
                Train train = new Train()
                {
                    number = Convert.ToInt32(numBox.Text),
                    stateID = (stateBox.SelectedItem as StateTrain).id,
                    typeId = (typeBox.SelectedItem as TypeTrain).id,
                    timeWork = 0
                };
                _context.Train.Add(train);
                _context.SaveChanges();
                NavigationService.Navigate(new TrainPage());
            }
            catch (FormatException)
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception) //если повториться табельный
            {
                MessageBox.Show("Трамвай с таким номером уже существует", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void EditTrain(object sender, RoutedEventArgs e)
        {
            try
            {
                _context.Train.Find(edit.number).stateID = (stateBox.SelectedItem as StateTrain).id;
                _context.Train.Find(edit.number).stateID = (stateBox.SelectedItem as StateTrain).id;
                _context.Train.Find(edit.number).timeWork = Convert.ToInt32(timeWorkBox.Text);
                _context.SaveChanges();
                NavigationService.Navigate(new TrainPage());

            }
            catch (Exception)//если неверные данные
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void Cancel(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
