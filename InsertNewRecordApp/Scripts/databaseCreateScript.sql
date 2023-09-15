
/****** 
IMPORTANT

Before executing this script, change the path below to match your Windows profile.

******/

USE [master]
GO
/****** Object:  Database [InsertExamples]    Script Date: 9/15/2023 4:40:09 AM ******/
CREATE DATABASE [InsertExamples]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InsertExamples', FILENAME = N'C:\Users\paynek\InsertExamples.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InsertExamples_log', FILENAME = N'C:\Users\paynek\InsertExamples_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InsertExamples] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InsertExamples].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InsertExamples] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InsertExamples] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsertExamples] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsertExamples] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsertExamples] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsertExamples] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsertExamples] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsertExamples] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsertExamples] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsertExamples] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsertExamples] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsertExamples] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsertExamples] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsertExamples] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsertExamples] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InsertExamples] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsertExamples] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsertExamples] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsertExamples] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsertExamples] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsertExamples] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsertExamples] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsertExamples] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InsertExamples] SET  MULTI_USER 
GO
ALTER DATABASE [InsertExamples] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsertExamples] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InsertExamples] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InsertExamples] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InsertExamples] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InsertExamples] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InsertExamples] SET QUERY_STORE = OFF
GO
USE [InsertExamples]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/15/2023 4:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [InsertExamples] SET  READ_WRITE 
GO
