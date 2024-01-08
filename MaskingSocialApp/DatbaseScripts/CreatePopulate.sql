USE [master]
GO
/****** Object:  Database [ComputedSample4]    Script Date: 1/8/2024 2:32:09 AM ******/
CREATE DATABASE [ComputedSample4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComputedSample4', FILENAME = N'C:\Users\paynek\ComputedSample4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComputedSample4_log', FILENAME = N'C:\Users\paynek\ComputedSample4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ComputedSample4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComputedSample4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComputedSample4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComputedSample4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComputedSample4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComputedSample4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComputedSample4] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComputedSample4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComputedSample4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComputedSample4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComputedSample4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComputedSample4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComputedSample4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComputedSample4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComputedSample4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComputedSample4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComputedSample4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComputedSample4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComputedSample4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComputedSample4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComputedSample4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComputedSample4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComputedSample4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComputedSample4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComputedSample4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ComputedSample4] SET  MULTI_USER 
GO
ALTER DATABASE [ComputedSample4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComputedSample4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComputedSample4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComputedSample4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComputedSample4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComputedSample4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ComputedSample4] SET QUERY_STORE = OFF
GO
USE [ComputedSample4]
GO
/****** Object:  Table [dbo].[Taxpayer]    Script Date: 1/8/2024 2:32:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxpayer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[SocialSecurityNumber] [nchar](9) MASKED WITH (FUNCTION = 'partial(0, "XXXXX", 4)') NULL,
	[PhoneNumber] [nchar](12) MASKED WITH (FUNCTION = 'partial(0, "XXXXX", 4)') NULL,
	[BirthDay] [date] MASKED WITH (FUNCTION = 'default()') NULL,
	[BirthYear]  AS (datepart(year,[BirthDay])),
 CONSTRAINT [PK_Taxpayer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Taxpayer] ON 

INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (1, N'Stefanie', N'Buckley', N'681123358', N'555-234-1111', CAST(N'1984-08-07' AS Date))
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (2, N'Sandy', N'Mc Gee', N'129872540', N'555-222-2222', CAST(N'2000-12-09' AS Date))
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (3, N'Lee', N'Warren', N'455425068', N'555-333-3333', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (4, N'Regina', N'Forbes', N'486584435', N'555-444-4444', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (5, N'Daniel', N'Kim', N'670071721', N'555-555-5555', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (6, N'Dennis', N'Nunez', N'758233136', N'555-666-6666', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (7, N'Myra', N'Zuniga', N'766850017', N'555-777-7777', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (8, N'Teddy', N'Ingram', N'244962791', N'555-888-8888', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (9, N'Annie', N'Larson', N'952712007', N'555-999-9999', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (10, N'Herman', N'Anderson', N'193605818', N'555-000-1111', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (11, N'Jenifer', N'Livingston', N'933641567', N'555-122-1222', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (12, N'Stefanie', N'Perez', N'343851791', N'555-222-1233', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (13, N'Chastity', N'Garcia', N'355358642', N'555-333-4567', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (14, N'Evelyn', N'Stokes', N'875854198', N'555-132-1579', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (15, N'Jeannie', N'Daniel', N'687479231', N'555-956-9165', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (16, N'Rickey', N'Santos', N'957589100', N'555-159-4627', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (17, N'Bobbie', N'Hurst', N'903164731', N'555-464-3333', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (18, N'Lesley', N'Lawson', N'784334646', N'555-890-1234', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (19, N'Shawna', N'Browning', N'889286763', N'555-125-5836', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (20, N'Theresa', N'Ross', N'398565322', N'555-770-1537', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (21, N'Tasha', N'Hughes', N'476855493', N'555-044-1555', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (22, N'Karla', N'Hale', N'751341505', N'555-055-7768', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (23, N'Otis', N'Holt', N'469015528', N'555-577-1124', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (24, N'Alisa', N'Browning', N'217183657', N'555-170-1234', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (25, N'Peggy', N'Donaldson', N'552413114', N'555-469-5467', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (26, N'Lisa', N'Bentley', N'644075665', N'555-102-6867', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (27, N'Vicky', N'Wiley', N'759119894', N'555-234-1377', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (28, N'Nicolas', N'Spence', N'900140755', N'555-247-4454', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (29, N'Miranda', N'Barnes', N'363728001', N'555-568-9986', NULL)
INSERT [dbo].[Taxpayer] ([Id], [FirstName], [LastName], [SocialSecurityNumber], [PhoneNumber], [BirthDay]) VALUES (30, N'Kara', N'Barry', N'231446003', N'555-301-9999', NULL)
SET IDENTITY_INSERT [dbo].[Taxpayer] OFF
GO
USE [master]
GO
ALTER DATABASE [ComputedSample4] SET  READ_WRITE 
GO
