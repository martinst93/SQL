USE [master]
GO

/****** Object:  Database [Martin]    Script Date: 6/10/2021 4:33:38 PM ******/
CREATE DATABASE [Martin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Martin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Martin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Martin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Martin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Martin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Martin] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Martin] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Martin] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Martin] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Martin] SET ARITHABORT OFF 
GO

ALTER DATABASE [Martin] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Martin] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Martin] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Martin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Martin] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Martin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Martin] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Martin] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Martin] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Martin] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Martin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Martin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Martin] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Martin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Martin] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Martin] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Martin] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Martin] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Martin] SET  MULTI_USER 
GO

ALTER DATABASE [Martin] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Martin] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Martin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Martin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Martin] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Martin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Martin] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Martin] SET  READ_WRITE 
GO

