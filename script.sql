USE [master]
GO
/****** Object:  Database [Train]    Script Date: 19.12.2021 19:25:07 ******/
CREATE DATABASE [Train]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Train', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.RDCB\MSSQL\DATA\Train.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Train_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.RDCB\MSSQL\DATA\Train_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Train] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Train].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Train] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Train] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Train] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Train] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Train] SET ARITHABORT OFF 
GO
ALTER DATABASE [Train] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Train] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Train] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Train] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Train] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Train] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Train] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Train] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Train] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Train] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Train] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Train] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Train] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Train] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Train] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Train] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Train] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Train] SET RECOVERY FULL 
GO
ALTER DATABASE [Train] SET  MULTI_USER 
GO
ALTER DATABASE [Train] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Train] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Train] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Train] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Train] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Train] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Train', N'ON'
GO
ALTER DATABASE [Train] SET QUERY_STORE = OFF
GO
USE [Train]
GO
/****** Object:  Table [dbo].[CategoryOfDriver]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryOfDriver](
	[id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryOfDriver] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[tabNum] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[dateOfStartWork] [date] NOT NULL,
	[idCategory] [int] NOT NULL,
	[troubleFreeExp] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[tabNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passage]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passage](
	[number] [int] NOT NULL,
	[idDriver] [int] NOT NULL,
	[numberRoute] [int] NOT NULL,
	[numberTrain] [int] NOT NULL,
	[date] [date] NOT NULL,
	[timeStart] [time](7) NOT NULL,
	[timeFinish] [time](7) NOT NULL,
 CONSTRAINT [PK_Passage] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[number] [int] NOT NULL,
	[startStation] [nvarchar](100) NOT NULL,
	[finishStation] [nvarchar](100) NOT NULL,
	[lenght] [int] NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTrain]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTrain](
	[id] [int] NOT NULL,
	[Titile] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_StateTrain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Train]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Train](
	[number] [int] NOT NULL,
	[typeId] [int] NOT NULL,
	[stateID] [int] NOT NULL,
	[timeWork] [int] NOT NULL,
 CONSTRAINT [PK_Train] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTrain]    Script Date: 19.12.2021 19:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTrain](
	[id] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TypeTrain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CategoryOfDriver] ([id], [Title]) VALUES (1, N'Высшая')
INSERT [dbo].[CategoryOfDriver] ([id], [Title]) VALUES (2, N'Первая')
GO
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (255, N'Паринская М.И.', CAST(N'2019-04-25' AS Date), 2, CAST(407135.33 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1005, N'Жамбалов Ш.Д.', CAST(N'2015-06-08' AS Date), 2, CAST(310353.02 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1006, N'Граф О.А.', CAST(N'2002-06-12' AS Date), 2, CAST(437656.36 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1035, N'Еранский И.В.', CAST(N'2019-08-16' AS Date), 2, CAST(455065.07 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1061, N'Брындина В.В.', CAST(N'2006-05-18' AS Date), 2, CAST(336123.34 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1110, N'Грехова С.И.', CAST(N'2016-10-06' AS Date), 2, CAST(34645.44 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1125, N'Кройтор Т.П.', CAST(N'2014-05-04' AS Date), 1, CAST(39856.56 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1294, N'Афанасьев Н.Ф.', CAST(N'2011-09-13' AS Date), 2, CAST(150226.25 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1327, N'Алимова С.В.', CAST(N'2014-12-10' AS Date), 2, CAST(233838.01 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (1511, N'Дашиева И.Д.', CAST(N'2020-06-22' AS Date), 2, CAST(343956.86 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2074, N'Кечкина М.А.', CAST(N'2017-04-14' AS Date), 2, CAST(6141.99 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2124, N'Соловьева Ю.П.', CAST(N'2001-01-04' AS Date), 2, CAST(308782.87 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2126, N'Черных А.М.', CAST(N'2016-09-05' AS Date), 2, CAST(312702.69 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2294, N'Цыдыпова М.А.', CAST(N'2007-08-09' AS Date), 2, CAST(360078.67 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2407, N'Пинигина Н.В.', CAST(N'2015-06-29' AS Date), 2, CAST(250991.71 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2551, N'Карпина Т.М.', CAST(N'2017-01-11' AS Date), 2, CAST(327705.61 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2657, N'Макшаева А.В.', CAST(N'2011-05-14' AS Date), 2, CAST(224468.94 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2719, N'Бабошина Т.В.', CAST(N'2014-05-02' AS Date), 2, CAST(426402.26 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (2924, N'Григорьева Н.П.', CAST(N'2002-09-18' AS Date), 2, CAST(128754.80 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3235, N'Евреева Т.М.', CAST(N'2003-03-02' AS Date), 2, CAST(310618.40 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3486, N'Тагангаева С.В.', CAST(N'2018-12-13' AS Date), 2, CAST(284034.18 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3535, N'Цыренова Н.А.', CAST(N'2001-12-28' AS Date), 2, CAST(153407.90 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3589, N'Липунова Н.А.', CAST(N'2011-04-05' AS Date), 2, CAST(485834.37 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3696, N'Белева Т.М.', CAST(N'2020-09-25' AS Date), 2, CAST(347281.34 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3699, N'Тагангаев А.С.', CAST(N'2005-03-22' AS Date), 2, CAST(13400.61 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3729, N'Тарасенко И.Ю.', CAST(N'2005-12-17' AS Date), 2, CAST(415452.48 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3752, N'Сластина Л.А.', CAST(N'2004-09-14' AS Date), 2, CAST(486800.85 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3773, N'Родионова Н.П.', CAST(N'2017-04-03' AS Date), 2, CAST(258270.84 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3791, N'Шалхарова Ц.Д.', CAST(N'2016-04-18' AS Date), 2, CAST(108119.35 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3799, N'Новожилова О.А.', CAST(N'2007-11-29' AS Date), 2, CAST(31298.30 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3837, N'Сороковикова С.С.', CAST(N'2010-06-10' AS Date), 2, CAST(22283.29 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3970, N'Черниговская Н.А.', CAST(N'2020-10-17' AS Date), 2, CAST(423290.48 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (3983, N'Котова М.В.', CAST(N'2014-05-24' AS Date), 2, CAST(93430.86 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4041, N'Цыренова С.Д.', CAST(N'2012-02-15' AS Date), 2, CAST(307937.58 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4083, N'Головлев В.С.', CAST(N'2005-11-20' AS Date), 2, CAST(456776.54 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4256, N'Чаузова Н.А.', CAST(N'2006-05-16' AS Date), 2, CAST(227407.96 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4257, N'Бороденко Л.Б.', CAST(N'2013-02-05' AS Date), 2, CAST(255860.22 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4266, N'Милюшина Т.В.', CAST(N'2018-11-08' AS Date), 2, CAST(21155.92 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4272, N'Бадмацыренова Ю.Д.', CAST(N'2015-12-08' AS Date), 2, CAST(267928.32 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4287, N'Орлова Н.Ю.', CAST(N'2004-04-24' AS Date), 2, CAST(492328.93 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4370, N'Жамбалова Ю.Н.', CAST(N'2019-02-25' AS Date), 2, CAST(65010.33 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4372, N'Догдонова Л.Ю.', CAST(N'2003-04-10' AS Date), 2, CAST(408580.40 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4377, N'Лизунова С.В.', CAST(N'2010-07-25' AS Date), 2, CAST(497597.05 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4440, N'Потапова Н.А.', CAST(N'2003-07-04' AS Date), 2, CAST(203467.15 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4460, N'Иванова Е.Ф.', CAST(N'2005-12-01' AS Date), 2, CAST(154215.92 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4476, N'Плюснина М.В.', CAST(N'2009-03-18' AS Date), 2, CAST(9449.61 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4485, N'Савостина Т.Ю.', CAST(N'2001-03-21' AS Date), 2, CAST(29120.02 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4561, N'Ринчинов Ж.Б.', CAST(N'2020-08-25' AS Date), 2, CAST(33383.18 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4562, N'Дабажалсанов Д.М.', CAST(N'2008-10-05' AS Date), 2, CAST(334182.76 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4566, N'Протопопова Е.С.', CAST(N'2016-12-16' AS Date), 2, CAST(396906.67 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4632, N'Метелица Н.Б.', CAST(N'2004-11-04' AS Date), 2, CAST(40519.10 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4706, N'Васильева М.Н.', CAST(N'2007-03-22' AS Date), 2, CAST(237971.28 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4773, N'Кизилева Н.И.', CAST(N'2003-11-03' AS Date), 2, CAST(413529.26 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (4776, N'Усольцева И.А.', CAST(N'2005-12-25' AS Date), 2, CAST(12502.24 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (6462, N'Михайлова Е.И.', CAST(N'2009-02-19' AS Date), 2, CAST(452606.97 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (6543, N'Таракановская Ю.Г.', CAST(N'2019-10-31' AS Date), 2, CAST(399805.37 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7060, N'Цыренова С.Х.', CAST(N'2008-02-24' AS Date), 2, CAST(453039.37 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7092, N'Емельянова О.Г.', CAST(N'2010-03-25' AS Date), 2, CAST(81654.39 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7288, N'Эрдыниева С.С-Д.', CAST(N'2006-11-30' AS Date), 2, CAST(9753.87 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7341, N'Шодотова Н.Ю.', CAST(N'2000-06-02' AS Date), 2, CAST(56339.26 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7375, N'Сергеева Е.П.', CAST(N'2001-07-01' AS Date), 2, CAST(464826.57 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7429, N'Устинова О.В.', CAST(N'2017-12-21' AS Date), 2, CAST(225904.08 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7430, N'Фирсова О.В.', CAST(N'2015-05-05' AS Date), 2, CAST(391073.56 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7484, N'Бартуханова Н.И.', CAST(N'2011-04-28' AS Date), 2, CAST(454960.95 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7501, N'Шагжеева Н.О.', CAST(N'2006-11-24' AS Date), 2, CAST(200287.73 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7505, N'Тумурова Л.Ж.', CAST(N'2013-10-13' AS Date), 2, CAST(150194.17 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7548, N'Банзаров Д.Д.', CAST(N'2011-01-04' AS Date), 2, CAST(164598.13 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7550, N'Бальжирова А.А.', CAST(N'2001-12-15' AS Date), 2, CAST(366765.09 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7641, N'Грищук Т.Г.', CAST(N'2016-09-30' AS Date), 2, CAST(176273.64 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7674, N'Воевода Н.С.', CAST(N'2003-01-23' AS Date), 2, CAST(383427.78 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7687, N'Бадмажапова В.П.', CAST(N'2018-02-13' AS Date), 2, CAST(182243.96 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7738, N'Рукосуева Н.О.', CAST(N'2006-10-14' AS Date), 2, CAST(308184.35 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7741, N'Жилина Т.Н.', CAST(N'2013-02-26' AS Date), 2, CAST(320860.44 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7784, N'Месяцева И.А.', CAST(N'2004-12-17' AS Date), 2, CAST(458918.82 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7791, N'Шубина В.В.', CAST(N'2015-11-03' AS Date), 2, CAST(29683.73 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7804, N'Романова А.С.', CAST(N'2013-08-29' AS Date), 2, CAST(166079.83 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7922, N'Олихова Р.А.', CAST(N'2010-04-15' AS Date), 2, CAST(455267.46 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7949, N'Щербакова С.С.', CAST(N'2007-07-28' AS Date), 2, CAST(26503.58 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7954, N'Баглаева С.А.', CAST(N'2020-08-05' AS Date), 2, CAST(252048.89 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (7983, N'Гончарова Е.В.', CAST(N'2007-12-06' AS Date), 2, CAST(98297.69 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8011, N'Назимова Т.К.', CAST(N'2005-07-13' AS Date), 1, CAST(332608.45 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8025, N'Вагнер Э.В.', CAST(N'2019-09-24' AS Date), 2, CAST(242771.36 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8070, N'Ерахаева Л.С.', CAST(N'2019-12-03' AS Date), 2, CAST(235856.39 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8109, N'Перевалов С.И.', CAST(N'2016-12-04' AS Date), 2, CAST(396307.30 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8134, N'Оленникова О.Ю.', CAST(N'2003-10-30' AS Date), 1, CAST(344136.56 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8157, N'Борисов Л.Н.', CAST(N'2011-07-11' AS Date), 2, CAST(215600.22 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8210, N'Булдыгерова Т.Ю.', CAST(N'2011-01-24' AS Date), 1, CAST(258084.22 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8214, N'Вильмова Е.В.', CAST(N'2006-04-04' AS Date), 2, CAST(382808.43 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8216, N'Доржиева Э.Х.', CAST(N'2004-03-02' AS Date), 1, CAST(397410.48 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8237, N'Дашиев С.В.', CAST(N'2000-06-10' AS Date), 1, CAST(411195.13 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8253, N'Перевалова Д.Ю.', CAST(N'2016-08-20' AS Date), 2, CAST(315822.05 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8266, N'Доржиев М.А.', CAST(N'2018-02-22' AS Date), 1, CAST(108022.48 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8267, N'Данилов Е.Н.', CAST(N'2016-06-23' AS Date), 1, CAST(334489.51 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8268, N'Самойлова Н.Б.', CAST(N'2008-06-14' AS Date), 1, CAST(468034.93 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8287, N'АсееваНП', CAST(N'2010-01-29' AS Date), 1, CAST(333444.85 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8319, N'Денисенко А.С.', CAST(N'2002-01-29' AS Date), 1, CAST(70755.54 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8320, N'Вахрушева А.В.', CAST(N'2004-01-21' AS Date), 1, CAST(144928.66 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8321, N'Батурина Л.М.', CAST(N'2014-10-13' AS Date), 1, CAST(157856.91 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8322, N'Загибалов А.С.', CAST(N'2015-01-23' AS Date), 1, CAST(82836.83 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8323, N'Саватеева Н.А.', CAST(N'2001-09-30' AS Date), 1, CAST(4690.63 AS Decimal(18, 2)))
GO
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8344, N'Батомункуева Б.Н.', CAST(N'2017-03-01' AS Date), 1, CAST(201760.06 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8346, N'Батомункуев Э.Н.', CAST(N'2000-12-02' AS Date), 1, CAST(188238.70 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8347, N'Порфиненко О.С.', CAST(N'2016-06-27' AS Date), 1, CAST(195121.95 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8356, N'Федорова Н.Н.', CAST(N'2007-07-22' AS Date), 1, CAST(359932.57 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8357, N'Петухова Ю.М.', CAST(N'2009-09-24' AS Date), 2, CAST(298748.50 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8380, N'Сафонова А.Д.', CAST(N'2007-08-22' AS Date), 1, CAST(265597.84 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8382, N'Батомункуева С.Н.', CAST(N'2005-06-14' AS Date), 1, CAST(57564.38 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8383, N'Цыренов Б.Ц.', CAST(N'2005-10-05' AS Date), 1, CAST(178221.17 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8384, N'Бердникова О.В.', CAST(N'2005-10-11' AS Date), 1, CAST(69116.65 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8385, N'Юрьева Н.А.', CAST(N'2000-09-25' AS Date), 1, CAST(400532.97 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8386, N'Юй-чжан-суй А.С.', CAST(N'2000-03-08' AS Date), 1, CAST(193318.09 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8387, N'Третьяков Н.В.', CAST(N'2010-09-16' AS Date), 1, CAST(226284.22 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8391, N'Лысых Е.Е.', CAST(N'2019-04-02' AS Date), 1, CAST(78468.19 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8392, N'Саватеев С.В.', CAST(N'2010-08-03' AS Date), 1, CAST(34690.23 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (8396, N'Бевзюк Л.П.', CAST(N'2007-05-03' AS Date), 1, CAST(407990.43 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14842, N'Грехова С.И.', CAST(N'2004-04-02' AS Date), 2, CAST(401396.43 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14850, N'Жеравин В.И.', CAST(N'2014-08-06' AS Date), 2, CAST(472617.31 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14854, N'Мещерякова Н.А.', CAST(N'2004-11-12' AS Date), 2, CAST(89734.51 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14857, N'Лаптева Е.Ю.', CAST(N'2005-05-25' AS Date), 2, CAST(226654.12 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14858, N'Смолина Т.В.', CAST(N'2005-12-19' AS Date), 2, CAST(271243.43 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14899, N'Глухова Л.М.', CAST(N'2018-09-03' AS Date), 2, CAST(20243.30 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14900, N'Гребенщикова И.Г.', CAST(N'2010-03-24' AS Date), 2, CAST(416265.15 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (14901, N'Башкирова Н.К.', CAST(N'2020-10-09' AS Date), 2, CAST(152164.04 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (15020, N'Зайцева Н.П.', CAST(N'2013-06-17' AS Date), 2, CAST(311909.86 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (25511, N'Карпина Т.М.', CAST(N'2012-06-14' AS Date), 2, CAST(284086.36 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (30906, N'Дремухина Е.А.', CAST(N'2009-04-28' AS Date), 2, CAST(433582.55 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (30952, N'Мяханова О.Д.', CAST(N'2018-01-09' AS Date), 2, CAST(20545.85 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (31009, N'Александрович Г.С.', CAST(N'2018-11-05' AS Date), 2, CAST(292765.33 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (31010, N'Алексеева П.Е.', CAST(N'2009-09-29' AS Date), 2, CAST(60939.78 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (31025, N'Бороденко А.А.', CAST(N'2015-04-19' AS Date), 2, CAST(441226.32 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (31030, N'Васильев П.А.', CAST(N'2006-05-12' AS Date), 2, CAST(442700.04 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (31040, N'Гуруева И.Т.', CAST(N'2010-08-19' AS Date), 2, CAST(206483.08 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (36182, N'Агамамедов Г.Р.О.', CAST(N'2013-08-26' AS Date), 1, CAST(324643.58 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (37271, N'Бурханов А.М.', CAST(N'2005-03-29' AS Date), 1, CAST(299796.35 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (37731, N'Родионова Н.П.', CAST(N'2017-02-03' AS Date), 2, CAST(402578.99 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (39691, N'Дубинина М.И.', CAST(N'2011-12-13' AS Date), 2, CAST(145278.80 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (43651, N'Туманов В.С.', CAST(N'2007-02-12' AS Date), 1, CAST(386637.27 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (46731, N'Бойкова А.Г.', CAST(N'2009-01-14' AS Date), 2, CAST(333171.29 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (47061, N'Васильева М.Н.', CAST(N'2001-02-17' AS Date), 2, CAST(418440.02 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (47741, N'Чеченин В.В.', CAST(N'2018-11-22' AS Date), 2, CAST(204402.57 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (50048, N'Цыкунова И.П.', CAST(N'2015-02-28' AS Date), 2, CAST(427712.53 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (50184, N'Бельгаева Н.Г.', CAST(N'2011-02-13' AS Date), 2, CAST(128330.65 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (50190, N'Мельников С.В.', CAST(N'2016-09-20' AS Date), 2, CAST(349995.62 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (54436, N'Упхолоева Г.А.', CAST(N'2016-02-28' AS Date), 2, CAST(353638.28 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (54437, N'Данзанова Н.С.', CAST(N'2019-09-11' AS Date), 2, CAST(291268.45 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (54449, N'Протасов А.М.', CAST(N'2002-12-31' AS Date), 2, CAST(323360.87 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (54455, N'Андреева Н.И.', CAST(N'2003-05-18' AS Date), 2, CAST(354816.84 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (81211, N'Дамбаев Б.Е.', CAST(N'2017-11-05' AS Date), 1, CAST(243033.14 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (81291, N'Кузьмин И.А.', CAST(N'2001-01-24' AS Date), 1, CAST(324944.14 AS Decimal(18, 2)))
INSERT [dbo].[Driver] ([tabNum], [name], [dateOfStartWork], [idCategory], [troubleFreeExp]) VALUES (81431, N'Раднаева Е.Б.', CAST(N'2006-06-27' AS Date), 2, CAST(381906.47 AS Decimal(18, 2)))
GO
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (1, 7484, 7, 29, CAST(N'2021-12-01' AS Date), CAST(N'07:30:00' AS Time), CAST(N'13:30:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (2, 50048, 4, 26, CAST(N'2021-12-14' AS Date), CAST(N'07:30:00' AS Time), CAST(N'13:30:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (3, 8267, 1, 74, CAST(N'2021-12-15' AS Date), CAST(N'09:37:00' AS Time), CAST(N'15:37:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (4, 14857, 1, 37, CAST(N'2021-12-08' AS Date), CAST(N'16:02:00' AS Time), CAST(N'22:02:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (5, 8384, 8, 15, CAST(N'2021-12-14' AS Date), CAST(N'08:49:00' AS Time), CAST(N'14:49:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (6, 8109, 1, 78, CAST(N'2021-12-03' AS Date), CAST(N'15:19:00' AS Time), CAST(N'21:19:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (7, 14858, 2, 59, CAST(N'2021-12-24' AS Date), CAST(N'09:56:00' AS Time), CAST(N'15:56:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (8, 3535, 8, 27, CAST(N'2021-12-19' AS Date), CAST(N'17:02:00' AS Time), CAST(N'23:02:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (9, 3729, 8, 77, CAST(N'2021-12-21' AS Date), CAST(N'15:30:00' AS Time), CAST(N'21:30:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (10, 8025, 1, 41, CAST(N'2021-12-12' AS Date), CAST(N'12:03:00' AS Time), CAST(N'18:03:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (11, 8385, 7, 50, CAST(N'2021-12-14' AS Date), CAST(N'08:44:00' AS Time), CAST(N'14:44:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (12, 3535, 1, 65, CAST(N'2021-12-18' AS Date), CAST(N'08:32:00' AS Time), CAST(N'14:32:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (13, 54449, 7, 27, CAST(N'2021-12-09' AS Date), CAST(N'05:56:00' AS Time), CAST(N'11:56:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (14, 14842, 1, 45, CAST(N'2021-12-28' AS Date), CAST(N'14:05:00' AS Time), CAST(N'20:05:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (15, 2657, 8, 66, CAST(N'2021-12-17' AS Date), CAST(N'14:25:00' AS Time), CAST(N'20:25:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (16, 7741, 4, 52, CAST(N'2021-12-25' AS Date), CAST(N'07:59:00' AS Time), CAST(N'13:59:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (17, 54436, 5, 18, CAST(N'2021-12-05' AS Date), CAST(N'16:52:00' AS Time), CAST(N'22:52:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (18, 8268, 4, 11, CAST(N'2021-12-22' AS Date), CAST(N'14:35:00' AS Time), CAST(N'20:35:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (19, 8157, 7, 19, CAST(N'2021-12-18' AS Date), CAST(N'15:34:00' AS Time), CAST(N'21:34:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (20, 4440, 4, 24, CAST(N'2021-12-06' AS Date), CAST(N'12:42:00' AS Time), CAST(N'18:42:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (21, 47741, 1, 68, CAST(N'2021-12-25' AS Date), CAST(N'17:25:00' AS Time), CAST(N'23:25:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (22, 1511, 4, 30, CAST(N'2021-12-18' AS Date), CAST(N'14:49:00' AS Time), CAST(N'20:49:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (23, 8266, 8, 30, CAST(N'2021-12-29' AS Date), CAST(N'14:25:00' AS Time), CAST(N'20:25:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (24, 54437, 5, 23, CAST(N'2021-12-19' AS Date), CAST(N'07:30:00' AS Time), CAST(N'13:30:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (25, 3773, 1, 40, CAST(N'2021-12-09' AS Date), CAST(N'11:12:00' AS Time), CAST(N'17:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (26, 7674, 5, 59, CAST(N'2021-12-17' AS Date), CAST(N'09:33:00' AS Time), CAST(N'15:33:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (27, 1125, 7, 25, CAST(N'2021-12-02' AS Date), CAST(N'16:13:00' AS Time), CAST(N'22:13:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (28, 1125, 1, 63, CAST(N'2021-12-03' AS Date), CAST(N'14:20:00' AS Time), CAST(N'20:20:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (29, 4632, 8, 52, CAST(N'2021-12-13' AS Date), CAST(N'06:25:00' AS Time), CAST(N'12:25:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (30, 6543, 4, 46, CAST(N'2021-12-14' AS Date), CAST(N'13:23:00' AS Time), CAST(N'19:23:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (31, 4566, 8, 20, CAST(N'2021-12-20' AS Date), CAST(N'13:31:00' AS Time), CAST(N'19:31:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (32, 7804, 7, 54, CAST(N'2021-12-26' AS Date), CAST(N'11:53:00' AS Time), CAST(N'17:53:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (33, 8392, 5, 20, CAST(N'2021-12-11' AS Date), CAST(N'09:39:00' AS Time), CAST(N'15:39:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (34, 2294, 8, 57, CAST(N'2021-12-07' AS Date), CAST(N'07:34:00' AS Time), CAST(N'13:34:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (35, 255, 7, 12, CAST(N'2021-12-23' AS Date), CAST(N'13:34:00' AS Time), CAST(N'19:34:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (36, 14901, 5, 34, CAST(N'2021-12-28' AS Date), CAST(N'11:52:00' AS Time), CAST(N'17:52:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (37, 7791, 7, 57, CAST(N'2021-12-03' AS Date), CAST(N'16:35:00' AS Time), CAST(N'22:35:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (38, 43651, 7, 77, CAST(N'2021-12-11' AS Date), CAST(N'16:04:00' AS Time), CAST(N'22:04:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (39, 3791, 4, 51, CAST(N'2021-12-25' AS Date), CAST(N'08:55:00' AS Time), CAST(N'14:55:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (41, 14899, 2, 35, CAST(N'2021-12-29' AS Date), CAST(N'08:29:00' AS Time), CAST(N'14:29:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (42, 1511, 4, 73, CAST(N'2021-12-26' AS Date), CAST(N'13:03:00' AS Time), CAST(N'19:03:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (43, 8320, 5, 50, CAST(N'2021-12-15' AS Date), CAST(N'16:38:00' AS Time), CAST(N'22:38:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (44, 8385, 8, 40, CAST(N'2021-12-12' AS Date), CAST(N'12:06:00' AS Time), CAST(N'18:06:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (45, 8321, 5, 49, CAST(N'2021-12-24' AS Date), CAST(N'10:27:00' AS Time), CAST(N'16:27:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (46, 8382, 2, 74, CAST(N'2021-12-04' AS Date), CAST(N'14:51:00' AS Time), CAST(N'20:51:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (47, 4440, 5, 26, CAST(N'2021-12-14' AS Date), CAST(N'09:59:00' AS Time), CAST(N'15:59:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (48, 2126, 8, 51, CAST(N'2021-12-23' AS Date), CAST(N'12:38:00' AS Time), CAST(N'18:38:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (49, 3983, 2, 23, CAST(N'2021-12-19' AS Date), CAST(N'10:43:00' AS Time), CAST(N'16:43:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (50, 6462, 5, 56, CAST(N'2021-12-14' AS Date), CAST(N'11:12:00' AS Time), CAST(N'17:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (51, 7954, 1, 12, CAST(N'2021-12-22' AS Date), CAST(N'15:08:00' AS Time), CAST(N'21:08:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (52, 81431, 5, 13, CAST(N'2021-12-16' AS Date), CAST(N'15:14:00' AS Time), CAST(N'21:14:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (53, 7674, 2, 76, CAST(N'2021-12-14' AS Date), CAST(N'17:12:00' AS Time), CAST(N'23:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (54, 8319, 7, 34, CAST(N'2021-12-28' AS Date), CAST(N'09:54:00' AS Time), CAST(N'15:54:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (55, 14900, 4, 31, CAST(N'2021-12-14' AS Date), CAST(N'07:53:00' AS Time), CAST(N'13:53:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (56, 8025, 2, 75, CAST(N'2021-12-07' AS Date), CAST(N'08:12:00' AS Time), CAST(N'14:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (57, 2719, 7, 24, CAST(N'2021-12-08' AS Date), CAST(N'06:26:00' AS Time), CAST(N'12:26:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (58, 8210, 4, 35, CAST(N'2021-12-11' AS Date), CAST(N'09:25:00' AS Time), CAST(N'15:25:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (59, 46731, 5, 75, CAST(N'2021-12-31' AS Date), CAST(N'15:03:00' AS Time), CAST(N'21:03:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (60, 4083, 4, 55, CAST(N'2021-12-04' AS Date), CAST(N'06:39:00' AS Time), CAST(N'12:39:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (61, 2074, 4, 64, CAST(N'2021-12-07' AS Date), CAST(N'07:56:00' AS Time), CAST(N'13:56:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (62, 8134, 2, 40, CAST(N'2021-12-02' AS Date), CAST(N'16:44:00' AS Time), CAST(N'22:44:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (63, 31010, 4, 60, CAST(N'2021-12-27' AS Date), CAST(N'13:23:00' AS Time), CAST(N'19:23:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (64, 8387, 2, 74, CAST(N'2021-12-08' AS Date), CAST(N'16:38:00' AS Time), CAST(N'22:38:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (65, 8346, 1, 75, CAST(N'2021-12-26' AS Date), CAST(N'13:27:00' AS Time), CAST(N'19:27:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (66, 8253, 4, 68, CAST(N'2021-12-29' AS Date), CAST(N'07:55:00' AS Time), CAST(N'13:55:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (67, 54455, 2, 75, CAST(N'2021-12-20' AS Date), CAST(N'09:12:00' AS Time), CAST(N'15:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (69, 8011, 5, 11, CAST(N'2021-12-30' AS Date), CAST(N'09:57:00' AS Time), CAST(N'15:57:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (70, 3983, 4, 55, CAST(N'2021-12-24' AS Date), CAST(N'15:16:00' AS Time), CAST(N'21:16:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (71, 1061, 4, 41, CAST(N'2021-12-07' AS Date), CAST(N'13:02:00' AS Time), CAST(N'19:02:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (72, 4776, 7, 82, CAST(N'2021-12-11' AS Date), CAST(N'10:50:00' AS Time), CAST(N'16:50:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (73, 8268, 2, 75, CAST(N'2021-12-30' AS Date), CAST(N'08:08:00' AS Time), CAST(N'14:08:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (74, 4287, 7, 10, CAST(N'2021-12-01' AS Date), CAST(N'12:24:00' AS Time), CAST(N'18:24:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (75, 2074, 8, 11, CAST(N'2021-12-30' AS Date), CAST(N'08:46:00' AS Time), CAST(N'14:46:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (76, 14899, 1, 66, CAST(N'2021-12-02' AS Date), CAST(N'09:15:00' AS Time), CAST(N'15:15:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (77, 7804, 5, 20, CAST(N'2021-12-25' AS Date), CAST(N'14:30:00' AS Time), CAST(N'20:30:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (79, 7791, 1, 30, CAST(N'2021-12-29' AS Date), CAST(N'09:23:00' AS Time), CAST(N'15:23:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (80, 7375, 4, 41, CAST(N'2021-12-16' AS Date), CAST(N'16:24:00' AS Time), CAST(N'22:24:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (81, 4561, 4, 32, CAST(N'2021-12-23' AS Date), CAST(N'16:36:00' AS Time), CAST(N'22:36:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (82, 1294, 8, 52, CAST(N'2021-12-06' AS Date), CAST(N'13:14:00' AS Time), CAST(N'19:14:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (83, 4485, 1, 41, CAST(N'2021-12-22' AS Date), CAST(N'13:27:00' AS Time), CAST(N'19:27:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (84, 4773, 2, 24, CAST(N'2021-12-23' AS Date), CAST(N'12:54:00' AS Time), CAST(N'18:54:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (85, 2074, 1, 36, CAST(N'2021-12-07' AS Date), CAST(N'13:24:00' AS Time), CAST(N'19:24:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (86, 7341, 5, 60, CAST(N'2021-12-10' AS Date), CAST(N'15:08:00' AS Time), CAST(N'21:08:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (88, 8384, 8, 41, CAST(N'2021-12-21' AS Date), CAST(N'17:05:00' AS Time), CAST(N'23:05:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (89, 8396, 4, 23, CAST(N'2021-12-11' AS Date), CAST(N'08:19:00' AS Time), CAST(N'14:19:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (90, 8346, 5, 24, CAST(N'2021-12-25' AS Date), CAST(N'05:45:00' AS Time), CAST(N'11:45:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (91, 4440, 5, 60, CAST(N'2021-12-03' AS Date), CAST(N'08:33:00' AS Time), CAST(N'14:33:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (92, 8267, 8, 35, CAST(N'2021-12-20' AS Date), CAST(N'10:47:00' AS Time), CAST(N'16:47:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (93, 7784, 1, 13, CAST(N'2021-12-02' AS Date), CAST(N'11:20:00' AS Time), CAST(N'17:20:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (94, 2124, 2, 46, CAST(N'2021-12-02' AS Date), CAST(N'08:11:00' AS Time), CAST(N'14:11:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (95, 8391, 1, 70, CAST(N'2021-12-01' AS Date), CAST(N'08:52:00' AS Time), CAST(N'14:52:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (96, 7550, 8, 61, CAST(N'2021-12-16' AS Date), CAST(N'15:39:00' AS Time), CAST(N'21:39:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (97, 8214, 1, 37, CAST(N'2021-12-29' AS Date), CAST(N'17:22:00' AS Time), CAST(N'23:22:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (98, 30952, 8, 55, CAST(N'2021-12-26' AS Date), CAST(N'08:28:00' AS Time), CAST(N'14:28:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (99, 7375, 8, 79, CAST(N'2021-12-29' AS Date), CAST(N'13:32:00' AS Time), CAST(N'19:32:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (100, 4566, 7, 60, CAST(N'2021-12-13' AS Date), CAST(N'10:35:00' AS Time), CAST(N'16:35:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (101, 3696, 2, 11, CAST(N'2021-12-20' AS Date), CAST(N'12:48:00' AS Time), CAST(N'18:48:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (102, 8380, 1, 30, CAST(N'2021-12-25' AS Date), CAST(N'10:21:00' AS Time), CAST(N'16:21:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (103, 1061, 5, 82, CAST(N'2021-12-10' AS Date), CAST(N'13:44:00' AS Time), CAST(N'19:44:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (104, 8322, 8, 17, CAST(N'2021-12-15' AS Date), CAST(N'12:19:00' AS Time), CAST(N'18:19:00' AS Time))
GO
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (105, 31040, 5, 64, CAST(N'2021-12-13' AS Date), CAST(N'07:23:00' AS Time), CAST(N'13:23:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (106, 14854, 8, 29, CAST(N'2021-12-06' AS Date), CAST(N'13:56:00' AS Time), CAST(N'19:56:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (107, 7484, 5, 74, CAST(N'2021-12-03' AS Date), CAST(N'17:03:00' AS Time), CAST(N'23:03:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (108, 3589, 4, 54, CAST(N'2021-12-20' AS Date), CAST(N'11:15:00' AS Time), CAST(N'17:15:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (109, 4773, 4, 28, CAST(N'2021-12-14' AS Date), CAST(N'14:46:00' AS Time), CAST(N'20:46:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (110, 7674, 1, 56, CAST(N'2021-12-03' AS Date), CAST(N'11:21:00' AS Time), CAST(N'17:21:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (111, 31010, 5, 61, CAST(N'2021-12-18' AS Date), CAST(N'13:15:00' AS Time), CAST(N'19:15:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (112, 8268, 1, 38, CAST(N'2021-12-30' AS Date), CAST(N'09:21:00' AS Time), CAST(N'15:21:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (113, 7674, 8, 19, CAST(N'2021-12-20' AS Date), CAST(N'08:45:00' AS Time), CAST(N'14:45:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (114, 2719, 5, 68, CAST(N'2021-12-03' AS Date), CAST(N'16:12:00' AS Time), CAST(N'22:12:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (115, 50048, 4, 11, CAST(N'2021-12-30' AS Date), CAST(N'13:36:00' AS Time), CAST(N'19:36:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (116, 7949, 4, 46, CAST(N'2021-12-27' AS Date), CAST(N'16:33:00' AS Time), CAST(N'22:33:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (117, 4257, 4, 78, CAST(N'2021-12-09' AS Date), CAST(N'06:35:00' AS Time), CAST(N'12:35:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (118, 54455, 8, 51, CAST(N'2021-12-28' AS Date), CAST(N'08:09:00' AS Time), CAST(N'14:09:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (119, 4561, 1, 24, CAST(N'2021-12-17' AS Date), CAST(N'10:26:00' AS Time), CAST(N'16:26:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (120, 8321, 5, 10, CAST(N'2021-12-12' AS Date), CAST(N'09:35:00' AS Time), CAST(N'15:35:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (121, 54437, 1, 74, CAST(N'2021-12-16' AS Date), CAST(N'09:14:00' AS Time), CAST(N'15:14:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (122, 7430, 4, 53, CAST(N'2021-12-02' AS Date), CAST(N'07:13:00' AS Time), CAST(N'13:13:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (123, 2719, 8, 68, CAST(N'2021-12-24' AS Date), CAST(N'07:13:00' AS Time), CAST(N'13:13:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (124, 3837, 4, 28, CAST(N'2021-12-02' AS Date), CAST(N'06:11:00' AS Time), CAST(N'12:11:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (125, 8214, 4, 31, CAST(N'2021-12-31' AS Date), CAST(N'07:08:00' AS Time), CAST(N'13:08:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (126, 8134, 8, 53, CAST(N'2021-12-31' AS Date), CAST(N'16:06:00' AS Time), CAST(N'22:06:00' AS Time))
INSERT [dbo].[Passage] ([number], [idDriver], [numberRoute], [numberTrain], [date], [timeStart], [timeFinish]) VALUES (127, 50184, 7, 21, CAST(N'2021-12-10' AS Date), CAST(N'14:05:00' AS Time), CAST(N'20:05:00' AS Time))
GO
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (1, N'Шишковка', N'Шишковка', 12000)
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (2, N'Шишковка', N'Шишковка', 12000)
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (4, N'Мелькомбинат', N'ЛВРЗ', 13460)
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (5, N'Шишковка', N'Мелькомбинат', 11000)
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (7, N'Бурятский научный центр', N'Бурятский научный центр', 9000)
INSERT [dbo].[Route] ([number], [startStation], [finishStation], [lenght]) VALUES (8, N'Бурятский научный центр', N'Бурятский научный центр', 9000)
GO
INSERT [dbo].[StateTrain] ([id], [Titile]) VALUES (1, N'Исправный')
INSERT [dbo].[StateTrain] ([id], [Titile]) VALUES (2, N'В ремонте')
INSERT [dbo].[StateTrain] ([id], [Titile]) VALUES (3, N'На диагностике')
INSERT [dbo].[StateTrain] ([id], [Titile]) VALUES (4, N'На ТО')
GO
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (1, 5, 1, 12)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (2, 5, 1, 9)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (3, 5, 1, 6)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (4, 5, 1, 14)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (5, 5, 1, 13)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (6, 5, 1, 11)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (7, 5, 1, 8)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (8, 5, 1, 5)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (9, 5, 1, 3)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (10, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (11, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (12, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (13, 2, 3, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (14, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (15, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (16, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (17, 3, 4, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (18, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (19, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (20, 3, 3, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (21, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (22, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (23, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (24, 4, 3, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (25, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (26, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (27, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (28, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (29, 1, 2, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (30, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (31, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (32, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (33, 3, 4, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (34, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (35, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (36, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (37, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (38, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (39, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (40, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (41, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (42, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (43, 4, 2, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (44, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (45, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (46, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (47, 1, 2, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (48, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (49, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (50, 2, 2, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (51, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (52, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (53, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (54, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (55, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (56, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (57, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (58, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (59, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (60, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (61, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (62, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (63, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (64, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (65, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (66, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (67, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (68, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (69, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (70, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (71, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (72, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (73, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (74, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (75, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (76, 2, 1, 24)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (77, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (78, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (79, 3, 1, 10)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (80, 1, 1, 31)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (81, 4, 1, 2)
INSERT [dbo].[Train] ([number], [typeId], [stateID], [timeWork]) VALUES (82, 3, 1, 10)
GO
INSERT [dbo].[TypeTrain] ([id], [Title]) VALUES (1, N'КТМ-5')
INSERT [dbo].[TypeTrain] ([id], [Title]) VALUES (2, N'КТМ-8')
INSERT [dbo].[TypeTrain] ([id], [Title]) VALUES (3, N'КТМ-19')
INSERT [dbo].[TypeTrain] ([id], [Title]) VALUES (4, N'71-911ЕМ "Львенок"')
INSERT [dbo].[TypeTrain] ([id], [Title]) VALUES (5, N'Служебный')
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_CategoryOfDriver] FOREIGN KEY([idCategory])
REFERENCES [dbo].[CategoryOfDriver] ([id])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_CategoryOfDriver]
GO
ALTER TABLE [dbo].[Passage]  WITH CHECK ADD  CONSTRAINT [FK_Passage_Driver] FOREIGN KEY([idDriver])
REFERENCES [dbo].[Driver] ([tabNum])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passage] CHECK CONSTRAINT [FK_Passage_Driver]
GO
ALTER TABLE [dbo].[Passage]  WITH CHECK ADD  CONSTRAINT [FK_Passage_Route] FOREIGN KEY([numberRoute])
REFERENCES [dbo].[Route] ([number])
GO
ALTER TABLE [dbo].[Passage] CHECK CONSTRAINT [FK_Passage_Route]
GO
ALTER TABLE [dbo].[Passage]  WITH CHECK ADD  CONSTRAINT [FK_Passage_Train] FOREIGN KEY([numberTrain])
REFERENCES [dbo].[Train] ([number])
GO
ALTER TABLE [dbo].[Passage] CHECK CONSTRAINT [FK_Passage_Train]
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [FK_Train_StateTrain] FOREIGN KEY([stateID])
REFERENCES [dbo].[StateTrain] ([id])
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [FK_Train_StateTrain]
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [FK_Train_TypeTrain] FOREIGN KEY([typeId])
REFERENCES [dbo].[TypeTrain] ([id])
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [FK_Train_TypeTrain]
GO
USE [master]
GO
ALTER DATABASE [Train] SET  READ_WRITE 
GO
