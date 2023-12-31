USE [master]
GO
/****** Object:  Database [PoliGestion]    Script Date: 13/11/2023 01:51:31 ******/
CREATE DATABASE [PoliGestion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PoliGestion', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PoliGestion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PoliGestion_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PoliGestion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PoliGestion] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PoliGestion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PoliGestion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PoliGestion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PoliGestion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PoliGestion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PoliGestion] SET ARITHABORT OFF 
GO
ALTER DATABASE [PoliGestion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PoliGestion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PoliGestion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PoliGestion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PoliGestion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PoliGestion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PoliGestion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PoliGestion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PoliGestion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PoliGestion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PoliGestion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PoliGestion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PoliGestion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PoliGestion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PoliGestion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PoliGestion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PoliGestion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PoliGestion] SET RECOVERY FULL 
GO
ALTER DATABASE [PoliGestion] SET  MULTI_USER 
GO
ALTER DATABASE [PoliGestion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PoliGestion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PoliGestion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PoliGestion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PoliGestion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PoliGestion] SET QUERY_STORE = OFF
GO
USE [PoliGestion]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 13/11/2023 01:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[idDia] [int] IDENTITY(1,1) NOT NULL,
	[dia] [varchar](50) NOT NULL,
	[FKPolicia] [int] NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[idDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policia]    Script Date: 13/11/2023 01:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policia](
	[IdPolicia] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[NumeroPlaca] [int] NOT NULL,
	[FKRoles] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CantidadRutas] [int] NULL,
 CONSTRAINT [PK_Policia] PRIMARY KEY CLUSTERED 
(
	[IdPolicia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/11/2023 01:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 13/11/2023 01:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[IdRuta] [int] IDENTITY(1,1) NOT NULL,
	[longitudInicial] [float] NOT NULL,
	[latitudInicial] [float] NOT NULL,
	[direccionInicial] [varchar](max) NOT NULL,
	[longitudFinal] [float] NOT NULL,
	[latitudFinal] [float] NOT NULL,
	[direccionFinal] [varchar](max) NOT NULL,
	[horaInicial] [time](7) NOT NULL,
	[horaFinal] [time](7) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[limiteValidez] [datetime] NULL,
	[FKPolicia] [int] NOT NULL,
	[FKDia] [int] NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dias] ON 

INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (1, N'lunes', 2)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (2, N'martes', NULL)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (3, N'miercoles', NULL)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (4, N'jueves', NULL)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (5, N'viernes', NULL)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (6, N'sabado', NULL)
INSERT [dbo].[Dias] ([idDia], [dia], [FKPolicia]) VALUES (7, N'domingo', NULL)
SET IDENTITY_INSERT [dbo].[Dias] OFF
GO
SET IDENTITY_INSERT [dbo].[Policia] ON 

INSERT [dbo].[Policia] ([IdPolicia], [DNI], [Nombre], [NumeroPlaca], [FKRoles], [FechaNacimiento], [Password], [CantidadRutas]) VALUES (2, 45643563, N'pepe', 32453, 3, CAST(N'2222-03-31' AS Date), N'5345345rerrrr', NULL)
INSERT [dbo].[Policia] ([IdPolicia], [DNI], [Nombre], [NumeroPlaca], [FKRoles], [FechaNacimiento], [Password], [CantidadRutas]) VALUES (3, 25354523, N'paman', 43532, 4, CAST(N'5644-04-04' AS Date), N'ewrtewrter', NULL)
INSERT [dbo].[Policia] ([IdPolicia], [DNI], [Nombre], [NumeroPlaca], [FKRoles], [FechaNacimiento], [Password], [CantidadRutas]) VALUES (6, 34534523, N'trivago', 52345, 2, CAST(N'2222-11-11' AS Date), N'sdfgsdfgsdfgsdfg', NULL)
INSERT [dbo].[Policia] ([IdPolicia], [DNI], [Nombre], [NumeroPlaca], [FKRoles], [FechaNacimiento], [Password], [CantidadRutas]) VALUES (7, 36875876, N'Eduardo', 34523, 3, CAST(N'2023-11-06' AS Date), N'34252345234523dwgwgssggggg', NULL)
SET IDENTITY_INSERT [dbo].[Policia] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRol], [Rol]) VALUES (1, N'Vial')
INSERT [dbo].[Roles] ([IdRol], [Rol]) VALUES (2, N'Secretario')
INSERT [dbo].[Roles] ([IdRol], [Rol]) VALUES (3, N'Administrador')
INSERT [dbo].[Roles] ([IdRol], [Rol]) VALUES (4, N'Patrullero')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rutas] ON 

INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (2, -5850133614821376, -3459907273621504, N'wfsdafsadf', -5840726562701312, -3459313762828288, N'asdfasdfsd', CAST(N'23:34:00' AS Time), CAST(N'21:34:00' AS Time), CAST(N'4233-12-31T00:00:00.000' AS DateTime), CAST(N'2134-04-23T00:00:00.000' AS DateTime), 7, 3)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (3, -5847009562984448, -3464145064165376, N'42352354', -5841344501121024, -3459963645067264, N'45234532', CAST(N'06:55:00' AS Time), CAST(N'03:11:00' AS Time), CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-09T00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (4, -5846288545349632, -3467788001738752, N'rtrtsdfgbdbfa', -58440400225959936, -3.46518498312192E+15, N'sdfbsdafbdsfb', CAST(N'23:39:00' AS Time), CAST(N'04:37:00' AS Time), CAST(N'3333-03-12T00:00:00.000' AS DateTime), CAST(N'4444-03-12T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (5, -58468721240309760, -34621112897765376, N'asdczxadcazd', -584014284980224, -345835262967808, N'ZXCZXCZXC', CAST(N'03:13:00' AS Time), CAST(N'03:16:00' AS Time), CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-12-09T00:00:00.000' AS DateTime), 7, 6)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (7, -58481769350955008, -3461885106061312, N'fcasgfasdhbgdbh', -5.84567060692992E+15, -3457872264429568, N'fbadbadfbadfb', CAST(N'05:39:00' AS Time), CAST(N'02:37:00' AS Time), CAST(N'2023-11-28T00:00:00.000' AS DateTime), CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 7)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (8, -58481769350955008, -3461885106061312, N'fcasgfasdhbgdbh', -5.84567060692992E+15, -3457872264429568, N'fbadbadfbadfb', CAST(N'05:39:00' AS Time), CAST(N'02:37:00' AS Time), CAST(N'2023-11-28T00:00:00.000' AS DateTime), CAST(N'2023-12-02T00:00:00.000' AS DateTime), 3, 7)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (10, -5850048252346368, -3466258188075008, N'asdfsdfsadf', -5845517061849088, -3459207462387712, N'asdfasdfsd', CAST(N'19:40:00' AS Time), CAST(N'20:41:00' AS Time), CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (11, -5850048252346368, -3466258188075008, N'asdfsdfsadf', -5845517061849088, -3459207462387712, N'asdfasdfsd', CAST(N'19:40:00' AS Time), CAST(N'20:41:00' AS Time), CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), 7, 4)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (12, -5850048252346368, -3466258188075008, N'asdfsdfsadf', -5845517061849088, -3459207462387712, N'asdfasdfsd', CAST(N'19:40:00' AS Time), CAST(N'20:41:00' AS Time), CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), 3, 4)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (14, -5849181205823488, -3.46055715586048E+15, N'cacona', -5845335599480832, -34567979857346560, N'sadfasdf', CAST(N'04:43:00' AS Time), CAST(N'07:47:00' AS Time), CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(N'2023-12-07T00:00:00.000' AS DateTime), 6, 5)
INSERT [dbo].[Rutas] ([IdRuta], [longitudInicial], [latitudInicial], [direccionInicial], [longitudFinal], [latitudFinal], [direccionFinal], [horaInicial], [horaFinal], [fechaCreacion], [limiteValidez], [FKPolicia], [FKDia]) VALUES (15, -5.85192783740928E+15, -3459313762828288, N'weqrqwe', -58408471439081472, -3457471221858304, N'qwerwqer', CAST(N'23:55:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2023-11-22T00:00:00.000' AS DateTime), CAST(N'2023-12-08T00:00:00.000' AS DateTime), 6, 3)
SET IDENTITY_INSERT [dbo].[Rutas] OFF
GO
ALTER TABLE [dbo].[Policia]  WITH CHECK ADD  CONSTRAINT [FK_Policia_Roles] FOREIGN KEY([FKRoles])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Policia] CHECK CONSTRAINT [FK_Policia_Roles]
GO
USE [master]
GO
ALTER DATABASE [PoliGestion] SET  READ_WRITE 
GO
