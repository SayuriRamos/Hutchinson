USE [Hutchinsong]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuariosJwtRefreshTokens]') AND type in (N'U'))
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] DROP CONSTRAINT IF EXISTS [DF_UsuariosJwtRefreshTokens_ExpirityAt]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuariosJwtRefreshTokens]') AND type in (N'U'))
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] DROP CONSTRAINT IF EXISTS [DF_UsuariosJwtRefreshTokens_CreatedAt]
GO
/****** Object:  Table [dbo].[UsuariosJwtRefreshTokens]    Script Date: 01/11/2021 10:39:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[UsuariosJwtRefreshTokens]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/11/2021 10:39:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[User]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 01/11/2021 10:39:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Permission]
GO
USE [master]
GO
/****** Object:  Database [Hutchinsong]    Script Date: 01/11/2021 10:39:58 p. m. ******/
DROP DATABASE IF EXISTS [Hutchinsong]
GO
/****** Object:  Database [Hutchinsong]    Script Date: 01/11/2021 10:39:58 p. m. ******/
CREATE DATABASE [Hutchinsong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hutchinsong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hutchinsong.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hutchinsong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hutchinsong_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hutchinsong] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hutchinsong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hutchinsong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hutchinsong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hutchinsong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hutchinsong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hutchinsong] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hutchinsong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hutchinsong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hutchinsong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hutchinsong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hutchinsong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hutchinsong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hutchinsong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hutchinsong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hutchinsong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hutchinsong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hutchinsong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hutchinsong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hutchinsong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hutchinsong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hutchinsong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hutchinsong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hutchinsong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hutchinsong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hutchinsong] SET  MULTI_USER 
GO
ALTER DATABASE [Hutchinsong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hutchinsong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hutchinsong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hutchinsong] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hutchinsong] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hutchinsong]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 01/11/2021 10:39:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [int] NULL,
	[Description] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/11/2021 10:39:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[NoEmpleado] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Foto] [image] NULL,
	[Correo] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[Planta] [varchar](50) NULL,
	[Perfil] [varchar](50) NULL,
	[Permissions] [int] NULL,
	[Usuario] [varchar](50),
	[Contrasena] [varchar](50),
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosJwtRefreshTokens]    Script Date: 01/11/2021 10:39:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosJwtRefreshTokens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoEmp] [varchar](50) NULL,
	[RefreshTokenSessionId] [varchar](50) NULL,
	[Ip] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[Revoked] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpirityAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([NoEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Foto], [Correo], [Departamento], [Planta], [Perfil], [Permissions]) VALUES (N'1', N'Armando', N'Cardenas', N'Florido', NULL, N'armando.cardenas@cetys.mx', N'Sistemas', N'Ensenada', N'Administardor', 0)
SET IDENTITY_INSERT [dbo].[UsuariosJwtRefreshTokens] ON 

INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (1, N'1', N'0c4fb927-f580-4fc9-b7d2-83e4610ec9fe', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:15:05.117' AS DateTime), CAST(N'2021-11-01T21:15:05.117' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (2, N'1', N'ae1c2911-6b55-464f-b730-76262a12b763', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:26:33.963' AS DateTime), CAST(N'2021-11-01T21:26:33.963' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (3, N'1', N'b6dfd209-61a8-48cb-87c2-b7ac52787d68', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:30:57.490' AS DateTime), CAST(N'2021-11-01T21:30:57.490' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (4, N'1', N'6a0fa7f2-1e43-4612-a9e9-be2b0e1ec391', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T22:13:05.770' AS DateTime), CAST(N'2021-11-01T22:13:05.770' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (5, N'1', N'92861394-20eb-442b-8d8f-309fb4de680c', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T22:35:55.247' AS DateTime), CAST(N'2021-11-01T22:35:55.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuariosJwtRefreshTokens] OFF
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] ADD  CONSTRAINT [DF_UsuariosJwtRefreshTokens_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] ADD  CONSTRAINT [DF_UsuariosJwtRefreshTokens_ExpirityAt]  DEFAULT (getdate()) FOR [ExpirityAt]
GO
USE [master]
GO
ALTER DATABASE [Hutchinsong] SET  READ_WRITE 
GO
