USE [master]
GO
/****** Object:  Database [E_Commerce_DW_3]    Script Date: 5/27/2025 5:21:08 PM ******/
CREATE DATABASE [E_Commerce_DW_3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_Commerce_DW', FILENAME = N'D:\Programs\MSSQL16.SQLEXPRESS\MSSQL\DATA\E_Commerce_DW_3.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E_Commerce_DW_log', FILENAME = N'D:\Programs\MSSQL16.SQLEXPRESS\MSSQL\DATA\E_Commerce_DW_3_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E_Commerce_DW_3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_Commerce_DW_3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_Commerce_DW_3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_Commerce_DW_3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_Commerce_DW_3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E_Commerce_DW_3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_Commerce_DW_3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET RECOVERY FULL 
GO
ALTER DATABASE [E_Commerce_DW_3] SET  MULTI_USER 
GO
ALTER DATABASE [E_Commerce_DW_3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_Commerce_DW_3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_Commerce_DW_3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_Commerce_DW_3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E_Commerce_DW_3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E_Commerce_DW_3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E_Commerce_DW_3] SET QUERY_STORE = ON
GO
ALTER DATABASE [E_Commerce_DW_3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E_Commerce_DW_3]
GO
/****** Object:  Schema [DWH]    Script Date: 5/27/2025 5:21:08 PM ******/
CREATE SCHEMA [DWH]
GO
/****** Object:  Schema [STG]    Script Date: 5/27/2025 5:21:08 PM ******/
CREATE SCHEMA [STG]
GO
/****** Object:  Table [dbo].[DWH.D_CampaignPerformanceFact]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWH.D_CampaignPerformanceFact](
	[campaign_performance_key] [int] IDENTITY(1,1) NOT NULL,
	[campaign_id] [int] NOT NULL,
	[subcategory_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date_key] [int] NOT NULL,
	[total_quantity] [int] NOT NULL,
	[total_sales] [decimal](12, 2) NOT NULL,
	[discounted_amount] [decimal](12, 2) NOT NULL,
	[returned_amount] [decimal](12, 2) NOT NULL,
	[net_sales] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[campaign_performance_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_returns]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_returns](
	[return_fact_key] [int] IDENTITY(1,1) NOT NULL,
	[return_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[customer_key] [int] NOT NULL,
	[product_key] [int] NOT NULL,
	[date_key] [int] NOT NULL,
	[return_junk_key] [int] NOT NULL,
	[amount_refunded] [decimal](10, 2) NULL,
	[returned_quantity] [int] NULL,
	[original_order_amount] [decimal](10, 2) NULL,
	[processing_days] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[return_fact_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_fact_campaign]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_fact_campaign](
	[campaign_id] [int] NOT NULL,
	[subcategory_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date_key] [int] NULL,
	[total_orders] [int] NULL,
	[total_quantity] [int] NULL,
	[total_sales] [decimal](12, 2) NULL,
	[discounted_amount] [decimal](12, 2) NULL,
	[returned_amount] [decimal](12, 2) NULL,
	[net_sales] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_Fact_returns]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Fact_returns](
	[return_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[amount_refunded] [decimal](10, 2) NOT NULL,
	[quantity_returned] [int] NOT NULL,
	[original_amount] [decimal](10, 2) NULL,
	[return_reason] [nvarchar](255) NULL,
	[return_date] [date] NOT NULL,
	[order_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Campaign]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Campaign](
	[campaign_key] [int] IDENTITY(1,1) NOT NULL,
	[src_id] [int] NOT NULL,
	[campaign_name] [nvarchar](100) NULL,
	[offer_week] [nvarchar](100) NULL,
	[discount] [decimal](18, 2) NULL,
	[is_active] [char](1) NULL,
	[is_last] [bit] NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[campaign_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Customer]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Customer](
	[customer_key] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[customer_email] [nvarchar](100) NULL,
	[country] [nvarchar](100) NULL,
	[is_last] [bit] NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Date]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Date](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
	[HolidayName] [varchar](20) NULL,
	[SpecialDays] [varchar](20) NULL,
	[FinancialYear] [int] NULL,
	[FinancialQuater] [int] NULL,
	[FinancialMonth] [int] NULL,
	[FirstDateofYear] [date] NULL,
	[LastDateofYear] [date] NULL,
	[FirstDateofQuater] [date] NULL,
	[LastDateofQuater] [date] NULL,
	[FirstDateofMonth] [date] NULL,
	[LastDateofMonth] [date] NULL,
	[FirstDateofWeek] [date] NULL,
	[LastDateofWeek] [date] NULL,
	[CurrentYear] [smallint] NULL,
	[CurrentQuater] [smallint] NULL,
	[CurrentMonth] [smallint] NULL,
	[CurrentWeek] [smallint] NULL,
	[CurrentDay] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Orders]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Orders](
	[order_key] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[campaign_id] [int] NULL,
	[amount] [int] NULL,
	[payment_method_id] [int] NULL,
	[is_last] [bit] NULL,
	[campaign_name] [varchar](255) NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_PaymentMethod]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_PaymentMethod](
	[payment_method_key] [int] IDENTITY(1,1) NOT NULL,
	[src_id] [int] NOT NULL,
	[payment_method_name] [nvarchar](50) NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_method_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Product]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Product](
	[product_key] [int] IDENTITY(1,1) NOT NULL,
	[src_id] [int] NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[category_name] [nvarchar](50) NULL,
	[subcategory_name] [nvarchar](50) NULL,
	[price] [decimal](18, 2) NULL,
	[is_last] [bit] NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_return]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_return](
	[junk_key] [int] IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[junk_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[D_Supplier]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[D_Supplier](
	[supplier_key] [int] IDENTITY(1,1) NOT NULL,
	[src_id] [int] NOT NULL,
	[supplier_name] [nvarchar](255) NULL,
	[supplier_email] [nvarchar](255) NULL,
	[is_last] [bit] NULL,
	[create_timestamp] [datetime] NULL,
	[update_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[Fact_Sales]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[Fact_Sales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[PaymentMethodKey] [int] NULL,
	[SupplierKey] [int] NULL,
	[Quantity] [int] NULL,
	[Subtotal] [numeric](10, 2) NULL,
	[Discount] [numeric](5, 2) NULL,
	[NetRevenue] [numeric](10, 2) NULL,
	[ETLLoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Campaign]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Campaign](
	[campaign_id] [int] NULL,
	[campaign_name] [nvarchar](100) NULL,
	[offer_week] [nvarchar](100) NULL,
	[discount] [decimal](18, 2) NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Conf_Table]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Conf_Table](
	[table_name] [varchar](30) NULL,
	[last_extract_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Customer]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Customer](
	[customer_id] [int] NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[customer_email] [nvarchar](100) NULL,
	[country] [nvarchar](100) NULL,
	[create_timestamp] [datetime] NULL,
	[src_update_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[OrderItems]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[OrderItems](
	[order_item_id] [int] NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[unit_price] [decimal](18, 2) NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Orders]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Orders](
	[order_id_surrogate] [int] NOT NULL,
	[order_id] [int] NULL,
	[customer_id] [int] NULL,
	[order_date] [date] NULL,
	[campaign_id] [int] NULL,
	[amount] [int] NULL,
	[payment_method_id] [int] NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[PaymentMethod]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[PaymentMethod](
	[payment_method_id] [int] NULL,
	[payment_method_name] [nvarchar](50) NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Product]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Product](
	[product_id] [int] NULL,
	[product_name] [nvarchar](100) NULL,
	[description] [nvarchar](100) NULL,
	[category_name] [nvarchar](50) NULL,
	[subcategory_name] [nvarchar](50) NULL,
	[price] [decimal](18, 2) NULL,
	[create_timestamp] [datetime] NULL,
	[src_update_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[returns]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[returns](
	[return_id] [int] NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[return_date] [date] NULL,
	[reason] [nvarchar](50) NULL,
	[amount_refunded] [numeric](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Sales]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Sales](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[supplier_id] [int] NULL,
	[payment_method_id] [int] NULL,
	[order_date] [date] NULL,
	[quantity] [int] NULL,
	[subtotal] [numeric](10, 2) NULL,
	[discount] [numeric](5, 2) NULL,
	[net_revenue] [numeric](10, 2) NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Supplier]    Script Date: 5/27/2025 5:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Supplier](
	[supplier_id] [int] NULL,
	[supplier_name] [nvarchar](255) NULL,
	[supplier_email] [nvarchar](255) NULL,
	[create_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DWH.D_CampaignPerformanceFact] ADD  DEFAULT ((0)) FOR [total_quantity]
GO
ALTER TABLE [dbo].[DWH.D_CampaignPerformanceFact] ADD  DEFAULT ((0)) FOR [total_sales]
GO
ALTER TABLE [dbo].[DWH.D_CampaignPerformanceFact] ADD  DEFAULT ((0)) FOR [discounted_amount]
GO
ALTER TABLE [dbo].[DWH.D_CampaignPerformanceFact] ADD  DEFAULT ((0)) FOR [returned_amount]
GO
ALTER TABLE [dbo].[DWH.D_CampaignPerformanceFact] ADD  DEFAULT ((0)) FOR [net_sales]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [total_orders]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [total_quantity]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [total_sales]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [discounted_amount]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [returned_amount]
GO
ALTER TABLE [dbo].[stg_fact_campaign] ADD  DEFAULT ((0)) FOR [net_sales]
GO
ALTER TABLE [DWH].[D_Campaign] ADD  DEFAULT ((1)) FOR [is_last]
GO
ALTER TABLE [DWH].[D_Campaign] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[D_Customer] ADD  DEFAULT ((1)) FOR [is_last]
GO
ALTER TABLE [DWH].[D_Customer] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[D_PaymentMethod] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[D_Product] ADD  DEFAULT ((1)) FOR [is_last]
GO
ALTER TABLE [DWH].[D_Product] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[D_Supplier] ADD  DEFAULT ((1)) FOR [is_last]
GO
ALTER TABLE [DWH].[D_Supplier] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[Fact_Sales] ADD  DEFAULT (getdate()) FOR [ETLLoadDate]
GO
ALTER TABLE [STG].[Campaign] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[Customer] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[OrderItems] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[Orders] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[PaymentMethod] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[Product] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[Sales] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [STG].[Supplier] ADD  DEFAULT (getdate()) FOR [create_timestamp]
GO
ALTER TABLE [DWH].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [DWH].[D_Customer] ([customer_key])
GO
ALTER TABLE [DWH].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [DWH].[D_Date] ([DateKey])
GO
ALTER TABLE [DWH].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([PaymentMethodKey])
REFERENCES [DWH].[D_PaymentMethod] ([payment_method_key])
GO
ALTER TABLE [DWH].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [DWH].[D_Product] ([product_key])
GO
ALTER TABLE [DWH].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([SupplierKey])
REFERENCES [DWH].[D_Supplier] ([supplier_key])
GO
USE [master]
GO
ALTER DATABASE [E_Commerce_DW_3] SET  READ_WRITE 
GO
