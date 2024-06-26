USE [master]
GO
/****** Object:  Database [ReactApi]    Script Date: 25.01.2024 15:00:16 ******/
CREATE DATABASE [ReactApi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReactApi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ReactApi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReactApi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ReactApi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ReactApi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReactApi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReactApi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReactApi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReactApi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReactApi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReactApi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReactApi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReactApi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReactApi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReactApi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReactApi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReactApi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReactApi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReactApi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReactApi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReactApi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ReactApi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReactApi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReactApi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReactApi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReactApi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReactApi] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ReactApi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReactApi] SET RECOVERY FULL 
GO
ALTER DATABASE [ReactApi] SET  MULTI_USER 
GO
ALTER DATABASE [ReactApi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReactApi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReactApi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReactApi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReactApi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReactApi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReactApi', N'ON'
GO
ALTER DATABASE [ReactApi] SET QUERY_STORE = ON
GO
ALTER DATABASE [ReactApi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ReactApi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[OldPrice] [float] NULL,
	[NewPrice] [float] NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.01.2024 15:00:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[SurName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240109181327_first', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240111120050_favoriDelete', N'6.0.24')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Featured', N'Featured Category')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'NEW ARRIVALS', N'NEW ARRIVALS Category')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'BESTSELLER', N'BESTSELLER Category')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (6, 5, 1, 1)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (7, 7, 2, 0)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (8, 7, 1, 1)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (9, 16, 1, 0)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (10, 5, 2, 1)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (11, 19, 1, 1)
INSERT [dbo].[Favorites] ([Id], [ProductId], [UserId], [IsDeleted]) VALUES (12, 17, 1, 1)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 7, 2)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 7, 7, 5)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 19, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 20, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 21, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 23, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 24, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 25, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 26, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 27, 7, 2)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 28, 5, 2)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 29, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 30, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 31, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 31, 7, 2)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 32, 5, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 32, 7, 2)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (27, 34, 7, 3)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (28, 35, 7, 1)
INSERT [dbo].[OrderProducts] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (29, 35, 5, 1)
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (1, CAST(N'2024-01-10T16:05:48.8100000' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (2, CAST(N'2024-01-10T23:37:55.1640140' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (3, CAST(N'2024-01-10T23:40:50.8236183' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (4, CAST(N'2024-01-10T23:48:56.9990267' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (5, CAST(N'2024-01-10T23:50:07.0903478' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (6, CAST(N'2024-01-10T23:54:28.4485231' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (7, CAST(N'2024-01-10T23:56:36.9451737' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (8, CAST(N'2024-01-11T11:23:10.4092652' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (9, CAST(N'2024-01-11T11:26:00.8377339' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (10, CAST(N'2024-01-11T11:29:30.8079466' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (11, CAST(N'2024-01-11T11:39:14.4120426' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (12, CAST(N'2024-01-11T11:44:12.9127376' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (13, CAST(N'2024-01-11T11:45:52.6836804' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (14, CAST(N'2024-01-11T11:47:48.8923092' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (15, CAST(N'2024-01-11T11:49:03.7457075' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (16, CAST(N'2024-01-11T11:50:27.0348412' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (17, CAST(N'2024-01-11T11:56:09.1482796' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (18, CAST(N'2024-01-11T11:58:23.5392243' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (19, CAST(N'2024-01-11T12:07:24.7979225' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (20, CAST(N'2024-01-11T12:09:35.5306804' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (21, CAST(N'2024-01-11T12:16:45.0873539' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (23, CAST(N'2024-01-11T12:21:55.3622067' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (24, CAST(N'2024-01-11T12:27:44.9812643' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (25, CAST(N'2024-01-11T12:30:13.0913020' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (26, CAST(N'2024-01-11T12:34:33.0385126' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (27, CAST(N'2024-01-11T13:50:57.0701272' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (28, CAST(N'2024-01-11T13:59:05.6391795' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (29, CAST(N'2024-01-11T14:05:15.8413775' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (30, CAST(N'2024-01-11T14:07:33.6101632' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (31, CAST(N'2024-01-11T14:10:55.7337989' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (32, CAST(N'2024-01-11T14:11:47.0505606' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (33, CAST(N'2024-01-16T01:46:11.8620706' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (34, CAST(N'2024-01-16T01:49:13.8018025' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId]) VALUES (35, CAST(N'2024-01-16T23:57:11.1970160' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (5, N'Product 001', N'Product 001 Desc', 49, 44, 1, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/18/8151/4e450ea1-f0f5-448d-8ca9-a8664142d72a_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (7, N'Product 002', N'Product 002 Desc', 39, 35, 2, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/18/7827/73061620-37a9-444e-9d8d-1442ea2c1178_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (16, N'Product 003 ', N'Product 003 Desc', 35, 25, 3, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/18/7782/f767a27d-aebc-47f8-9b8a-d0204ab4239d_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (17, N'Product 004 ', N'Product 004 Desc', 55, 45, 2, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/11/8802/fcc0aaaf-2f43-4cd5-8fd0-f0e1097f7619_size780x780_quality60_cropCenter.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (18, N'Product 005', N'Product 005 Desc', 25, 15, 1, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2022/10/27/2147640/47814344-5b22-457f-95f5-f9d38ea9bdbb.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [NewPrice], [CategoryId], [Image]) VALUES (19, N'Product 006', N'Product 006', 75, 55, 3, N'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/09/01/75000/26046557-0251-4e8a-bc62-15ce5879e562_size780x780_quality60_cropCenter.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [SurName]) VALUES (1, N'senes', N'senes@gmail.com', N'123', N'ozdel')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [SurName]) VALUES (2, N'jake', N'jake@gmail.com', N'123', N'make')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [SurName]) VALUES (4, N'post', N'post@gmail.com', N'123', N'postf6d463eb-5717-4730-bd18-04ad0b7730bc')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [SurName]) VALUES (5, N'mahmut', N'mahmut@gmail.com', N'456', N'mahmut20c87cbf-a1d0-494b-84a6-5cfd09d6e4bc')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [SurName]) VALUES (6, N'deneme', N'deneme@gmail.com', N'456', N'deneme04dafbf3-41ae-4ce5-864d-1292d10e6e97')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Blogs_UserId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_UserId] ON [dbo].[Blogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favorites_ProductId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_Favorites_ProductId] ON [dbo].[Favorites]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favorites_UserId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_Favorites_UserId] ON [dbo].[Favorites]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_OrderId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_OrderId] ON [dbo].[OrderProducts]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_ProductId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_ProductId] ON [dbo].[OrderProducts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 25.01.2024 15:00:16 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorites] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users_UserId]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products_ProductId]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Users_UserId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [ReactApi] SET  READ_WRITE 
GO
