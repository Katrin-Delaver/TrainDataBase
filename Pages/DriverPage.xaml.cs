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
    /// Логика взаимодействия для DriverPage.xaml
    /// </summary>
    public partial class DriverPage : Page
    {
        TrainEntities _context; //объект базы данных
        public DriverPage()
        {
            InitializeComponent();
            _context = new TrainEntities(); //получаем данные из бд
            driverTable.ItemsSource = _context.Driver.ToList(); //закидываем строки из таблицы бд в таблицу на формме
            List<CategoryOfDriver> categories = _context.CategoryOfDriver.ToList(); //получаем список категорий водителей
            categories.Add(new CategoryOfDriver() { id=3, Title="Все категории" }); //добавляем пункт "все категории"
            categoryComboBox.ItemsSource = categories; //закидываем в комбобокс
        }

        //нажатие на кнопку "добавить" (круглый плюсик)
        private void AddDriverClick(object sender, RoutedEventArgs e) 
        {
            NavigationService.Navigate(new AddDriver(_context)); //перейти на страницу добавления

        }

        //клик по контекстному меню "редактировать"
        private void EditMenuClick(object sender, RoutedEventArgs e) 
        {
            Driver edit = driverTable.SelectedItem as Driver; //преобрпазование выбранной строки таблицы в водителя
            NavigationService.Navigate(new AddDriver(_context, edit)); //переход на страницу редактирвоания
        }


        //клик по контекстному меню "удалить"
        private void DeleteMenuClick(object sender, RoutedEventArgs e)
        {
            //получение удаляемого водителя
            Driver driver = driverTable.SelectedItem as Driver;
            //запрос подтвеждения через MessageBox
            MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите удалить водителя "+driver.name+"?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {               
                _context.Driver.Remove(driver);
                _context.SaveChanges();
                driverTable.ItemsSource = _context.Driver.ToList();
            }
        }

        //применение двух фильтров
        private void RefreshData()
        {
            //получение всех записей таблицы БД
            List<Driver> list = _context.Driver.ToList();
            //получение выбранной категории
            CategoryOfDriver category = categoryComboBox.SelectedItem as CategoryOfDriver;
            //если в комбобокс не пусто
            if (category != null)
            {
                //если выбрано все категории, то выбрать все записи списка
                if (category.id == 3 )
                    list = _context.Driver.ToList();
                else //если выбрана конктерная категория
                {
                    list = list.Where(x => x.idCategory == category.id).ToList();
                }
            }
            //если поле для ввода критерия по безаварийному стажу пустое или заполнено пробелами
            if (string.IsNullOrWhiteSpace(freeExp.Text))
                list = _context.Driver.ToList(); //закинуть в список все записи
            else //если там не пусто
            {
                try //попытаться преобразовать в число
                {
                    decimal critery = Convert.ToDecimal(freeExp.Text);
                    //выбрать тех, у кого стаж больше критерия
                    list = list.Where(x => x.troubleFreeExp >= critery).ToList();
                }
                catch (Exception) //если неправильно введено число
                { 
                    MessageBox.Show("Вы ввели некорректные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            }
            driverTable.ItemsSource = list; //назначить список как источник данных
        }

       
        //при изменении элемента в комбобокс
        private void ChangeCategory(object sender, SelectionChangedEventArgs e)
        {
            RefreshData();
        }

        //при нажатии на кнопку фильтр
        private void Filter(object sender, RoutedEventArgs e)
        {
            RefreshData();
        }

        //при нажатии на кнопку сбросить фильтр
        private void NoFilter(object sender, RoutedEventArgs e)
        {
            driverTable.ItemsSource = _context.Driver.ToList();
            freeExp.Text = "";
            categoryComboBox.SelectedIndex = 3; 
        }
    }
}
