USE [master]
GO
/****** Object:  Database [Smartway.Maksim.Kulebyakin.Test.Task]    Script Date: 25.07.2022 17:26:29 ******/
CREATE DATABASE [Smartway.Maksim.Kulebyakin.Test.Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Smartway.Maksim.Kulebyakin.Test.Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Smartway.Maksim.Kulebyakin.Test.Task.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Smartway.Maksim.Kulebyakin.Test.Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Smartway.Maksim.Kulebyakin.Test.Task_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Smartway.Maksim.Kulebyakin.Test.Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET  MULTI_USER 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Smartway.Maksim.Kulebyakin.Test.Task', N'ON'
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET QUERY_STORE = OFF
GO
USE [Smartway.Maksim.Kulebyakin.Test.Task]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 25.07.2022 17:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[FileData] [varbinary](max) NOT NULL,
 CONSTRAINT [PK__Files__3214EC07C3C7F796] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddFile]    Script Date: 25.07.2022 17:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddFile] 
	@Name nvarchar(200),
	@Data varbinary(max)
AS
BEGIN
	insert into [Smartway.Maksim.Kulebyakin.Test.Task].dbo.Files ([Name], [FileData])
	values(@Name, @Data)
END
GO
USE [master]
GO
ALTER DATABASE [Smartway.Maksim.Kulebyakin.Test.Task] SET  READ_WRITE 
GO
