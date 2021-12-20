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
    /// Логика взаимодействия для QueryThreeTables.xaml
    /// </summary>
    public partial class QueryThreeTables : Page
    {
        TrainEntities _context;
        public QueryThreeTables()
        {
            InitializeComponent();
            _context = new TrainEntities();
            //получение данных из БД
            List<Passage> passages = _context.Passage.ToList();
            List<Route> routes = _context.Route.ToList();
            List<Driver> drivers = _context.Driver.ToList();
            List<Train> trains = _context.Train.ToList();
            List<TypeTrain> types = _context.TypeTrain.ToList();
            //соединение таблиц Рейс и Маршрут. Из рейса берем тномер водителя, номер маршрута, 
            //номер трамвая, дату.
            //из Маршрут берем длину маршрута
            var list = passages.Join(routes,
                x => x.numberRoute,
                y => y.number,
                (x, y) => new
                {
                    tabNum = x.idDriver,
                    route = x.numberRoute,
                    train = x.numberTrain,
                    date = x.date,
                    len = y.lenght
                }).ToList();
            //соединение созданной таблицы и Водитель. К основной таблице доавбляем имя водителя
            
            var list2 = list.Join(drivers,
                x => x.tabNum,
                y => y.tabNum,
                (x, y) => new
                {
                    tabNum = x.tabNum,
                    route = x.route,
                    train = x.train,
                    date = x.date,
                    len = x.len,
                    name = y.name
                }).ToList();
            //соединение созданной таблицы и Трамвай. К основной таблице доавбляем id типа трамвая
            
            var list3 = list2.Join(trains,
                x => x.train,
                y => y.number,
                (x, y) => new
                {
                    tabNum = x.tabNum,
                    route = x.route,
                    train = x.train,
                    len = x.len,
                    date = x.date,
                    name = x.name,
                    typeId = y.typeId
                });
            //соединение созданной таблицы и ТипТрамвая. К основной таблице доавбляем название типа трамвая

            var finalList = list3.Join(types,
                x => x.typeId,
                y => y.id,
                (x, y) => new {                    
                    route = x.route,
                    train = x.train,
                    len = x.len,
                    date = x.date.ToShortDateString(),
                    name = x.name,                    
                    type = y.Title
                }).ToList();
            finalTable.ItemsSource = finalList;
        }
    }
}
