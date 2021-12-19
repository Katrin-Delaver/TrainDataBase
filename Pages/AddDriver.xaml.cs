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
    /// Логика взаимодействия для AddDriver.xaml
    /// </summary>
    public partial class AddDriver : Page
    {
        TrainEntities _context;
        Driver edit;
        public AddDriver(TrainEntities context)//конструктор для добавления
        {
            InitializeComponent();
            this._context = context;
            buttonAdd.Click += AddDriverClick;//назначить обработчик нажания кнопки
        }

        public AddDriver(TrainEntities context, Driver edit) //конструктор для редактирования
        {
            InitializeComponent();
            this._context = context;
            buttonAdd.Click += EditDriverClick;
            buttonAdd.Content = "Сохранить";
            categLable.Visibility = Visibility.Visible;
            categoryBox.Visibility = Visibility.Visible;
            ExperienseBox.Visibility = Visibility.Visible;
            expLable.Visibility = Visibility.Visible;
            header.Content = "Редактирование водителя";
            tabBox.Text = edit.tabNum.ToString();
            tabBox.IsEnabled = false;
            fioBox.Text = edit.name;
            dateBox.Text = edit.dateOfStartWork.ToString();
            dateBox.SelectedDate = edit.dateOfStartWork;
            categoryBox.ItemsSource = context.CategoryOfDriver.ToList();
            categoryBox.SelectedItem = edit.CategoryOfDriver;
            ExperienseBox.Text = edit.troubleFreeExp.ToString();
            this.edit = edit;
        }

        private void EditDriverClick(object sender, RoutedEventArgs e)
        {
            try //попытка изменить данные в БД. Данные взяли из текстБоксов
            {               
                edit.name = fioBox.Text;                
                edit.dateOfStartWork = Convert.ToDateTime(dateBox.SelectedDate);
                edit.troubleFreeExp = Convert.ToDecimal(ExperienseBox.Text);
                edit.idCategory = (categoryBox.SelectedItem as CategoryOfDriver).id;
                edit.CategoryOfDriver = categoryBox.SelectedItem as CategoryOfDriver;
                _context.Driver.Find(edit.tabNum).name = edit.name;
                _context.Driver.Find(edit.tabNum).idCategory = edit.idCategory;
                _context.Driver.Find(edit.tabNum).CategoryOfDriver = edit.CategoryOfDriver;
                _context.Driver.Find(edit.tabNum).dateOfStartWork = edit.dateOfStartWork;
                _context.Driver.Find(edit.tabNum).troubleFreeExp = edit.troubleFreeExp;
                _context.SaveChanges();
                NavigationService.Navigate(new DriverPage()); //вернуться обратно
            }
            catch (Exception)
            {
                MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }

        private void AddDriverClick(object sender, RoutedEventArgs e)
        {
            try
            {
                Driver driver = new Driver() //создание нового водителя
                {
                    tabNum = Convert.ToInt32(tabBox.Text),
                    name = fioBox.Text,
                    idCategory = 2,
                    dateOfStartWork = Convert.ToDateTime(dateBox.SelectedDate),
                    troubleFreeExp = 0
                };
                _context.Driver.Add(driver);
                _context.SaveChanges();
                NavigationService.Navigate(new DriverPage());

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
