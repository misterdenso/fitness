USE [DWH]
GO
ALTER TABLE [dbo].[CardSales] DROP CONSTRAINT [FK_CardSales_Clubs]
GO
/****** Object:  Table [dbo].[Workouts]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Workouts]') AND type in (N'U'))
DROP TABLE [dbo].[Workouts]
GO
/****** Object:  Table [dbo].[VisitorsStat]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VisitorsStat]') AND type in (N'U'))
DROP TABLE [dbo].[VisitorsStat]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Visitors]') AND type in (N'U'))
DROP TABLE [dbo].[Visitors]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
DROP TABLE [dbo].[Settings]
GO
/****** Object:  Table [dbo].[SalesPlan]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesPlan]') AND type in (N'U'))
DROP TABLE [dbo].[SalesPlan]
GO
/****** Object:  Table [dbo].[RetentionRateFacts]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RetentionRateFacts]') AND type in (N'U'))
DROP TABLE [dbo].[RetentionRateFacts]
GO
/****** Object:  Table [dbo].[PercentFacts]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PercentFacts]') AND type in (N'U'))
DROP TABLE [dbo].[PercentFacts]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Memberships]') AND type in (N'U'))
DROP TABLE [dbo].[Memberships]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Managers]') AND type in (N'U'))
DROP TABLE [dbo].[Managers]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
DROP TABLE [dbo].[Items]
GO
/****** Object:  Table [dbo].[FitnessSales]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FitnessSales]') AND type in (N'U'))
DROP TABLE [dbo].[FitnessSales]
GO
/****** Object:  Table [dbo].[ExtensionTypes]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtensionTypes]') AND type in (N'U'))
DROP TABLE [dbo].[ExtensionTypes]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clubs]') AND type in (N'U'))
DROP TABLE [dbo].[Clubs]
GO
/****** Object:  Table [dbo].[CardSales]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CardSales]') AND type in (N'U'))
DROP TABLE [dbo].[CardSales]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 31.10.2022 18:01:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Calendar]') AND type in (N'U'))
DROP TABLE [dbo].[Calendar]
GO
USE [master]
GO
/****** Object:  Database [DWH]    Script Date: 31.10.2022 18:01:13 ******/
DROP DATABASE [DWH]
GO
/****** Object:  Database [DWH]    Script Date: 31.10.2022 18:01:13 ******/
CREATE DATABASE [DWH] ON  PRIMARY 
( NAME = N'DWH', FILENAME = N'D:\SQL2008DATA\DWH\DWH.mdf' , SIZE = 207872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DWH_log', FILENAME = N'D:\SQL2008DATA\DWH\DWH_log.ldf' , SIZE = 291904KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DWH] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DWH] SET  MULTI_USER 
GO
ALTER DATABASE [DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH] SET DB_CHAINING OFF 
GO
USE [DWH]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 31.10.2022 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[Date] [datetime] NOT NULL,
	[Week] [int] NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardSales]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardSales](
	[Date] [datetime] NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[ClientID] [nvarchar](50) NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[MembershipID] [nvarchar](50) NOT NULL,
	[ExtensionTypeID] [nvarchar](50) NOT NULL,
	[Quantity] [numeric](21, 3) NULL,
	[Amount] [numeric](21, 3) NULL,
	[DurationMonth] [numeric](21, 3) NULL,
	[DurationDays] [numeric](21, 3) NULL,
 CONSTRAINT [PK_CardSales] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ItemID] ASC,
	[ClientID] ASC,
	[ClubID] ASC,
	[ManagerID] ASC,
	[MembershipID] ASC,
	[ExtensionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clubs] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Department] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtensionTypes]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtensionTypes](
	[ExtensionTypeID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExtensionTypes] PRIMARY KEY CLUSTERED 
(
	[ExtensionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FitnessSales]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FitnessSales](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Amount] [numeric](21, 3) NULL,
 CONSTRAINT [PK_FitnessSales] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClubID] ASC,
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[OrangeArt] [nvarchar](200) NULL,
	[Folder] [nvarchar](200) NULL,
	[ItemDepartment] [nvarchar](50) NULL,
	[ItemType] [nvarchar](50) NULL,
	[ItemGroup] [nvarchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ShortName] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[Date] [datetime] NOT NULL,
	[ClientID] [nvarchar](50) NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Memberships] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClientID] ASC,
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PercentFacts]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PercentFacts](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[Expired] [int] NULL,
	[Continued] [int] NULL,
 CONSTRAINT [PK_PercentFacts] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClubID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RetentionRateFacts]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetentionRateFacts](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[QtyPast] [nvarchar](50) NULL,
	[QtyRet] [nvarchar](50) NULL,
	[QtyRetTotal] [nvarchar](50) NULL,
	[ManagerTotal] [nvarchar](50) NULL,
	[ManagerRet] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPlan]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPlan](
	[ManagerID] [nvarchar](50) NOT NULL,
	[PlanTypeID] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[SalesPlan] [numeric](21, 3) NULL,
	[CompletedPlanAmount] [numeric](21, 3) NULL,
	[CompletedPlanQty] [numeric](21, 3) NULL,
 CONSTRAINT [PK_SalesPlan] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC,
	[PlanTypeID] ASC,
	[Date] ASC,
	[ClubID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitors](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[Quantity] [numeric](21, 3) NULL,
 CONSTRAINT [PK_Visitors] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClubID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitorsStat]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorsStat](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_VisitorsStat] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClubID] ASC,
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workouts]    Script Date: 31.10.2022 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workouts](
	[Date] [datetime] NOT NULL,
	[SegmentID] [nvarchar](50) NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[WorkoutID] [int] NULL,
	[Visitors] [int] NULL,
 CONSTRAINT [PK_Workouts] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[SegmentID] ASC,
	[ClubID] ASC,
	[ServiceType] ASC,
	[Department] ASC,
	[ItemID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardSales]  WITH CHECK ADD  CONSTRAINT [FK_CardSales_Clubs] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Clubs] ([Code])
GO
ALTER TABLE [dbo].[CardSales] CHECK CONSTRAINT [FK_CardSales_Clubs]
GO
USE [master]
GO
ALTER DATABASE [DWH] SET  READ_WRITE 
GO
