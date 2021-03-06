USE [master]
GO
/****** Object:  Database [Finance]    Script Date: 30-11-2020 14:49:59 ******/
CREATE DATABASE [Finance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Finance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Finance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Finance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Finance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Finance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Finance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Finance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Finance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Finance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Finance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Finance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Finance] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Finance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Finance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Finance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Finance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Finance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Finance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Finance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Finance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Finance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Finance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Finance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Finance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Finance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Finance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Finance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Finance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Finance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Finance] SET  MULTI_USER 
GO
ALTER DATABASE [Finance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Finance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Finance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Finance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Finance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Finance] SET QUERY_STORE = OFF
GO
USE [Finance]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[AdminName] [nvarchar](20) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[ActivationStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankID] [int] NULL,
	[BankName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardTable]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardTable](
	[CardNumber] [bigint] IDENTITY(6051232563001234,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[ValidTill] [nvarchar](20) NOT NULL,
	[CardType] [nvarchar](20) NOT NULL,
	[TotalCredit] [int] NOT NULL,
	[RemainingCredit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardTypeTable]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardTypeTable](
	[CardType] [nvarchar](20) NOT NULL,
	[JoiningFee] [int] NULL,
	[TotalCredit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumerTable]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumerTable](
	[UserName] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[PhoneNo] [bigint] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](80) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[CardType] [nvarchar](20) NULL,
	[SelectBank] [nvarchar](20) NULL,
	[IFSC_Code] [nvarchar](20) NULL,
	[AccountNumber] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[ProcessingFee] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(120001,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[AmountPayable] [float] NOT NULL,
	[EMI_Tenure_In_Months] [int] NOT NULL,
	[BillAmountperMonth] [float] NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[Remaining_EMI_Tenures] [int] NULL,
	[LastPaymentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP_Validation]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP_Validation](
	[UserName] [nvarchar](20) NOT NULL,
	[OTP_Sent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(5000,1) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[ProductDetails] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CostPerUnit] [int] NOT NULL,
	[AvailableQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Aravind', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Arulselvan', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Arulselvan2408', 0)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Harshit', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Karthik24', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Kumar2508', 0)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Prema', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'RamKumar', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Selvan2408', 1)
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1001, N'Indian Bank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1002, N'HDFC Bank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1003, N'CanaraBank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1004, N'State Bank of India')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1005, N'Punjab National Bank')
GO
SET IDENTITY_INSERT [dbo].[CardTable] ON 

INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001234, N'Arulselvan', N'07/22', N'Titanium', 100000, 650)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001235, N'Harshit', N'12/24', N'Titanium', 100000, 32230)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001236, N'Karthik24', N'06/26', N'Gold', 40000, 54400)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001244, N'Aravind', N'11/25', N'Gold', 40000, 40000)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001252, N'RamKumar', N'11/25', N'Gold', 40000, 40000)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001253, N'prema', N'11/25', N'Gold', 40000, 40000)
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType], [TotalCredit], [RemainingCredit]) VALUES (6051232563001254, N'Selvan2408', N'11/25', N'Titanium', 100000, 63450.680000000008)
SET IDENTITY_INSERT [dbo].[CardTable] OFF
GO
INSERT [dbo].[CardTypeTable] ([CardType], [JoiningFee], [TotalCredit]) VALUES (N'Gold', 1000, 40000)
INSERT [dbo].[CardTypeTable] ([CardType], [JoiningFee], [TotalCredit]) VALUES (N'Titanium', 2000, 100000)
GO
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Aravind', N'Aravind', CAST(N'1989-03-21' AS Date), 8715426926, N'aravind21@gmail.com', N'No.5, princess street, fort kochi, Ernakulam-682001', N'aravind@123', N'Gold', N'Punjab National Bank', N'PNB000T623', 1000325647891)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'arul2408', N'ARULSELVAN', CAST(N'2020-10-28' AS Date), 7708182181, N'arul1@gmail.com', N'Mind Space SEZ (Serene Properties),', N'123456', N'Gold', N'Indian Bank', N'IDIB000T164', 634582123455)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Arulselvan', N'Arul Selvan', CAST(N'1997-08-24' AS Date), 7708182180, N'arul@gmail.com', N'No.4, 11thCross, K.K Nagar,Trichy-621216', N'Arul@123', N'Titanium', N'Indian Bank', N'IDIB000T164', 6386708849)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Arulselvan2408', N'ARULSELVAN', CAST(N'1997-08-24' AS Date), 7708182185, N'barul97@gmail.com', N'Mind Space SEZ (Serene Properties),', N'MTIzNDU2Nzg5', N'Titanium', N'Indian Bank', N'IDIB000T164', 63867088491)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Harshit', N'Harshit Mishra', CAST(N'1996-09-05' AS Date), 7904958146, N'harshit.m@yahoo.com', N'1/97, Gomti Nagar, South Lucknow, 226001', N'Hmishra@123', N'Titanium', N'State Bank of India', N'SBIN000264', 738649572346)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Karthik24', N'Karthik24', CAST(N'2001-05-09' AS Date), 9798141815, N'Karthik24@gmail.com', N'4th floor, Anu Apartment, Thillai Nagar, Chennai-600028', N'Karthik@123', N'Gold', N'CanaraBank', N'CNRB00A208', 4897659942)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Kumar2508', N'Kumar', CAST(N'2020-11-03' AS Date), 8353621549, N'kumar@gmail.com', N'Mind Space SEZ (Serene Properties),', N'S3VtYXJAMTIz', N'Gold', N'Indian Bank', N'IDIB000T164', 6342159872)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'prema', N'prema Balu', CAST(N'1989-03-21' AS Date), 8715249625, N'prema@gmail.com', N'No.7, no.1 Tolgate, trichy 621216', N'Prema@123', N'Gold', N'Indian Bank', N'IDIB000T164', 1000325647891)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'RamKumar', N'RamKumar', CAST(N'1984-02-15' AS Date), 9812345689, N'Ramkumar02@gmail.com', N'204, Vertica-B wing, Palava, Mumbai-421204', N'Ram@Kumar123', N'Gold', N'HDFC Bank', N'HDFC0000060', 9000145672)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Selvan2408', N'Arulselvan', CAST(N'1997-08-24' AS Date), 9942892867, N'Finance@gmail.com', N'D3, Navaneethas Brahma Nivas, Uttamarkoil, NO.1 Tolgate', N'MTIzNDU2Nzg5', N'Titanium', N'Indian Bank', N'IDIB000T164', 6386708848)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120001, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120002, 5009, 1, 79000, 1580)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120003, 5011, 1, 19999, 399.98)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120005, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120006, 5008, 2, 30000, 600)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120007, 5008, 2, 30000, 600)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120008, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120009, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120010, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120011, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120012, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120013, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120014, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120015, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120016, 5008, 1, 15000, 300)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120017, 5011, 1, 19999, 399.98)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee]) VALUES (120018, 5008, 1, 15000, 300)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120001, CAST(N'2020-11-09' AS Date), 15300, 6, 2550, 6051232563001234, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120002, CAST(N'2020-11-14' AS Date), 80580, 12, 6715, 6051232563001235, 10, CAST(N'2020-11-26' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120003, CAST(N'2020-11-05' AS Date), 20398.98, 6, 3399.83, 6051232563001236, 6, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120005, CAST(N'2020-11-23' AS Date), 15300, 6, 2550, 6051232563001234, 5, CAST(N'2020-11-27' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120006, CAST(N'2020-11-24' AS Date), 30600, 6, 5100, 6051232563001235, 6, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120007, CAST(N'2020-11-24' AS Date), 30600, 6, 5100, 6051232563001235, 6, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120008, CAST(N'2020-11-24' AS Date), 15300, 6, 2550, 6051232563001236, 6, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120009, CAST(N'2020-11-24' AS Date), 15300, 6, 2550, 6051232563001236, 6, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120010, CAST(N'2020-11-25' AS Date), 15300, 3, 5100, 6051232563001234, 2, CAST(N'2020-11-27' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120011, CAST(N'2020-11-25' AS Date), 15300, 3, 5100, 6051232563001234, 2, CAST(N'2020-11-27' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120012, CAST(N'2020-11-25' AS Date), 15300, 3, 5100, 6051232563001234, 3, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120013, CAST(N'2020-11-25' AS Date), 15300, 3, 5100, 6051232563001234, 3, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120014, CAST(N'2020-11-26' AS Date), 15300, 9, 1700, 6051232563001234, 9, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120015, CAST(N'2020-11-27' AS Date), 15300, 3, 5100, 6051232563001234, 3, NULL)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120016, CAST(N'2020-11-29' AS Date), 15300, 3, 5100, 6051232563001254, 2, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120017, CAST(N'2020-11-29' AS Date), 20398.98, 3, 6799.66, 6051232563001254, 2, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [AmountPayable], [EMI_Tenure_In_Months], [BillAmountperMonth], [CardNumber], [Remaining_EMI_Tenures], [LastPaymentDate]) VALUES (120018, CAST(N'2020-11-30' AS Date), 15300, 6, 2550, 6051232563001254, 5, CAST(N'2020-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5008, N'Nokia 6.1 Plus', N'5.84 inch FHD Display, 3000 Mah Battery, Android 10, Snapdragon Processor', N'https://rukminim1.flixcart.com/image/416/416/jl16s280/mobile/y/j/b/nokia-6-1-plus-na-original-imaf892ectvgjg9x.jpeg?q=70', 15000, 140)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5009, N'iPhone 12', N'6.1 inch FHD+ Display, 2800 Mah Battery, iOs 14, A14 Processor', N'https://rukminim1.flixcart.com/image/312/312/kg8avm80/mobile/u/q/d/apple-iphone-12-pro-dummyapplefsn-original-imafwgbrcgcar4rn.jpeg?q=70', 79000, 200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5010, N'Dell Inspiron 15 5590', N'15.6 inch FHD Display, i5- 10th Gen Processor, 8-gb Ram, 512 GB SSD , Windows 10, 3000 Mah Battery', N'https://i.dell.com/is/image/DellContent//content/dam/global-asset-library/Products/Notebooks/Inspiron/15_5590_non-touch/in5590nt_cnb_00055lf110_gy.psd?fmt=pjpg&pscan=auto&scl=1&hei=402&wid=402&qlt=95,0&resMode=sharp2&op_usm=1.75,0.3,2,0&size=402,402', 64999, 120)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5011, N'LG Refrigerator', N'Double Door, Extra-cool, Advanced Cooling technology 2.0, 256 litre capacity', N'https://rukminim1.flixcart.com/image/416/416/kbb49zk0/refrigerator-new/5/q/t/gl-t372jds3-3-lg-original-imafszefe8kbcmke.jpeg?q=70', 19999, 74)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5012, N'Samsung Television', N'60 cm Wide Panel, FHD resolution, Smart TV based on Android', N'https://rukminim1.flixcart.com/image/416/416/kbl4cy80/television/j/e/n/samsung-ua55tue60fkxxl-original-imafswfrpmhx8erz.jpeg?q=70', 25000, 200)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [UQ__Bank__AA08CB328C141E3E]    Script Date: 30-11-2020 14:49:59 ******/
ALTER TABLE [dbo].[Bank] ADD UNIQUE NONCLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CardTabl__737584F642C36349]    Script Date: 30-11-2020 14:49:59 ******/
ALTER TABLE [dbo].[CardTable] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Consumer__A9D10534FF674AB9]    Script Date: 30-11-2020 14:49:59 ******/
ALTER TABLE [dbo].[ConsumerTable] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Consumer__F3EE33E24DA612CF]    Script Date: 30-11-2020 14:49:59 ******/
ALTER TABLE [dbo].[ConsumerTable] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [df_AdminID]  DEFAULT ((4001)) FOR [AdminID]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [df_AdminName]  DEFAULT ('Rajiv') FOR [AdminName]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [df_ActivationStatus]  DEFAULT ('False') FOR [ActivationStatus]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[ConsumerTable] ([UserName])
GO
ALTER TABLE [dbo].[CardTable]  WITH CHECK ADD FOREIGN KEY([Name])
REFERENCES [dbo].[Admin] ([UserName])
GO
ALTER TABLE [dbo].[ConsumerTable]  WITH CHECK ADD FOREIGN KEY([CardType])
REFERENCES [dbo].[CardTypeTable] ([CardType])
GO
ALTER TABLE [dbo].[ConsumerTable]  WITH CHECK ADD FOREIGN KEY([SelectBank])
REFERENCES [dbo].[Bank] ([BankName])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CardNumber])
REFERENCES [dbo].[CardTable] ([CardNumber])
GO
ALTER TABLE [dbo].[OTP_Validation]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[ConsumerTable] ([UserName])
GO
/****** Object:  StoredProcedure [dbo].[adduserinadmin]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[adduserinadmin] @username nvarchar(40)
as begin
insert into Admin (UserName)values (@username)
end
GO
/****** Object:  StoredProcedure [dbo].[validtill]    Script Date: 30-11-2020 14:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[validtill] 
as begin 

declare  @validdaate date = dateadd(year,5,getdate() )
declare @month int = datepart(MM, @validdaate)
declare @year int= FORMAT(@validdaate, 'yy')
declare @validtill varchar(20) = concat(@month,'/',@year )
select @validtill
end
GO
USE [master]
GO
ALTER DATABASE [Finance] SET  READ_WRITE 
GO
