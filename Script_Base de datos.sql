USE [master]
GO
/****** Object:  Database [Bd_empresa]    Script Date: 4/26/2023 3:43:59 PM ******/
CREATE DATABASE [Bd_empresa] ON  PRIMARY 
( NAME = N'Bd_empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Bd_empresa.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bd_empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Bd_empresa_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bd_empresa] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bd_empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bd_empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bd_empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bd_empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bd_empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bd_empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bd_empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bd_empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bd_empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bd_empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bd_empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bd_empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bd_empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bd_empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bd_empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bd_empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bd_empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bd_empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bd_empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bd_empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bd_empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bd_empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bd_empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bd_empresa] SET RECOVERY FULL 
GO
ALTER DATABASE [Bd_empresa] SET  MULTI_USER 
GO
ALTER DATABASE [Bd_empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bd_empresa] SET DB_CHAINING OFF 
GO
USE [Bd_empresa]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] NOT NULL,
	[id_empresa] [int] NULL,
	[nombre_cliente] [varchar](255) NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[id_empresa] [int] NOT NULL,
	[nombre_empresa] [varchar](255) NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[id_equipo] [int] NOT NULL,
	[id_empresa] [int] NULL,
	[nombre_equipo] [varchar](255) NULL,
	[tipo_equipo] [varchar](255) NULL,
	[fecha_ingreso] [date] NULL,
	[descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[id_facturacion] [int] NOT NULL,
	[id_empresa] [int] NULL,
	[id_servicio] [int] NULL,
	[fecha_facturacion] [date] NULL,
	[monto_facturacion] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inspecciones]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspecciones](
	[id_inspeccion] [int] NOT NULL,
	[id_equipo] [int] NULL,
	[fecha_inspeccion] [date] NULL,
	[resultado_inspeccion] [varchar](255) NULL,
	[descripcion_inspeccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inspeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mantenimientos]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimientos](
	[id_mantenimiento] [int] NOT NULL,
	[id_equipo] [int] NULL,
	[fecha_mantenimiento] [date] NULL,
	[descripcion_mantenimiento] [varchar](255) NULL,
	[costo_mantenimiento] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_mantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[id_pago] [int] NOT NULL,
	[id_empresa] [int] NULL,
	[fecha_pago] [date] NULL,
	[monto_pago] [decimal](10, 2) NULL,
	[descripcion_pago] [varchar](255) NULL,
	[id_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 4/26/2023 3:44:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[id_servicio] [int] NOT NULL,
	[id_empresa] [int] NULL,
	[fecha_servicio] [date] NULL,
	[hora_servicio] [time](7) NULL,
	[tipo_servicio] [varchar](255) NULL,
	[descripcion_servicio] [varchar](255) NULL,
	[id_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[Inspecciones]  WITH CHECK ADD FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Equipos] ([id_equipo])
GO
ALTER TABLE [dbo].[Inspecciones]  WITH CHECK ADD FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Equipos] ([id_equipo])
GO
ALTER TABLE [dbo].[Mantenimientos]  WITH CHECK ADD FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Equipos] ([id_equipo])
GO
ALTER TABLE [dbo].[Mantenimientos]  WITH CHECK ADD FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Equipos] ([id_equipo])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresa] ([id_empresa])
GO
USE [master]
GO
ALTER DATABASE [Bd_empresa] SET  READ_WRITE 
GO
