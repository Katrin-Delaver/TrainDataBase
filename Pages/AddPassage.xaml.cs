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
    /// Логика взаимодействия для AddPassage.xaml
    /// </summary>
    public partial class AddPassage : Page
    {
        TrainEntities _context;
        Passage edit;
        public AddPassage(TrainEntities context)
        {
            InitializeComponent();
            _context = context;
            buttonAdd.Click += AddPassageClick;
            int count = context.Passage.ToList().Max(x=>x.number)+1;
            numBox.Text = count.ToString();
            driverBox.ItemsSource = context.Driver.ToList();
            TrainBox.ItemsSource = context.Train.ToList();
            RouteBox.ItemsSource = context.Route.ToList();
        }
        public AddPassage(TrainEntities context, Passage edit)
        {
            InitializeComponent();
            _context = context;
            this.edit = edit;
            buttonAdd.Click += EditPassageClick; 
            driverBox.ItemsSource = context.Driver.ToList();
            TrainBox.ItemsSource = context.Train.ToList();
            RouteBox.ItemsSource = context.Route.ToList();
            numBox.Text = edit.number.ToString();
            numBox.IsEnabled = false;
            driverBox.SelectedItem = edit.Driver;
            TrainBox.SelectedItem = edit.Train;
            RouteBox.SelectedItem = edit.Route;
            timeWorkBox.SelectedDate = edit.date;
            startTimeBox.Text = edit.timeStart.Hours + ":" + edit.timeStart.Minutes;
            finishTimeBox.Text = edit.timeFinish.Hours + ":" + edit.timeFinish.Minutes;
            buttonAdd.Content = "Сохранить изменения";
            header.Content = "Редакрирование рейса";
        }

        private void EditPassageClick(object sender, RoutedEventArgs e)
        {
            try
            {
                DateTime start = Convert.ToDateTime(startTimeBox.Text);
                DateTime finish = Convert.ToDateTime(finishTimeBox.Text);
                _context.Passage.Find(edit.number).idDriver = (driverBox.SelectedItem as Driver).tabNum;
                _context.Passage.Find(edit.number).numberTrain = (TrainBox.SelectedItem as Train).number;
                _context.Passage.Find(edit.number).numberRoute = (RouteBox.SelectedItem as Route).number;
                _context.Passage.Find(edit.number).date = Convert.ToDateTime(timeWorkBox.SelectedDate);
                _context.Passage.Find(edit.number).timeStart = new TimeSpan(start.Hour, start.Minute, 0);
                _context.Passage.Find(edit.number).timeFinish = new TimeSpan(finish.Hour, finish.Minute, 0);
                _context.SaveChanges();
                NavigationService.Navigate(new PassagePage());
            }
            catch (FormatException)
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddPassageClick(object sender, RoutedEventArgs e)
        {
            try
            {
                DateTime start = Convert.ToDateTime(startTimeBox.Text);
                DateTime finish = Convert.ToDateTime(finishTimeBox.Text);
                Passage passage = new Passage()
                {
                    number = Convert.ToInt32(numBox.Text),
                    idDriver = (driverBox.SelectedItem as Driver).tabNum,
                    numberTrain = (TrainBox.SelectedItem as Train).number,
                    numberRoute = (RouteBox.SelectedItem as Route).number,
                    date = Convert.ToDateTime(timeWorkBox.SelectedDate),
                    timeStart = new TimeSpan(start.Hour, start.Minute, 0),
                    timeFinish = new TimeSpan(finish.Hour, finish.Minute, 0)
                };
                _context.Passage.Add(passage);
                _context.SaveChanges();
                NavigationService.Navigate(new PassagePage());
            }
            catch (FormatException)
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception) //если повториться табельный
            {
                MessageBox.Show("Рейс с таким номером уже существует", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Cancel(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
