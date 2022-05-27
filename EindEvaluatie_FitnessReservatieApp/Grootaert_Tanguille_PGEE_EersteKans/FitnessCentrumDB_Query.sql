USE [master]
GO
/****** Object:  Database [FitnessCentrumApp]    Script Date: 27/05/2022 14:24:34 ******/
CREATE DATABASE [FitnessCentrumApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessCentrumApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FitnessCentrumApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitnessCentrumApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FitnessCentrumApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FitnessCentrumApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessCentrumApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessCentrumApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessCentrumApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessCentrumApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FitnessCentrumApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessCentrumApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitnessCentrumApp] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessCentrumApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessCentrumApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessCentrumApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessCentrumApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitnessCentrumApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitnessCentrumApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FitnessCentrumApp] SET QUERY_STORE = OFF
GO
USE [FitnessCentrumApp]
GO
/****** Object:  Table [dbo].[FitnessToestel]    Script Date: 27/05/2022 14:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FitnessToestel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ToestelType] [varchar](50) NULL,
	[ToestelStatus] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klant]    Script Date: 27/05/2022 14:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klant](
	[KlantNummer] [int] IDENTITY(1,1) NOT NULL,
	[EmailAdres] [varchar](50) NULL,
	[VoorNaam] [varchar](50) NULL,
	[AchterNaam] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[GeboorteDatum] [datetime] NULL,
	[Interesses] [varchar](50) NULL,
	[KlantType] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservatie]    Script Date: 27/05/2022 14:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservatie](
	[ReservatieNummer] [int] IDENTITY(1,1) NOT NULL,
	[KlantNummer] [int] NOT NULL,
	[FitnessToestelID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[BeginSlot] [int] NOT NULL,
	[AantalSlots] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservatieNummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FitnessToestel] ON 
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (1, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (2, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (3, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (4, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (5, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (6, N'loopband', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (7, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (8, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (9, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (10, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (11, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (12, N'fiets', N'beschikbaar')
GO
INSERT [dbo].[FitnessToestel] ([ID], [ToestelType], [ToestelStatus]) VALUES (15, N'fiets', N'beschikbaar')
GO
SET IDENTITY_INSERT [dbo].[FitnessToestel] OFF
GO
SET IDENTITY_INSERT [dbo].[Klant] ON 
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (1, N'beheerder@tangfit.be', N'Tanguille', N'Grootaert', N'Merelbeke', CAST(N'1999-09-01T00:00:00.000' AS DateTime), N'pcs', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (2, N'Goedele.Jackson@telenet.com', N'Goedele', N'Jackson', N'Eeklo', CAST(N'1970-09-04T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (3, N'Jesse.Parkinson@telenet.com', N'Jesse', N'Parkinson', N'Melle', CAST(N'1984-07-25T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (4, N'Brian.Thorn@hotmail.com', N'Brian', N'Thorn', N'Zele', CAST(N'1962-01-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (5, N'Goedele.Wild@gmail.com', N'Goedele', N'Wild', N'Drongen', CAST(N'1973-03-04T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (6, N'John.Wachters@google.com', N'John', N'Wachters', N'Waarschoot', CAST(N'1998-02-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (7, N'Jesse.Desmet@orange.BE', N'Jesse', N'Desmet', N'Zomergem', CAST(N'1980-03-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (8, N'Marge.Willems@google.com', N'Marge', N'Willems', N'Eeklo', CAST(N'1994-02-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (9, N'Carl.Goeminne@hotmail.com', N'Carl', N'Goeminne', N'Ursel', CAST(N'1990-11-13T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (10, N'Cyren.Goeminne@orange.BE', N'Cyren', N'Goeminne', N'Waarschoot', CAST(N'1990-02-05T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (11, N'Tom.Willems@google.com', N'Tom', N'Willems', N'Wetteren', CAST(N'1970-04-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (12, N'Katrien.Cruise@google.com', N'Katrien', N'Cruise', N'Deinze', CAST(N'1960-02-05T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (13, N'Piet.Adams@orange.BE', N'Piet', N'Adams', N'Melle', CAST(N'1975-02-07T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (14, N'Pol.Adams@hotmail.com', N'Pol', N'Adams', N'Zele', CAST(N'1980-02-03T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (15, N'Ilana.Jansens@gmail.com', N'Ilana', N'Jansens', N'Gent', CAST(N'1995-04-08T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (16, N'Olive.Wachters@hotmail.com', N'Olive', N'Wachters', N'Wondelgem', CAST(N'2003-07-05T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (17, N'Bill.VanMoer@google.com', N'Bill', N'Van Moer', N'Gent', CAST(N'1963-08-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (18, N'Oliver.Kramer@google.com', N'Oliver', N'Kramer', N'Zomergem', CAST(N'1968-03-14T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (19, N'Tine.Wachters@gmail.com', N'Tine', N'Wachters', N'Ursel', CAST(N'1962-04-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (20, N'Inge.Jackson@telenet.com', N'Inge', N'Jackson', N'Wondelgem', CAST(N'1973-08-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (21, N'Goedele.Rogiers@telenet.com', N'Goedele', N'Rogiers', N'Ledeberg', CAST(N'1966-08-10T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (22, N'Ellen.Buyle@gmail.com', N'Ellen', N'Buyle', N'Waarschoot', CAST(N'2002-10-08T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (23, N'Tine.Buyle@orange.BE', N'Tine', N'Buyle', N'Deinze', CAST(N'1978-10-11T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (24, N'Bill.Thorn@hotmail.com', N'Bill', N'Thorn', N'Zomergem', CAST(N'1987-03-15T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (25, N'Mark.VanDorpe@telenet.com', N'Mark', N'Van Dorpe', N'Gentbrugge', CAST(N'1965-07-20T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (26, N'Oliver.Vangent@telenet.com', N'Oliver', N'Vangent', N'Waarschoot', CAST(N'1964-03-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (27, N'Karl.Goeminne@gmail.com', N'Karl', N'Goeminne', N'Zulte', CAST(N'1984-12-20T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (28, N'Mark.Jansens@hotmail.com', N'Mark', N'Jansens', N'Zele', CAST(N'1997-02-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (29, N'Carl.Wild@telenet.com', N'Carl', N'Wild', N'Gentbrugge', CAST(N'1994-08-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (30, N'Tine.Vandeneinde@telenet.com', N'Tine', N'Vandeneinde', N'Zomergem', CAST(N'1966-05-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (31, N'Cyren.Jansens@gmail.com', N'Cyren', N'Jansens', N'Melle', CAST(N'1979-10-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (32, N'Nancy.Stone@orange.BE', N'Nancy', N'Stone', N'Drongen', CAST(N'2004-06-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (33, N'Suzan.Tyson@google.com', N'Suzan', N'Tyson', N'Mariakerke', CAST(N'1997-03-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (34, N'Ellen.Delpuerte@google.com', N'Ellen', N'Delpuerte', N'Deinze', CAST(N'1961-11-02T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (35, N'Frans.Olson@orange.BE', N'Frans', N'Olson', N'Melle', CAST(N'1962-02-18T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (36, N'Jack.Ingvartson@gmail.com', N'Jack', N'Ingvartson', N'Zele', CAST(N'1990-02-03T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (37, N'Alice.Pike@google.com', N'Alice', N'Pike', N'Adegem', CAST(N'1976-10-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (38, N'Debora.Vranckx@orange.BE', N'Debora', N'Vranckx', N'Petegem', CAST(N'1991-04-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (39, N'Franz.Willems@telenet.com', N'Franz', N'Willems', N'Mariakerke', CAST(N'1977-09-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (40, N'Tine.Parkinson@hotmail.com', N'Tine', N'Parkinson', N'Zomergem', CAST(N'1997-07-15T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (41, N'John.Tyson@telenet.com', N'John', N'Tyson', N'Zomergem', CAST(N'1978-12-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (42, N'Brian.Vanderplas@telenet.com', N'Brian', N'Van der plas', N'Zele', CAST(N'1962-05-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (43, N'John.Ingvartson@google.com', N'John', N'Ingvartson', N'Ursel', CAST(N'1993-03-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (44, N'Alice.Wachters@gmail.com', N'Alice', N'Wachters', N'Maldegem', CAST(N'1969-11-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (45, N'Oliver.Smet@google.com', N'Oliver', N'Smet', N'Gentbrugge', CAST(N'1977-05-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (46, N'Franz.Pike@orange.BE', N'Franz', N'Pike', N'Eeklo', CAST(N'1984-02-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (47, N'Alice.Vranckx@orange.BE', N'Alice', N'Vranckx', N'Adegem', CAST(N'2003-05-22T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (48, N'Heinz.Bollen@orange.BE', N'Heinz', N'Bollen', N'Waregem', CAST(N'1973-09-11T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (49, N'Frans.Wachters@telenet.com', N'Frans', N'Wachters', N'Eeklo', CAST(N'1990-07-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (50, N'Piet.Cruise@google.com', N'Piet', N'Cruise', N'Waregem', CAST(N'1969-09-12T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (51, N'Veerle.Tuinman@telenet.com', N'Veerle', N'Tuinman', N'Drongen', CAST(N'1963-05-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (52, N'Olive.VanAcker@telenet.com', N'Olive', N'Van Acker', N'Wondelgem', CAST(N'1966-02-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (53, N'Goedele.Pike@google.com', N'Goedele', N'Pike', N'Zomergem', CAST(N'1960-11-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (54, N'Nancy.Stone@google.com', N'Nancy', N'Stone', N'Zulte', CAST(N'1977-05-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (55, N'Bree.Delfino@google.com', N'Bree', N'Delfino', N'Ursel', CAST(N'1973-12-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (56, N'Roman.Vangent@orange.BE', N'Roman', N'Vangent', N'Zulte', CAST(N'1963-09-09T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (57, N'Oliver.Vandermolen@orange.BE', N'Oliver', N'Van der molen', N'Wetteren', CAST(N'1984-09-20T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (58, N'Tom.Jansens@gmail.com', N'Tom', N'Jansens', N'Melle', CAST(N'1975-10-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (59, N'Katrien.Cruise@orange.BE', N'Katrien', N'Cruise', N'Maldegem', CAST(N'1968-11-10T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (60, N'Cyren.Thorn@hotmail.com', N'Cyren', N'Thorn', N'Zele', CAST(N'1962-01-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (61, N'Sven.Cruise@telenet.com', N'Sven', N'Cruise', N'Mariakerke', CAST(N'1996-09-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (62, N'Bree.Olson@google.com', N'Bree', N'Olson', N'Mariakerke', CAST(N'2007-10-17T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (63, N'Orson.Decroo@hotmail.com', N'Orson', N'Decroo', N'Eeklo', CAST(N'1979-06-21T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (64, N'Franz.Delpuerte@google.com', N'Franz', N'Delpuerte', N'Zele', CAST(N'1980-05-08T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (65, N'Inge.Adams@orange.BE', N'Inge', N'Adams', N'Drongen', CAST(N'1985-10-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (66, N'Maria.Rogiers@hotmail.com', N'Maria', N'Rogiers', N'Zulte', CAST(N'1988-05-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (67, N'Ellen.Thorn@google.com', N'Ellen', N'Thorn', N'Wetteren', CAST(N'2000-12-04T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (68, N'Jeff.Pike@telenet.com', N'Jeff', N'Pike', N'Mariakerke', CAST(N'1985-02-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (69, N'Orson.Desmet@gmail.com', N'Orson', N'Desmet', N'Gent', CAST(N'1976-11-12T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (70, N'Veerle.Pike@orange.BE', N'Veerle', N'Pike', N'Gentbrugge', CAST(N'2006-01-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (71, N'Inga.Willems@orange.BE', N'Inga', N'Willems', N'Zomergem', CAST(N'1978-12-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (72, N'Roman.Loomans@orange.BE', N'Roman', N'Loomans', N'Waarschoot', CAST(N'1989-09-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (73, N'Pete.Crawler@telenet.com', N'Pete', N'Crawler', N'Zulte', CAST(N'2000-10-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (74, N'Maria.Peeters@google.com', N'Maria', N'Peeters', N'Mariakerke', CAST(N'1993-09-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (75, N'Oliver.Willems@hotmail.com', N'Oliver', N'Willems', N'Adegem', CAST(N'1981-05-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (76, N'John.Rogiers@hotmail.com', N'John', N'Rogiers', N'Zulte', CAST(N'1994-05-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (77, N'Pol.Verstappen@gmail.com', N'Pol', N'Verstappen', N'Drongen', CAST(N'1976-02-18T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (78, N'Brian.Desmet@hotmail.com', N'Brian', N'Desmet', N'Zulte', CAST(N'2006-06-20T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (79, N'Inga.Cruise@orange.BE', N'Inga', N'Cruise', N'Waregem', CAST(N'1996-01-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (80, N'Jeff.Vanderplas@orange.BE', N'Jeff', N'Van der plas', N'Drongen', CAST(N'1962-09-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (81, N'Piet.Rogiers@gmail.com', N'Piet', N'Rogiers', N'Waregem', CAST(N'1995-09-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (82, N'Inge.Vanderplas@gmail.com', N'Inge', N'Van der plas', N'Gentbrugge', CAST(N'1995-03-26T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (83, N'Orson.Wild@orange.BE', N'Orson', N'Wild', N'Adegem', CAST(N'1993-11-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (84, N'Marge.Willems@telenet.com', N'Marge', N'Willems', N'Gent', CAST(N'1974-03-20T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (85, N'Ellen.Peeters@gmail.com', N'Ellen', N'Peeters', N'Ledeberg', CAST(N'1966-04-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (86, N'Karen.Vandeneinde@google.com', N'Karen', N'Vandeneinde', N'Melle', CAST(N'1965-04-18T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (87, N'Maria.VanDorpe@telenet.com', N'Maria', N'Van Dorpe', N'Zomergem', CAST(N'2001-12-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (88, N'Nancy.Peeters@google.com', N'Nancy', N'Peeters', N'Zomergem', CAST(N'2007-11-01T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (89, N'Selma.Vandermolen@gmail.com', N'Selma', N'Van der molen', N'Ledeberg', CAST(N'1974-06-16T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (90, N'Jeff.Smet@gmail.com', N'Jeff', N'Smet', N'Zomergem', CAST(N'1976-07-01T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (91, N'Heinz.Vranckx@orange.BE', N'Heinz', N'Vranckx', N'Gentbrugge', CAST(N'1973-11-20T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (92, N'Cyren.Johanson@google.com', N'Cyren', N'Johanson', N'Ledeberg', CAST(N'1979-09-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (93, N'Valerie.Smet@gmail.com', N'Valerie', N'Smet', N'Ursel', CAST(N'1985-05-16T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (94, N'Frans.Goeminne@gmail.com', N'Frans', N'Goeminne', N'Waarschoot', CAST(N'1969-12-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (95, N'Bree.VanMoer@orange.BE', N'Bree', N'Van Moer', N'Petegem', CAST(N'1988-02-09T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (96, N'Veerle.Peeters@orange.BE', N'Veerle', N'Peeters', N'Eeklo', CAST(N'1998-12-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (97, N'Olive.Peters@telenet.com', N'Olive', N'Peters', N'Mariakerke', CAST(N'1964-10-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (98, N'Inga.Kramer@google.com', N'Inga', N'Kramer', N'Waregem', CAST(N'1981-05-06T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (99, N'George.Bollen@gmail.com', N'George', N'Bollen', N'Zele', CAST(N'2005-06-18T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (100, N'Katrien.Simpson@hotmail.com', N'Katrien', N'Simpson', N'Adegem', CAST(N'1985-07-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (101, N'Karen.Verschooten@google.com', N'Karen', N'Verschooten', N'Petegem', CAST(N'2000-06-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (102, N'Cyren.Simpson@hotmail.com', N'Cyren', N'Simpson', N'Drongen', CAST(N'1988-02-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (103, N'Olive.Johanson@orange.BE', N'Olive', N'Johanson', N'Zele', CAST(N'1980-03-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (104, N'Roman.Adams@google.com', N'Roman', N'Adams', N'Ledeberg', CAST(N'1981-05-21T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (105, N'John.Thorn@google.com', N'John', N'Thorn', N'Waregem', CAST(N'1991-07-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (106, N'George.Delpuerte@gmail.com', N'George', N'Delpuerte', N'Wetteren', CAST(N'1985-03-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (107, N'Selma.Verschooten@gmail.com', N'Selma', N'Verschooten', N'Zomergem', CAST(N'1990-11-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (108, N'Pol.DeVught@hotmail.com', N'Pol', N'De Vught', N'Zulte', CAST(N'1964-02-05T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (109, N'Maria.Bollen@gmail.com', N'Maria', N'Bollen', N'Drongen', CAST(N'1986-08-21T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (110, N'Tom.Tyson@hotmail.com', N'Tom', N'Tyson', N'Wetteren', CAST(N'1967-12-22T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (111, N'Debora.Peeters@telenet.com', N'Debora', N'Peeters', N'Zomergem', CAST(N'1964-09-27T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (112, N'Maria.VanDorpe@orange.BE', N'Maria', N'Van Dorpe', N'Maldegem', CAST(N'1998-10-02T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (113, N'Tine.Decroo@orange.BE', N'Tine', N'Decroo', N'Ursel', CAST(N'1993-06-06T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (114, N'Ellen.Goeminne@gmail.com', N'Ellen', N'Goeminne', N'Wondelgem', CAST(N'1962-11-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (115, N'Orson.Delpuerte@orange.BE', N'Orson', N'Delpuerte', N'Gentbrugge', CAST(N'1985-03-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (116, N'Bart.Tuinman@hotmail.com', N'Bart', N'Tuinman', N'Zele', CAST(N'1983-12-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (117, N'Mark.Peters@google.com', N'Mark', N'Peters', N'Adegem', CAST(N'2002-02-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (118, N'Oliver.Decroo@orange.BE', N'Oliver', N'Decroo', N'Adegem', CAST(N'1999-05-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (119, N'Bill.Goeminne@gmail.com', N'Bill', N'Goeminne', N'Ledeberg', CAST(N'1968-08-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (120, N'Veerle.Simpson@telenet.com', N'Veerle', N'Simpson', N'Ursel', CAST(N'1990-11-24T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (121, N'Inge.Vandeneinde@orange.BE', N'Inge', N'Vandeneinde', N'Melle', CAST(N'2007-04-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (122, N'Valerie.Bollen@orange.BE', N'Valerie', N'Bollen', N'Zulte', CAST(N'1984-05-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (123, N'Jack.Vanderplas@hotmail.com', N'Jack', N'Van der plas', N'Adegem', CAST(N'1971-04-06T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (124, N'Tom.Delfino@google.com', N'Tom', N'Delfino', N'Ledeberg', CAST(N'1973-08-05T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (125, N'Bart.VanAcker@google.com', N'Bart', N'Van Acker', N'Zulte', CAST(N'1996-02-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (126, N'Goedele.Parkinson@hotmail.com', N'Goedele', N'Parkinson', N'Melle', CAST(N'1975-02-20T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (127, N'Bart.Delores@hotmail.com', N'Bart', N'Delores', N'Maldegem', CAST(N'1963-09-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (128, N'Nancy.Cruise@gmail.com', N'Nancy', N'Cruise', N'Wetteren', CAST(N'1999-03-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (129, N'Inge.Wachters@hotmail.com', N'Inge', N'Wachters', N'Mariakerke', CAST(N'1971-03-17T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (130, N'Oliver.Delores@telenet.com', N'Oliver', N'Delores', N'Melle', CAST(N'1988-09-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (131, N'Bill.Jackson@google.com', N'Bill', N'Jackson', N'Ursel', CAST(N'1985-12-19T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (132, N'Suzan.Merckx@orange.BE', N'Suzan', N'Merckx', N'Gentbrugge', CAST(N'1967-03-13T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (133, N'Bill.VanDyck@hotmail.com', N'Bill', N'Van Dyck', N'Gent', CAST(N'2004-05-12T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (134, N'Jesse.Verschooten@orange.BE', N'Jesse', N'Verschooten', N'Drongen', CAST(N'1969-01-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (135, N'Alice.VanMoer@hotmail.com', N'Alice', N'Van Moer', N'Mariakerke', CAST(N'1985-04-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (136, N'Inge.VanDyck@hotmail.com', N'Inge', N'Van Dyck', N'Ursel', CAST(N'1972-10-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (137, N'Maria.Simpson@google.com', N'Maria', N'Simpson', N'Zele', CAST(N'1965-12-21T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (138, N'Jeff.Desmet@hotmail.com', N'Jeff', N'Desmet', N'Drongen', CAST(N'1964-02-01T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (139, N'Selma.Adams@telenet.com', N'Selma', N'Adams', N'Zulte', CAST(N'1965-06-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (140, N'Ilana.Loomans@google.com', N'Ilana', N'Loomans', N'Ledeberg', CAST(N'1980-03-21T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (141, N'Mark.Wild@hotmail.com', N'Mark', N'Wild', N'Waregem', CAST(N'1990-07-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (142, N'Bart.Peters@hotmail.com', N'Bart', N'Peters', N'Maldegem', CAST(N'1965-07-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (143, N'Alice.Parkinson@telenet.com', N'Alice', N'Parkinson', N'Wondelgem', CAST(N'2007-01-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (144, N'Orson.Vandermolen@google.com', N'Orson', N'Van der molen', N'Gentbrugge', CAST(N'1975-11-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (145, N'Orson.Peeters@google.com', N'Orson', N'Peeters', N'Ledeberg', CAST(N'1961-06-10T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (146, N'Goedele.Kramer@google.com', N'Goedele', N'Kramer', N'Ledeberg', CAST(N'1999-05-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (147, N'George.Kuit@telenet.com', N'George', N'Kuit', N'Mariakerke', CAST(N'1980-02-02T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (148, N'Sven.Crawler@telenet.com', N'Sven', N'Crawler', N'Ledeberg', CAST(N'1978-04-03T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (149, N'Mark.Johanson@telenet.com', N'Mark', N'Johanson', N'Eeklo', CAST(N'1968-05-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (150, N'Valerie.Wild@google.com', N'Valerie', N'Wild', N'Petegem', CAST(N'1992-03-09T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (151, N'Karl.Vandermolen@orange.BE', N'Karl', N'Van der molen', N'Mariakerke', CAST(N'1989-04-08T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (152, N'Bree.VanDyck@orange.BE', N'Bree', N'Van Dyck', N'Wondelgem', CAST(N'2006-05-23T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (153, N'Veerle.Stone@hotmail.com', N'Veerle', N'Stone', N'Wondelgem', CAST(N'2005-08-22T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (154, N'Carl.VanDyck@hotmail.com', N'Carl', N'Van Dyck', N'Wetteren', CAST(N'1997-02-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (155, N'Brian.Bollen@google.com', N'Brian', N'Bollen', N'Drongen', CAST(N'2002-06-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (156, N'Frans.VanMoer@google.com', N'Frans', N'Van Moer', N'Ursel', CAST(N'2000-01-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (157, N'George.Tyson@hotmail.com', N'George', N'Tyson', N'Wetteren', CAST(N'1996-04-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (158, N'Jeff.Peeters@orange.BE', N'Jeff', N'Peeters', N'Waregem', CAST(N'1963-07-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (159, N'Franz.Vranckx@orange.BE', N'Franz', N'Vranckx', N'Waregem', CAST(N'1997-10-13T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (160, N'Karl.Peeters@orange.BE', N'Karl', N'Peeters', N'Ursel', CAST(N'1986-03-17T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (161, N'John.Vanderplas@telenet.com', N'John', N'Van der plas', N'Zomergem', CAST(N'1993-10-05T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (162, N'Brian.Willems@hotmail.com', N'Brian', N'Willems', N'Wetteren', CAST(N'1978-07-02T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (163, N'Cyren.Smet@hotmail.com', N'Cyren', N'Smet', N'Wetteren', CAST(N'1982-01-02T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (164, N'Jack.Pike@gmail.com', N'Jack', N'Pike', N'Drongen', CAST(N'2004-11-15T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (165, N'Bill.Coens@gmail.com', N'Bill', N'Coens', N'Zele', CAST(N'1989-10-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (166, N'Karen.Delpuerte@orange.BE', N'Karen', N'Delpuerte', N'Ursel', CAST(N'1975-08-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (167, N'Sven.Willems@gmail.com', N'Sven', N'Willems', N'Gentbrugge', CAST(N'2000-03-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (168, N'Jack.Bollen@hotmail.com', N'Jack', N'Bollen', N'Melle', CAST(N'1996-05-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (169, N'Sven.Rogiers@google.com', N'Sven', N'Rogiers', N'Petegem', CAST(N'1976-02-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (170, N'Jack.Ingvartson@google.com', N'Jack', N'Ingvartson', N'Ledeberg', CAST(N'2004-05-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (171, N'Karen.Verschooten@orange.BE', N'Karen', N'Verschooten', N'Zele', CAST(N'2001-07-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (172, N'Roman.Rogiers@google.com', N'Roman', N'Rogiers', N'Ledeberg', CAST(N'2004-11-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (173, N'Nancy.Rogiers@google.com', N'Nancy', N'Rogiers', N'Eeklo', CAST(N'1970-02-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (174, N'Suzan.Thorn@telenet.com', N'Suzan', N'Thorn', N'Deinze', CAST(N'1960-09-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (175, N'Brian.Wild@google.com', N'Brian', N'Wild', N'Gentbrugge', CAST(N'1986-09-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (176, N'Bill.Loomans@telenet.com', N'Bill', N'Loomans', N'Wetteren', CAST(N'1965-12-21T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (177, N'Suzan.Ingvartson@telenet.com', N'Suzan', N'Ingvartson', N'Petegem', CAST(N'1980-03-06T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (178, N'Ilana.Jackson@telenet.com', N'Ilana', N'Jackson', N'Wondelgem', CAST(N'2000-03-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (179, N'Heinz.Olson@gmail.com', N'Heinz', N'Olson', N'Melle', CAST(N'1996-01-08T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (180, N'Jack.DeVught@telenet.com', N'Jack', N'De Vught', N'Wondelgem', CAST(N'1974-05-07T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (181, N'Tine.Olson@orange.BE', N'Tine', N'Olson', N'Adegem', CAST(N'1996-09-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (182, N'Orson.Vranckx@hotmail.com', N'Orson', N'Vranckx', N'Zomergem', CAST(N'2003-11-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (183, N'Alice.Johanson@orange.BE', N'Alice', N'Johanson', N'Melle', CAST(N'1966-06-18T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (184, N'Tom.Wild@google.com', N'Tom', N'Wild', N'Ledeberg', CAST(N'1965-07-19T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (185, N'Inga.Wachters@gmail.com', N'Inga', N'Wachters', N'Zele', CAST(N'1988-05-18T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (186, N'Bart.Vandermolen@gmail.com', N'Bart', N'Van der molen', N'Zomergem', CAST(N'1967-01-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (187, N'Tine.Delpuerte@telenet.com', N'Tine', N'Delpuerte', N'Zele', CAST(N'1976-03-12T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (188, N'Oliver.Willems@gmail.com', N'Oliver', N'Willems', N'Deinze', CAST(N'1977-08-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (189, N'Jack.Parkinson@google.com', N'Jack', N'Parkinson', N'Melle', CAST(N'1997-09-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (190, N'Orson.Smet@hotmail.com', N'Orson', N'Smet', N'Drongen', CAST(N'1992-11-06T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (191, N'Cindy.VanDyck@telenet.com', N'Cindy', N'Van Dyck', N'Adegem', CAST(N'1992-03-15T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (192, N'Orson.Vandeneinde@hotmail.com', N'Orson', N'Vandeneinde', N'Maldegem', CAST(N'1985-08-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (193, N'Nancy.Vandermolen@telenet.com', N'Nancy', N'Van der molen', N'Ledeberg', CAST(N'1995-05-21T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (194, N'Jesse.Delores@gmail.com', N'Jesse', N'Delores', N'Eeklo', CAST(N'1980-05-14T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (195, N'Jack.Tyson@google.com', N'Jack', N'Tyson', N'Ledeberg', CAST(N'1965-08-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (196, N'Tom.Buyle@google.com', N'Tom', N'Buyle', N'Deinze', CAST(N'1993-03-16T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (197, N'Ilana.Vandermolen@gmail.com', N'Ilana', N'Van der molen', N'Wetteren', CAST(N'1993-12-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (198, N'Karl.Jansens@google.com', N'Karl', N'Jansens', N'Drongen', CAST(N'1974-01-21T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (199, N'Jack.Delfino@google.com', N'Jack', N'Delfino', N'Maldegem', CAST(N'1994-12-22T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (200, N'Jesse.VanDyck@google.com', N'Jesse', N'Van Dyck', N'Ledeberg', CAST(N'2004-05-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (201, N'Selma.Goeminne@google.com', N'Selma', N'Goeminne', N'Maldegem', CAST(N'1966-06-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (202, N'Alice.Kramer@telenet.com', N'Alice', N'Kramer', N'Eeklo', CAST(N'2004-02-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (203, N'Goedele.Vangent@gmail.com', N'Goedele', N'Vangent', N'Drongen', CAST(N'1998-04-19T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (204, N'Ilana.Vangent@google.com', N'Ilana', N'Vangent', N'Petegem', CAST(N'2000-10-02T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (205, N'Roman.Vranckx@google.com', N'Roman', N'Vranckx', N'Waarschoot', CAST(N'1998-11-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (206, N'Karl.Pike@hotmail.com', N'Karl', N'Pike', N'Wondelgem', CAST(N'1980-02-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (207, N'Franz.Pike@hotmail.com', N'Franz', N'Pike', N'Ursel', CAST(N'1968-01-25T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (208, N'Roman.Buyle@google.com', N'Roman', N'Buyle', N'Ledeberg', CAST(N'1994-02-04T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (209, N'Nancy.Willems@hotmail.com', N'Nancy', N'Willems', N'Zele', CAST(N'1986-12-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (210, N'Jeff.Stone@hotmail.com', N'Jeff', N'Stone', N'Deinze', CAST(N'1965-12-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (211, N'Pete.Jansens@orange.BE', N'Pete', N'Jansens', N'Drongen', CAST(N'1991-08-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (212, N'Ilana.Buyle@telenet.com', N'Ilana', N'Buyle', N'Wetteren', CAST(N'1962-01-01T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (213, N'Karl.Vranckx@orange.BE', N'Karl', N'Vranckx', N'Ursel', CAST(N'1970-01-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (214, N'Maria.Loomans@google.com', N'Maria', N'Loomans', N'Zele', CAST(N'1984-01-20T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (215, N'Carl.Cruise@gmail.com', N'Carl', N'Cruise', N'Waregem', CAST(N'1996-10-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (216, N'Bill.Jackson@orange.BE', N'Bill', N'Jackson', N'Mariakerke', CAST(N'1970-11-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (217, N'Inga.Adams@telenet.com', N'Inga', N'Adams', N'Drongen', CAST(N'1995-08-23T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (218, N'Franz.Peeters@hotmail.com', N'Franz', N'Peeters', N'Melle', CAST(N'1988-01-25T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (219, N'Nancy.Desmet@gmail.com', N'Nancy', N'Desmet', N'Zulte', CAST(N'1977-03-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (220, N'Carl.Rogiers@orange.BE', N'Carl', N'Rogiers', N'Zulte', CAST(N'1970-04-12T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (221, N'Piet.Delpuerte@orange.BE', N'Piet', N'Delpuerte', N'Melle', CAST(N'2007-11-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (222, N'Carl.Tuinman@telenet.com', N'Carl', N'Tuinman', N'Gentbrugge', CAST(N'2005-04-02T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (223, N'Tom.Loomans@orange.BE', N'Tom', N'Loomans', N'Ledeberg', CAST(N'1981-11-03T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (224, N'Inge.Vangent@gmail.com', N'Inge', N'Vangent', N'Petegem', CAST(N'1986-06-21T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (225, N'Mark.Kuit@gmail.com', N'Mark', N'Kuit', N'Zele', CAST(N'1976-10-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (226, N'Bart.Buyle@google.com', N'Bart', N'Buyle', N'Zele', CAST(N'1962-10-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (227, N'Katrien.Wild@telenet.com', N'Katrien', N'Wild', N'Wetteren', CAST(N'1975-06-11T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (228, N'Veerle.Smet@hotmail.com', N'Veerle', N'Smet', N'Wondelgem', CAST(N'2004-02-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (229, N'Cindy.Adams@telenet.com', N'Cindy', N'Adams', N'Ledeberg', CAST(N'1991-11-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (230, N'Debora.Jansens@hotmail.com', N'Debora', N'Jansens', N'Waregem', CAST(N'1998-07-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (231, N'Veerle.Parkinson@orange.BE', N'Veerle', N'Parkinson', N'Ledeberg', CAST(N'2006-09-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (232, N'Karl.Vandeneinde@orange.BE', N'Karl', N'Vandeneinde', N'Gent', CAST(N'1984-10-07T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (233, N'Debora.Vangent@orange.BE', N'Debora', N'Vangent', N'Adegem', CAST(N'1979-01-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (234, N'Suzan.Stone@google.com', N'Suzan', N'Stone', N'Zele', CAST(N'1970-05-16T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (235, N'Marge.Vandermolen@telenet.com', N'Marge', N'Van der molen', N'Wondelgem', CAST(N'1996-06-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (236, N'Karl.DeVught@google.com', N'Karl', N'De Vught', N'Mariakerke', CAST(N'1975-01-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (237, N'Tine.VanMoer@hotmail.com', N'Tine', N'Van Moer', N'Melle', CAST(N'2000-08-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (238, N'Brian.VanDyck@telenet.com', N'Brian', N'Van Dyck', N'Melle', CAST(N'2004-08-09T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (239, N'Pete.Jackson@google.com', N'Pete', N'Jackson', N'Gent', CAST(N'1999-10-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (240, N'Ellen.Stone@hotmail.com', N'Ellen', N'Stone', N'Gent', CAST(N'2000-10-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (241, N'Pol.Delpuerte@gmail.com', N'Pol', N'Delpuerte', N'Gent', CAST(N'1987-12-25T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (242, N'Heinz.Delpuerte@google.com', N'Heinz', N'Delpuerte', N'Maldegem', CAST(N'1970-09-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (243, N'Tom.Parkinson@telenet.com', N'Tom', N'Parkinson', N'Mariakerke', CAST(N'1964-04-21T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (244, N'Marge.VanDyck@google.com', N'Marge', N'Van Dyck', N'Melle', CAST(N'2007-12-17T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (245, N'Ilana.Vandeneinde@hotmail.com', N'Ilana', N'Vandeneinde', N'Petegem', CAST(N'1997-04-05T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (246, N'Jack.Vranckx@hotmail.com', N'Jack', N'Vranckx', N'Waarschoot', CAST(N'2003-12-17T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (247, N'Carl.Verschooten@orange.BE', N'Carl', N'Verschooten', N'Waarschoot', CAST(N'2006-09-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (248, N'Olive.Loomans@hotmail.com', N'Olive', N'Loomans', N'Deinze', CAST(N'2005-06-07T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (249, N'Ilana.Simpson@google.com', N'Ilana', N'Simpson', N'Zomergem', CAST(N'1986-01-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (250, N'Valerie.Jansens@google.com', N'Valerie', N'Jansens', N'Ursel', CAST(N'1970-01-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (251, N'Bree.Jansens@google.com', N'Bree', N'Jansens', N'Maldegem', CAST(N'2004-09-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (252, N'Tine.Goeminne@hotmail.com', N'Tine', N'Goeminne', N'Gentbrugge', CAST(N'1998-08-17T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (253, N'Frans.Kramer@gmail.com', N'Frans', N'Kramer', N'Zele', CAST(N'1965-07-24T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (254, N'Katrien.Thorn@gmail.com', N'Katrien', N'Thorn', N'Wetteren', CAST(N'2005-04-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (255, N'Cindy.Tyson@hotmail.com', N'Cindy', N'Tyson', N'Melle', CAST(N'1988-09-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (256, N'Suzan.VanDorpe@hotmail.com', N'Suzan', N'Van Dorpe', N'Deinze', CAST(N'1995-03-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (257, N'Orson.Smet@google.com', N'Orson', N'Smet', N'Gentbrugge', CAST(N'2002-09-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (258, N'Karl.VanDyck@hotmail.com', N'Karl', N'Van Dyck', N'Ledeberg', CAST(N'2007-12-01T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (259, N'Jesse.Tyson@orange.BE', N'Jesse', N'Tyson', N'Adegem', CAST(N'1977-12-24T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (260, N'Jack.Goeminne@gmail.com', N'Jack', N'Goeminne', N'Deinze', CAST(N'1978-03-02T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (261, N'Olive.Willems@orange.BE', N'Olive', N'Willems', N'Wondelgem', CAST(N'2007-04-15T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (262, N'Veerle.Ingvartson@telenet.com', N'Veerle', N'Ingvartson', N'Deinze', CAST(N'1960-04-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (263, N'Karl.Tyson@telenet.com', N'Karl', N'Tyson', N'Melle', CAST(N'1961-08-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (264, N'Cindy.Kramer@google.com', N'Cindy', N'Kramer', N'Ursel', CAST(N'2005-05-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (265, N'Bree.VanAcker@gmail.com', N'Bree', N'Van Acker', N'Wondelgem', CAST(N'2004-06-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (266, N'Karen.Peeters@orange.BE', N'Karen', N'Peeters', N'Zulte', CAST(N'1961-07-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (267, N'Pete.Vandermolen@hotmail.com', N'Pete', N'Van der molen', N'Maldegem', CAST(N'1981-10-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (268, N'Debora.Verstappen@hotmail.com', N'Debora', N'Verstappen', N'Deinze', CAST(N'1992-09-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (269, N'John.Verschooten@gmail.com', N'John', N'Verschooten', N'Wetteren', CAST(N'1990-09-01T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (270, N'Orson.Jansens@gmail.com', N'Orson', N'Jansens', N'Mariakerke', CAST(N'1973-02-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (271, N'Valerie.Desmet@hotmail.com', N'Valerie', N'Desmet', N'Mariakerke', CAST(N'1973-04-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (272, N'Alice.Crawler@google.com', N'Alice', N'Crawler', N'Deinze', CAST(N'1972-01-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (273, N'Cindy.Johanson@orange.BE', N'Cindy', N'Johanson', N'Maldegem', CAST(N'1975-05-03T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (274, N'Cindy.VanDyck@hotmail.com', N'Cindy', N'Van Dyck', N'Deinze', CAST(N'1997-03-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (275, N'Karen.Stone@orange.BE', N'Karen', N'Stone', N'Wetteren', CAST(N'1980-07-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (276, N'Olive.Verstappen@gmail.com', N'Olive', N'Verstappen', N'Gent', CAST(N'2003-01-22T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (277, N'Suzan.Rogiers@google.com', N'Suzan', N'Rogiers', N'Eeklo', CAST(N'1968-06-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (278, N'Mike.Vangent@gmail.com', N'Mike', N'Vangent', N'Gent', CAST(N'1969-12-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (279, N'Pol.VanAcker@telenet.com', N'Pol', N'Van Acker', N'Wetteren', CAST(N'1977-12-25T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (280, N'Mike.Verschooten@gmail.com', N'Mike', N'Verschooten', N'Ursel', CAST(N'1972-11-02T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (281, N'Debora.Jackson@hotmail.com', N'Debora', N'Jackson', N'Mariakerke', CAST(N'1970-04-25T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (282, N'Maria.VanDyck@telenet.com', N'Maria', N'Van Dyck', N'Ursel', CAST(N'1986-06-18T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (283, N'Alice.Johanson@google.com', N'Alice', N'Johanson', N'Zulte', CAST(N'1988-05-08T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (284, N'Goedele.Jansens@hotmail.com', N'Goedele', N'Jansens', N'Adegem', CAST(N'1967-05-22T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (285, N'Sven.Delfino@google.com', N'Sven', N'Delfino', N'Melle', CAST(N'1980-01-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (286, N'Bart.Goeminne@telenet.com', N'Bart', N'Goeminne', N'Deinze', CAST(N'1977-05-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (287, N'Bree.Delpuerte@orange.BE', N'Bree', N'Delpuerte', N'Zele', CAST(N'2000-03-20T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (288, N'Goedele.Parkinson@google.com', N'Goedele', N'Parkinson', N'Petegem', CAST(N'1999-06-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (289, N'Sven.Delores@google.com', N'Sven', N'Delores', N'Waregem', CAST(N'1977-02-09T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (290, N'Alice.Wachters@google.com', N'Alice', N'Wachters', N'Zulte', CAST(N'1980-01-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (291, N'Selma.Tyson@google.com', N'Selma', N'Tyson', N'Wondelgem', CAST(N'1994-11-10T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (292, N'Inga.Buyle@orange.BE', N'Inga', N'Buyle', N'Petegem', CAST(N'1995-03-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (293, N'Frans.VanAcker@hotmail.com', N'Frans', N'Van Acker', N'Melle', CAST(N'1996-08-01T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (294, N'Tom.Kramer@google.com', N'Tom', N'Kramer', N'Gent', CAST(N'1976-06-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (295, N'Alice.Jackson@telenet.com', N'Alice', N'Jackson', N'Wetteren', CAST(N'1980-09-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (296, N'Carl.Tyson@google.com', N'Carl', N'Tyson', N'Zomergem', CAST(N'2007-04-05T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (297, N'Katrien.Vangent@gmail.com', N'Katrien', N'Vangent', N'Wondelgem', CAST(N'1984-11-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (298, N'Carl.Willems@telenet.com', N'Carl', N'Willems', N'Wondelgem', CAST(N'1986-05-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (299, N'Karl.Delfino@google.com', N'Karl', N'Delfino', N'Waregem', CAST(N'1968-05-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (300, N'Frans.Rogiers@hotmail.com', N'Frans', N'Rogiers', N'Zomergem', CAST(N'1998-12-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (301, N'Olive.Thorn@hotmail.com', N'Olive', N'Thorn', N'Gentbrugge', CAST(N'2005-11-05T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (302, N'Bart.Decroo@gmail.com', N'Bart', N'Decroo', N'Waregem', CAST(N'1961-09-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (303, N'Debora.Vangent@google.com', N'Debora', N'Vangent', N'Mariakerke', CAST(N'2004-12-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (304, N'Pol.Tuinman@google.com', N'Pol', N'Tuinman', N'Zulte', CAST(N'1970-02-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (305, N'Bill.Stone@google.com', N'Bill', N'Stone', N'Ledeberg', CAST(N'1994-10-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (306, N'Jeff.Olson@hotmail.com', N'Jeff', N'Olson', N'Waregem', CAST(N'1996-09-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (307, N'Orson.Delpuerte@telenet.com', N'Orson', N'Delpuerte', N'Mariakerke', CAST(N'1968-12-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (308, N'Debora.Thorn@orange.BE', N'Debora', N'Thorn', N'Wetteren', CAST(N'1989-02-06T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (309, N'Maria.Johanson@hotmail.com', N'Maria', N'Johanson', N'Wondelgem', CAST(N'1989-04-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (310, N'Selma.VanDyck@hotmail.com', N'Selma', N'Van Dyck', N'Zulte', CAST(N'1980-02-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (311, N'Bill.Johanson@hotmail.com', N'Bill', N'Johanson', N'Zulte', CAST(N'2000-03-03T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (312, N'George.Crawler@gmail.com', N'George', N'Crawler', N'Eeklo', CAST(N'1965-01-22T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (313, N'Jack.Delfino@gmail.com', N'Jack', N'Delfino', N'Melle', CAST(N'1976-04-01T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (314, N'Nancy.Verschooten@telenet.com', N'Nancy', N'Verschooten', N'Zele', CAST(N'2007-08-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (315, N'Inga.Tuinman@gmail.com', N'Inga', N'Tuinman', N'Zulte', CAST(N'1986-12-20T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (316, N'Cyren.Rogiers@gmail.com', N'Cyren', N'Rogiers', N'Ursel', CAST(N'1977-12-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (317, N'Heinz.Desmet@hotmail.com', N'Heinz', N'Desmet', N'Eeklo', CAST(N'1997-04-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (318, N'Jack.Olson@hotmail.com', N'Jack', N'Olson', N'Maldegem', CAST(N'1967-11-06T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (319, N'Goedele.Loomans@telenet.com', N'Goedele', N'Loomans', N'Gentbrugge', CAST(N'1962-10-09T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (320, N'Pete.Smet@google.com', N'Pete', N'Smet', N'Waregem', CAST(N'1984-11-23T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (321, N'Carl.Verschooten@gmail.com', N'Carl', N'Verschooten', N'Zomergem', CAST(N'1982-03-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (322, N'Olive.Crawler@hotmail.com', N'Olive', N'Crawler', N'Zulte', CAST(N'1981-11-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (323, N'Karl.VanDorpe@hotmail.com', N'Karl', N'Van Dorpe', N'Adegem', CAST(N'1966-05-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (324, N'Olive.VanAcker@google.com', N'Olive', N'Van Acker', N'Wondelgem', CAST(N'1974-11-02T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (325, N'Goedele.Delfino@gmail.com', N'Goedele', N'Delfino', N'Adegem', CAST(N'1968-01-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (326, N'Selma.Ingvartson@telenet.com', N'Selma', N'Ingvartson', N'Wetteren', CAST(N'1977-03-20T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (327, N'Jack.Merckx@orange.BE', N'Jack', N'Merckx', N'Wetteren', CAST(N'1972-09-17T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (328, N'Bree.Olson@telenet.com', N'Bree', N'Olson', N'Zele', CAST(N'1991-11-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (329, N'Katrien.Vanderplas@hotmail.com', N'Katrien', N'Van der plas', N'Waarschoot', CAST(N'1969-01-01T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (330, N'Sven.Willems@telenet.com', N'Sven', N'Willems', N'Mariakerke', CAST(N'1963-07-18T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (331, N'Marge.Delfino@hotmail.com', N'Marge', N'Delfino', N'Waarschoot', CAST(N'1989-11-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (332, N'Bree.Cruise@telenet.com', N'Bree', N'Cruise', N'Deinze', CAST(N'1970-12-17T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (333, N'Valerie.Merckx@telenet.com', N'Valerie', N'Merckx', N'Eeklo', CAST(N'1995-03-03T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (334, N'Goedele.Merckx@gmail.com', N'Goedele', N'Merckx', N'Waregem', CAST(N'1967-12-23T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (335, N'Pete.Wild@telenet.com', N'Pete', N'Wild', N'Zulte', CAST(N'2006-10-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (336, N'Selma.Simpson@orange.BE', N'Selma', N'Simpson', N'Adegem', CAST(N'1960-11-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (337, N'Ellen.Decroo@telenet.com', N'Ellen', N'Decroo', N'Wondelgem', CAST(N'2007-01-14T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (338, N'Nancy.Delores@google.com', N'Nancy', N'Delores', N'Wetteren', CAST(N'1965-01-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (339, N'Inge.Parkinson@orange.BE', N'Inge', N'Parkinson', N'Ursel', CAST(N'1985-09-23T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (340, N'Bart.Simpson@google.com', N'Bart', N'Simpson', N'Adegem', CAST(N'1995-07-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (341, N'Marge.Vangent@orange.BE', N'Marge', N'Vangent', N'Ledeberg', CAST(N'1990-11-05T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (342, N'Nancy.VanDorpe@telenet.com', N'Nancy', N'Van Dorpe', N'Zomergem', CAST(N'1972-10-03T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (343, N'Orson.Adams@google.com', N'Orson', N'Adams', N'Gent', CAST(N'1992-11-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (344, N'Bart.Ingvartson@google.com', N'Bart', N'Ingvartson', N'Mariakerke', CAST(N'1989-01-04T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (345, N'Orson.Desmet@hotmail.com', N'Orson', N'Desmet', N'Zomergem', CAST(N'1970-11-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (346, N'Karen.Delores@hotmail.com', N'Karen', N'Delores', N'Wetteren', CAST(N'1975-04-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (347, N'Inga.Decroo@google.com', N'Inga', N'Decroo', N'Zele', CAST(N'2000-12-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (348, N'Brian.Olson@orange.BE', N'Brian', N'Olson', N'Ledeberg', CAST(N'1997-09-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (349, N'Debora.Wachters@google.com', N'Debora', N'Wachters', N'Deinze', CAST(N'2003-12-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (350, N'Maria.Parkinson@orange.BE', N'Maria', N'Parkinson', N'Adegem', CAST(N'1983-06-09T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (351, N'Bree.Merckx@telenet.com', N'Bree', N'Merckx', N'Eeklo', CAST(N'1988-05-17T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (352, N'Oliver.Goeminne@orange.BE', N'Oliver', N'Goeminne', N'Zomergem', CAST(N'1962-10-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (353, N'Olive.Delores@google.com', N'Olive', N'Delores', N'Waregem', CAST(N'1988-02-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (354, N'Oliver.Vandermolen@gmail.com', N'Oliver', N'Van der molen', N'Zulte', CAST(N'1982-10-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (355, N'Mike.Wild@hotmail.com', N'Mike', N'Wild', N'Drongen', CAST(N'1974-12-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (356, N'Oliver.Simpson@google.com', N'Oliver', N'Simpson', N'Deinze', CAST(N'2005-01-21T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (357, N'Piet.Buyle@hotmail.com', N'Piet', N'Buyle', N'Zulte', CAST(N'1973-08-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (358, N'Mike.Verstappen@google.com', N'Mike', N'Verstappen', N'Waarschoot', CAST(N'1984-06-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (359, N'Maria.Vanderplas@google.com', N'Maria', N'Van der plas', N'Deinze', CAST(N'1975-05-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (360, N'Ilana.Vangent@hotmail.com', N'Ilana', N'Vangent', N'Zele', CAST(N'1993-08-20T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (361, N'Tine.Merckx@gmail.com', N'Tine', N'Merckx', N'Maldegem', CAST(N'1962-03-12T00:00:00.000' AS DateTime), N'fun', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (362, N'Oliver.Thorn@gmail.com', N'Oliver', N'Thorn', N'Waregem', CAST(N'1968-01-20T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (363, N'Roman.Tyson@orange.BE', N'Roman', N'Tyson', N'Wetteren', CAST(N'1992-04-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (364, N'Tine.Peeters@orange.BE', N'Tine', N'Peeters', N'Petegem', CAST(N'1970-11-15T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (365, N'Bill.Jansens@orange.BE', N'Bill', N'Jansens', N'Wetteren', CAST(N'1987-07-20T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (366, N'Karen.Vangent@telenet.com', N'Karen', N'Vangent', N'Zomergem', CAST(N'1988-11-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (367, N'Debora.Jackson@google.com', N'Debora', N'Jackson', N'Zele', CAST(N'1978-09-05T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (368, N'Sven.VanMoer@google.com', N'Sven', N'Van Moer', N'Zomergem', CAST(N'1991-08-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (369, N'Roman.VanDyck@gmail.com', N'Roman', N'Van Dyck', N'Petegem', CAST(N'2004-03-11T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (370, N'Marge.Jackson@telenet.com', N'Marge', N'Jackson', N'Deinze', CAST(N'1964-03-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (371, N'Piet.Adams@gmail.com', N'Piet', N'Adams', N'Gent', CAST(N'1974-08-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (372, N'Franz.VanAcker@orange.BE', N'Franz', N'Van Acker', N'Melle', CAST(N'1968-11-24T00:00:00.000' AS DateTime), N'running', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (373, N'Brian.VanDyck@hotmail.com', N'Brian', N'Van Dyck', N'Mariakerke', CAST(N'1967-09-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (374, N'Cindy.Delfino@google.com', N'Cindy', N'Delfino', N'Maldegem', CAST(N'1984-12-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (375, N'George.Wild@google.com', N'George', N'Wild', N'Waregem', CAST(N'1960-12-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (376, N'Ellen.DeVught@gmail.com', N'Ellen', N'De Vught', N'Deinze', CAST(N'1974-11-03T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (377, N'Heinz.VanDorpe@gmail.com', N'Heinz', N'Van Dorpe', N'Gentbrugge', CAST(N'1989-02-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (378, N'Selma.Kramer@orange.BE', N'Selma', N'Kramer', N'Waregem', CAST(N'1992-04-17T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (379, N'Orson.Willems@hotmail.com', N'Orson', N'Willems', N'Ursel', CAST(N'2004-05-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (380, N'Pol.Vanderplas@telenet.com', N'Pol', N'Van der plas', N'Wondelgem', CAST(N'1979-03-24T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (381, N'Debora.Kramer@hotmail.com', N'Debora', N'Kramer', N'Petegem', CAST(N'2002-01-25T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (382, N'Alice.Johanson@telenet.com', N'Alice', N'Johanson', N'Zulte', CAST(N'1990-07-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (383, N'Karl.Ingvartson@google.com', N'Karl', N'Ingvartson', N'Waarschoot', CAST(N'1968-01-12T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (384, N'Suzan.Smet@telenet.com', N'Suzan', N'Smet', N'Ursel', CAST(N'1984-08-06T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (385, N'Bill.Kramer@orange.BE', N'Bill', N'Kramer', N'Eeklo', CAST(N'1963-10-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (386, N'Karen.Bollen@gmail.com', N'Karen', N'Bollen', N'Adegem', CAST(N'1974-06-20T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (387, N'Veerle.Adams@telenet.com', N'Veerle', N'Adams', N'Ursel', CAST(N'1974-12-05T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (388, N'Katrien.Vandeneinde@gmail.com', N'Katrien', N'Vandeneinde', N'Ledeberg', CAST(N'1997-11-25T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (389, N'Katrien.Vandeneinde@orange.BE', N'Katrien', N'Vandeneinde', N'Ledeberg', CAST(N'1989-10-14T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (390, N'Bill.Tuinman@gmail.com', N'Bill', N'Tuinman', N'Melle', CAST(N'1968-09-19T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (391, N'Oliver.DeVught@hotmail.com', N'Oliver', N'De Vught', N'Petegem', CAST(N'1987-04-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (392, N'Karen.Verstappen@telenet.com', N'Karen', N'Verstappen', N'Petegem', CAST(N'1968-02-22T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (393, N'Alice.Vandeneinde@orange.BE', N'Alice', N'Vandeneinde', N'Zele', CAST(N'2006-06-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (394, N'Pol.Delfino@telenet.com', N'Pol', N'Delfino', N'Ursel', CAST(N'1968-02-03T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (395, N'Debora.Vranckx@telenet.com', N'Debora', N'Vranckx', N'Zomergem', CAST(N'2001-06-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (396, N'Suzan.Desmet@hotmail.com', N'Suzan', N'Desmet', N'Gent', CAST(N'1996-12-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (397, N'Frans.Coens@hotmail.com', N'Frans', N'Coens', N'Wetteren', CAST(N'2006-07-12T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (398, N'Inge.Olson@orange.BE', N'Inge', N'Olson', N'Petegem', CAST(N'2007-11-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (399, N'George.Johanson@orange.BE', N'George', N'Johanson', N'Melle', CAST(N'1986-07-09T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (400, N'Sven.Peeters@hotmail.com', N'Sven', N'Peeters', N'Deinze', CAST(N'1983-02-19T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (401, N'Oliver.Peters@google.com', N'Oliver', N'Peters', N'Mariakerke', CAST(N'1963-08-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (402, N'Selma.Smet@hotmail.com', N'Selma', N'Smet', N'Drongen', CAST(N'1971-12-27T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (403, N'Roman.Wachters@hotmail.com', N'Roman', N'Wachters', N'Maldegem', CAST(N'1981-06-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (404, N'Karen.Tuinman@orange.BE', N'Karen', N'Tuinman', N'Melle', CAST(N'2001-07-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (405, N'Veerle.Adams@orange.BE', N'Veerle', N'Adams', N'Wetteren', CAST(N'2000-05-09T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (406, N'Olive.Cruise@gmail.com', N'Olive', N'Cruise', N'Wondelgem', CAST(N'1972-03-12T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (407, N'Tine.VanDyck@orange.BE', N'Tine', N'Van Dyck', N'Zomergem', CAST(N'1992-02-14T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (408, N'Tine.Delores@google.com', N'Tine', N'Delores', N'Gent', CAST(N'1968-01-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (409, N'Cyren.Delfino@telenet.com', N'Cyren', N'Delfino', N'Wetteren', CAST(N'1964-05-20T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (410, N'Cyren.Kramer@orange.BE', N'Cyren', N'Kramer', N'Wetteren', CAST(N'1988-08-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (411, N'Selma.Decroo@telenet.com', N'Selma', N'Decroo', N'Adegem', CAST(N'1996-08-19T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (412, N'Sven.Pike@hotmail.com', N'Sven', N'Pike', N'Wondelgem', CAST(N'1995-12-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (413, N'Karen.Vangent@google.com', N'Karen', N'Vangent', N'Mariakerke', CAST(N'1969-03-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (414, N'Tine.Decroo@hotmail.com', N'Tine', N'Decroo', N'Zele', CAST(N'1970-10-07T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (415, N'Nancy.Parkinson@google.com', N'Nancy', N'Parkinson', N'Ledeberg', CAST(N'2001-03-18T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (416, N'Inge.Kuit@orange.BE', N'Inge', N'Kuit', N'Mariakerke', CAST(N'1979-01-10T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (417, N'Karl.VanAcker@gmail.com', N'Karl', N'Van Acker', N'Ledeberg', CAST(N'1968-11-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (418, N'Jeff.Tuinman@gmail.com', N'Jeff', N'Tuinman', N'Melle', CAST(N'1984-01-04T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (419, N'Sven.Parkinson@gmail.com', N'Sven', N'Parkinson', N'Maldegem', CAST(N'1986-11-01T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (420, N'Nancy.Verstappen@orange.BE', N'Nancy', N'Verstappen', N'Adegem', CAST(N'1994-04-20T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (421, N'Mark.Tyson@gmail.com', N'Mark', N'Tyson', N'Zulte', CAST(N'1995-12-12T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (422, N'Ellen.Ingvartson@telenet.com', N'Ellen', N'Ingvartson', N'Zomergem', CAST(N'1980-11-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (423, N'Orson.Wachters@gmail.com', N'Orson', N'Wachters', N'Wondelgem', CAST(N'1987-12-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (424, N'Selma.Decroo@gmail.com', N'Selma', N'Decroo', N'Zomergem', CAST(N'2007-07-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (425, N'Jack.Buyle@telenet.com', N'Jack', N'Buyle', N'Wetteren', CAST(N'2002-07-17T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (426, N'Valerie.Jackson@gmail.com', N'Valerie', N'Jackson', N'Zulte', CAST(N'1988-12-24T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (427, N'Bill.Cruise@hotmail.com', N'Bill', N'Cruise', N'Deinze', CAST(N'1999-09-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (428, N'Marge.Goeminne@telenet.com', N'Marge', N'Goeminne', N'Zele', CAST(N'2006-07-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (429, N'Sven.Pike@telenet.com', N'Sven', N'Pike', N'Waarschoot', CAST(N'1989-03-17T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (430, N'Katrien.Decroo@orange.BE', N'Katrien', N'Decroo', N'Petegem', CAST(N'2000-08-22T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (431, N'Cyren.Crawler@orange.BE', N'Cyren', N'Crawler', N'Maldegem', CAST(N'1995-07-16T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (432, N'Goedele.Loomans@hotmail.com', N'Goedele', N'Loomans', N'Mariakerke', CAST(N'1991-09-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (433, N'Selma.Olson@orange.BE', N'Selma', N'Olson', N'Petegem', CAST(N'1970-04-06T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (434, N'Tom.Tyson@orange.BE', N'Tom', N'Tyson', N'Mariakerke', CAST(N'2007-11-11T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (435, N'Suzan.Merckx@google.com', N'Suzan', N'Merckx', N'Ursel', CAST(N'2001-04-06T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (436, N'Suzan.Wild@hotmail.com', N'Suzan', N'Wild', N'Gentbrugge', CAST(N'1980-04-08T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (437, N'Piet.Vandermolen@google.com', N'Piet', N'Van der molen', N'Gent', CAST(N'1966-05-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (438, N'Valerie.Pike@telenet.com', N'Valerie', N'Pike', N'Deinze', CAST(N'1975-01-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (439, N'Bree.Loomans@hotmail.com', N'Bree', N'Loomans', N'Gent', CAST(N'1973-11-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (440, N'Goedele.Decroo@hotmail.com', N'Goedele', N'Decroo', N'Wetteren', CAST(N'1993-08-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (441, N'Jeff.Tuinman@google.com', N'Jeff', N'Tuinman', N'Zele', CAST(N'1976-01-20T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (442, N'Tine.Parkinson@orange.BE', N'Tine', N'Parkinson', N'Ursel', CAST(N'1968-02-25T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (443, N'Bart.Verschooten@gmail.com', N'Bart', N'Verschooten', N'Wetteren', CAST(N'1987-01-10T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (444, N'John.Smet@orange.BE', N'John', N'Smet', N'Gent', CAST(N'1966-08-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (445, N'Mike.Delpuerte@hotmail.com', N'Mike', N'Delpuerte', N'Wetteren', CAST(N'1979-01-22T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (446, N'Cindy.Thorn@gmail.com', N'Cindy', N'Thorn', N'Ursel', CAST(N'1998-05-11T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (447, N'Orson.VanDyck@telenet.com', N'Orson', N'Van Dyck', N'Ledeberg', CAST(N'1963-09-02T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (448, N'Inga.Vranckx@gmail.com', N'Inga', N'Vranckx', N'Waregem', CAST(N'1986-08-13T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (449, N'Bree.Wachters@orange.BE', N'Bree', N'Wachters', N'Wetteren', CAST(N'1974-01-20T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (450, N'Heinz.Tuinman@hotmail.com', N'Heinz', N'Tuinman', N'Waregem', CAST(N'1986-12-10T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (451, N'Karl.Loomans@gmail.com', N'Karl', N'Loomans', N'Zele', CAST(N'1968-04-23T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (452, N'Roman.Willems@gmail.com', N'Roman', N'Willems', N'Zomergem', CAST(N'1963-08-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (453, N'Karen.Pike@gmail.com', N'Karen', N'Pike', N'Zele', CAST(N'2006-08-26T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (454, N'Jack.Jansens@telenet.com', N'Jack', N'Jansens', N'Adegem', CAST(N'1960-04-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (455, N'Tine.Vangent@orange.BE', N'Tine', N'Vangent', N'Deinze', CAST(N'1982-05-07T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (456, N'Tine.VanDyck@telenet.com', N'Tine', N'Van Dyck', N'Eeklo', CAST(N'1967-02-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (457, N'Jesse.Parkinson@gmail.com', N'Jesse', N'Parkinson', N'Ledeberg', CAST(N'1967-11-02T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (458, N'John.Peters@gmail.com', N'John', N'Peters', N'Petegem', CAST(N'1995-01-04T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (459, N'Orson.Merckx@gmail.com', N'Orson', N'Merckx', N'Wondelgem', CAST(N'2007-10-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (460, N'Carl.Desmet@hotmail.com', N'Carl', N'Desmet', N'Wondelgem', CAST(N'1973-01-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (461, N'John.Tuinman@hotmail.com', N'John', N'Tuinman', N'Gent', CAST(N'1968-07-11T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (462, N'Sven.Olson@orange.BE', N'Sven', N'Olson', N'Melle', CAST(N'1962-10-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (463, N'Maria.Vandermolen@telenet.com', N'Maria', N'Van der molen', N'Ursel', CAST(N'1964-07-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (464, N'John.Tuinman@telenet.com', N'John', N'Tuinman', N'Deinze', CAST(N'1977-02-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (465, N'Suzan.Buyle@orange.BE', N'Suzan', N'Buyle', N'Petegem', CAST(N'1965-03-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (466, N'Heinz.Wild@orange.BE', N'Heinz', N'Wild', N'Gentbrugge', CAST(N'1999-11-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (467, N'Debora.Kuit@orange.BE', N'Debora', N'Kuit', N'Waarschoot', CAST(N'1974-12-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (468, N'Tine.Peters@telenet.com', N'Tine', N'Peters', N'Melle', CAST(N'1985-05-20T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (469, N'Katrien.Wachters@hotmail.com', N'Katrien', N'Wachters', N'Petegem', CAST(N'1964-07-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (470, N'Cindy.Kramer@orange.BE', N'Cindy', N'Kramer', N'Gent', CAST(N'1991-08-16T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (471, N'Pete.Jackson@gmail.com', N'Pete', N'Jackson', N'Maldegem', CAST(N'1979-03-20T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (472, N'Brian.Delpuerte@google.com', N'Brian', N'Delpuerte', N'Zulte', CAST(N'1977-10-12T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (473, N'Pete.Vranckx@orange.BE', N'Pete', N'Vranckx', N'Waregem', CAST(N'1979-11-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (474, N'Piet.Ingvartson@google.com', N'Piet', N'Ingvartson', N'Eeklo', CAST(N'1960-09-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (475, N'Inga.Cruise@hotmail.com', N'Inga', N'Cruise', N'Ursel', CAST(N'1992-12-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (476, N'Pol.Smet@telenet.com', N'Pol', N'Smet', N'Waregem', CAST(N'1970-08-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (477, N'George.Tuinman@hotmail.com', N'George', N'Tuinman', N'Melle', CAST(N'1986-06-08T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (478, N'Bart.Stone@orange.BE', N'Bart', N'Stone', N'Wondelgem', CAST(N'1969-09-27T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (479, N'Debora.Merckx@google.com', N'Debora', N'Merckx', N'Melle', CAST(N'1970-08-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (480, N'Oliver.Vranckx@gmail.com', N'Oliver', N'Vranckx', N'Adegem', CAST(N'1967-10-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (481, N'Piet.Wild@orange.BE', N'Piet', N'Wild', N'Ursel', CAST(N'1984-07-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (482, N'Inga.Wachters@telenet.com', N'Inga', N'Wachters', N'Wondelgem', CAST(N'1988-02-03T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (483, N'Roman.Johanson@gmail.com', N'Roman', N'Johanson', N'Zele', CAST(N'1989-10-16T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (484, N'Inga.Rogiers@gmail.com', N'Inga', N'Rogiers', N'Zele', CAST(N'1999-06-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (485, N'Inge.Olson@hotmail.com', N'Inge', N'Olson', N'Eeklo', CAST(N'1999-01-02T00:00:00.000' AS DateTime), N'fun', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (486, N'Bill.Loomans@google.com', N'Bill', N'Loomans', N'Ursel', CAST(N'1975-01-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (487, N'Pete.Desmet@google.com', N'Pete', N'Desmet', N'Drongen', CAST(N'1976-07-14T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (488, N'Oliver.Goeminne@hotmail.com', N'Oliver', N'Goeminne', N'Maldegem', CAST(N'1983-03-19T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (489, N'Olive.Kramer@gmail.com', N'Olive', N'Kramer', N'Waregem', CAST(N'1978-07-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (490, N'Brian.Vandeneinde@telenet.com', N'Brian', N'Vandeneinde', N'Eeklo', CAST(N'1988-03-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (491, N'Mike.Pike@orange.BE', N'Mike', N'Pike', N'Drongen', CAST(N'1994-10-17T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (492, N'Carl.Verstappen@gmail.com', N'Carl', N'Verstappen', N'Melle', CAST(N'1973-08-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (493, N'Tine.Rogiers@gmail.com', N'Tine', N'Rogiers', N'Waarschoot', CAST(N'1969-12-25T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (494, N'Ellen.Johanson@gmail.com', N'Ellen', N'Johanson', N'Eeklo', CAST(N'1990-11-16T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (495, N'Nancy.Crawler@gmail.com', N'Nancy', N'Crawler', N'Melle', CAST(N'1977-07-15T00:00:00.000' AS DateTime), N'running', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (496, N'Oliver.VanAcker@google.com', N'Oliver', N'Van Acker', N'Zele', CAST(N'1981-02-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (497, N'Tine.Simpson@orange.BE', N'Tine', N'Simpson', N'Waregem', CAST(N'1986-04-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (498, N'Brian.Vandermolen@orange.BE', N'Brian', N'Van der molen', N'Melle', CAST(N'1981-07-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (499, N'Pete.DeVught@orange.BE', N'Pete', N'De Vught', N'Adegem', CAST(N'1991-10-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (500, N'Selma.VanDorpe@google.com', N'Selma', N'Van Dorpe', N'Zulte', CAST(N'1971-10-11T00:00:00.000' AS DateTime), N'rowing', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (501, N'Alice.Willems@orange.BE', N'Alice', N'Willems', N'Eeklo', CAST(N'1992-01-24T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (502, N'Veerle.Olson@hotmail.com', N'Veerle', N'Olson', N'Ledeberg', CAST(N'2005-10-10T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (503, N'Jeff.Delpuerte@google.com', N'Jeff', N'Delpuerte', N'Gentbrugge', CAST(N'1987-02-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (504, N'Pol.Vandermolen@hotmail.com', N'Pol', N'Van der molen', N'Drongen', CAST(N'1963-07-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (505, N'Tom.Tyson@gmail.com', N'Tom', N'Tyson', N'Ursel', CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (506, N'Karen.Cruise@orange.BE', N'Karen', N'Cruise', N'Deinze', CAST(N'1996-07-02T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (507, N'Mark.Delfino@hotmail.com', N'Mark', N'Delfino', N'Waregem', CAST(N'1999-05-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (508, N'Marge.VanDyck@hotmail.com', N'Marge', N'Van Dyck', N'Drongen', CAST(N'1977-12-11T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (509, N'Katrien.Peters@google.com', N'Katrien', N'Peters', N'Waregem', CAST(N'1977-02-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (510, N'Alice.Kramer@orange.BE', N'Alice', N'Kramer', N'Zomergem', CAST(N'1962-08-11T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (511, N'Tine.Smet@gmail.com', N'Tine', N'Smet', N'Waarschoot', CAST(N'2002-08-19T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (512, N'Bill.Kramer@gmail.com', N'Bill', N'Kramer', N'Maldegem', CAST(N'1969-10-17T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (513, N'Cindy.Bollen@hotmail.com', N'Cindy', N'Bollen', N'Maldegem', CAST(N'1967-09-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (514, N'Marge.Olson@hotmail.com', N'Marge', N'Olson', N'Adegem', CAST(N'1978-04-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (515, N'Sven.Merckx@google.com', N'Sven', N'Merckx', N'Maldegem', CAST(N'1970-12-18T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (516, N'Roman.Delores@telenet.com', N'Roman', N'Delores', N'Zulte', CAST(N'1981-10-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (517, N'Goedele.Olson@gmail.com', N'Goedele', N'Olson', N'Deinze', CAST(N'1980-11-21T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (518, N'Alice.Delpuerte@google.com', N'Alice', N'Delpuerte', N'Gent', CAST(N'2001-05-19T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (519, N'Cyren.Kramer@hotmail.com', N'Cyren', N'Kramer', N'Mariakerke', CAST(N'1994-03-02T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (520, N'Inga.DeVught@hotmail.com', N'Inga', N'De Vught', N'Melle', CAST(N'1967-09-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (521, N'Ellen.Peeters@google.com', N'Ellen', N'Peeters', N'Wetteren', CAST(N'1987-02-22T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (522, N'Cindy.Coens@gmail.com', N'Cindy', N'Coens', N'Ursel', CAST(N'1981-07-16T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (523, N'Tine.Thorn@telenet.com', N'Tine', N'Thorn', N'Waarschoot', CAST(N'1969-07-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (524, N'Franz.Merckx@telenet.com', N'Franz', N'Merckx', N'Ursel', CAST(N'1994-12-03T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (525, N'Tom.DeVught@gmail.com', N'Tom', N'De Vught', N'Adegem', CAST(N'1995-06-04T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (526, N'Tom.Thorn@orange.BE', N'Tom', N'Thorn', N'Drongen', CAST(N'1967-10-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (527, N'Marge.Olson@gmail.com', N'Marge', N'Olson', N'Ledeberg', CAST(N'1962-12-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (528, N'Pol.Vandeneinde@telenet.com', N'Pol', N'Vandeneinde', N'Wetteren', CAST(N'1974-09-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (529, N'Jeff.Loomans@gmail.com', N'Jeff', N'Loomans', N'Maldegem', CAST(N'2000-09-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (530, N'Frans.Cruise@hotmail.com', N'Frans', N'Cruise', N'Drongen', CAST(N'1983-10-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (531, N'Tine.Delfino@hotmail.com', N'Tine', N'Delfino', N'Adegem', CAST(N'1960-09-21T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (532, N'Piet.Coens@hotmail.com', N'Piet', N'Coens', N'Wetteren', CAST(N'1992-09-01T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (533, N'Ilana.Vanderplas@google.com', N'Ilana', N'Van der plas', N'Mariakerke', CAST(N'1982-03-03T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (534, N'Veerle.Stone@orange.BE', N'Veerle', N'Stone', N'Mariakerke', CAST(N'1987-02-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (535, N'Oliver.Kuit@google.com', N'Oliver', N'Kuit', N'Petegem', CAST(N'2001-12-24T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (536, N'Tom.Merckx@google.com', N'Tom', N'Merckx', N'Maldegem', CAST(N'1977-04-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (537, N'Sven.Tuinman@orange.BE', N'Sven', N'Tuinman', N'Melle', CAST(N'1979-07-22T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (538, N'Nancy.Jackson@hotmail.com', N'Nancy', N'Jackson', N'Zomergem', CAST(N'1964-12-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (539, N'Mike.Jackson@telenet.com', N'Mike', N'Jackson', N'Petegem', CAST(N'1964-12-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (540, N'Karen.Verstappen@hotmail.com', N'Karen', N'Verstappen', N'Melle', CAST(N'1961-12-26T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (541, N'Veerle.Wachters@google.com', N'Veerle', N'Wachters', N'Ledeberg', CAST(N'2005-01-09T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (542, N'Alice.Decroo@hotmail.com', N'Alice', N'Decroo', N'Zulte', CAST(N'2003-09-26T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (543, N'Carl.Willems@hotmail.com', N'Carl', N'Willems', N'Drongen', CAST(N'1979-04-27T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (544, N'Ilana.Crawler@telenet.com', N'Ilana', N'Crawler', N'Waarschoot', CAST(N'1970-01-16T00:00:00.000' AS DateTime), N'cycling', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (545, N'Piet.Thorn@telenet.com', N'Piet', N'Thorn', N'Adegem', CAST(N'1971-10-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (546, N'Sven.Cruise@orange.BE', N'Sven', N'Cruise', N'Petegem', CAST(N'1986-11-13T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (547, N'Bree.Rogiers@telenet.com', N'Bree', N'Rogiers', N'Waarschoot', CAST(N'1963-04-15T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (548, N'Alice.Desmet@gmail.com', N'Alice', N'Desmet', N'Gentbrugge', CAST(N'1992-01-18T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (549, N'Olive.Bollen@orange.BE', N'Olive', N'Bollen', N'Zomergem', CAST(N'1998-04-01T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (550, N'Karen.Ingvartson@hotmail.com', N'Karen', N'Ingvartson', N'Eeklo', CAST(N'1991-08-21T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (551, N'Inge.Ingvartson@google.com', N'Inge', N'Ingvartson', N'Melle', CAST(N'1993-05-14T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (552, N'Nancy.Parkinson@hotmail.com', N'Nancy', N'Parkinson', N'Eeklo', CAST(N'1990-08-03T00:00:00.000' AS DateTime), N'cycling', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (553, N'Pete.Verstappen@telenet.com', N'Pete', N'Verstappen', N'Zele', CAST(N'1965-12-15T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (554, N'Cyren.Delores@hotmail.com', N'Cyren', N'Delores', N'Adegem', CAST(N'2000-08-11T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (555, N'Brian.Crawler@orange.BE', N'Brian', N'Crawler', N'Ledeberg', CAST(N'1987-09-10T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (556, N'Goedele.Verstappen@google.com', N'Goedele', N'Verstappen', N'Waregem', CAST(N'1968-12-05T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (557, N'Sven.Peeters@gmail.com', N'Sven', N'Peeters', N'Gent', CAST(N'1976-05-15T00:00:00.000' AS DateTime), N'rowing', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (558, N'Veerle.Kuit@google.com', N'Veerle', N'Kuit', N'Gentbrugge', CAST(N'1970-05-13T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (559, N'Orson.Thorn@orange.BE', N'Orson', N'Thorn', N'Wondelgem', CAST(N'1983-04-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (560, N'Bart.Simpson@gmail.com', N'Bart', N'Simpson', N'Drongen', CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'running', N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (561, N'Maria.Ingvartson@gmail.com', N'Maria', N'Ingvartson', N'Zele', CAST(N'1974-06-08T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (562, N'Tine.Desmet@gmail.com', N'Tine', N'Desmet', N'Melle', CAST(N'1965-09-15T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (563, N'Ilana.Wachters@telenet.com', N'Ilana', N'Wachters', N'Mariakerke', CAST(N'1965-10-06T00:00:00.000' AS DateTime), N'rowing', N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (564, N'Carl.Delfino@google.com', N'Carl', N'Delfino', N'Melle', CAST(N'1997-08-08T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (565, N'Carl.Decroo@google.com', N'Carl', N'Decroo', N'Deinze', CAST(N'1972-06-27T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (566, N'Tom.Delores@hotmail.com', N'Tom', N'Delores', N'Maldegem', CAST(N'1968-07-18T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (567, N'Katrien.Simpson@google.com', N'Katrien', N'Simpson', N'Wetteren', CAST(N'1964-02-04T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (568, N'Piet.Parkinson@telenet.com', N'Piet', N'Parkinson', N'Gent', CAST(N'2000-10-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (569, N'Piet.Verstappen@telenet.com', N'Piet', N'Verstappen', N'Wetteren', CAST(N'1988-09-11T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (570, N'Katrien.Parkinson@gmail.com', N'Katrien', N'Parkinson', N'Melle', CAST(N'1963-07-21T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (571, N'Ilana.Jackson@hotmail.com', N'Ilana', N'Jackson', N'Zomergem', CAST(N'1965-04-06T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (572, N'Cyren.Simpson@telenet.com', N'Cyren', N'Simpson', N'Petegem', CAST(N'2004-08-07T00:00:00.000' AS DateTime), NULL, N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (573, N'Mark.Stone@gmail.com', N'Mark', N'Stone', N'Ursel', CAST(N'2004-06-07T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (574, N'Alice.Peeters@google.com', N'Alice', N'Peeters', N'Zele', CAST(N'1973-05-23T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (575, N'Heinz.Cruise@google.com', N'Heinz', N'Cruise', N'Ursel', CAST(N'1965-03-13T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (576, N'Cindy.VanAcker@orange.BE', N'Cindy', N'Van Acker', N'Melle', CAST(N'1982-04-14T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (577, N'Goedele.Tuinman@hotmail.com', N'Goedele', N'Tuinman', N'Zulte', CAST(N'1991-08-04T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (578, N'Pete.Stone@gmail.com', N'Pete', N'Stone', N'Wetteren', CAST(N'2004-07-17T00:00:00.000' AS DateTime), NULL, N'SILVER')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (579, N'Katrien.Jackson@gmail.com', N'Katrien', N'Jackson', N'Zulte', CAST(N'2004-04-10T00:00:00.000' AS DateTime), NULL, N'BRONZE')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (580, N'Nancy.Kuit@telenet.com', N'Nancy', N'Kuit', N'Ledeberg', CAST(N'1993-05-07T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (581, N'Orson.Tuinman@gmail.com', N'Orson', N'Tuinman', N'Waregem', CAST(N'2000-04-25T00:00:00.000' AS DateTime), N'fun', N'GOLD')
GO
INSERT [dbo].[Klant] ([KlantNummer], [EmailAdres], [VoorNaam], [AchterNaam], [Adres], [GeboorteDatum], [Interesses], [KlantType]) VALUES (582, N'Goedele.Buyle@orange.BE', N'Goedele', N'Buyle', N'Ursel', CAST(N'1982-09-17T00:00:00.000' AS DateTime), N'cycling', N'SILVER')
GO
SET IDENTITY_INSERT [dbo].[Klant] OFF
GO
USE [master]
GO
ALTER DATABASE [FitnessCentrumApp] SET  READ_WRITE 
GO
