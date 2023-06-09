USE [master]
GO
/****** Object:  Database [Bd_empresa]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Equipos]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Facturacion]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Inspecciones]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Mantenimientos]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Pagos]    Script Date: 4/26/2023 4:01:43 PM ******/
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
/****** Object:  Table [dbo].[Servicios]    Script Date: 4/26/2023 4:01:43 PM ******/
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
INSERT [dbo].[Clientes] ([id_cliente], [id_empresa], [nombre_cliente], [direccion], [telefono], [email]) VALUES (1, 1, N'John Smith', N'456 Maple St', N'555-1234', N'johnsmith@example.com')
INSERT [dbo].[Clientes] ([id_cliente], [id_empresa], [nombre_cliente], [direccion], [telefono], [email]) VALUES (2, 1, N'Jane Doe', N'789 Oak St', N'555-5678', N'janedoe@example.com')
INSERT [dbo].[Clientes] ([id_cliente], [id_empresa], [nombre_cliente], [direccion], [telefono], [email]) VALUES (3, 2, N'Bob Johnson', N'123 Main St', N'555-9012', N'bobjohnson@example.com')
INSERT [dbo].[Empresa] ([id_empresa], [nombre_empresa], [direccion], [telefono]) VALUES (1, N'Fire Services Inc.', N'123 Main St', N'555-1234')
INSERT [dbo].[Empresa] ([id_empresa], [nombre_empresa], [direccion], [telefono]) VALUES (2, N'First Response Fire Protection', N'456 Elm St', N'555-5678')
INSERT [dbo].[Empresa] ([id_empresa], [nombre_empresa], [direccion], [telefono]) VALUES (3, N'Firefighters On Call', N'789 Oak St', N'555-9012')
INSERT [dbo].[Equipos] ([id_equipo], [id_empresa], [nombre_equipo], [tipo_equipo], [fecha_ingreso], [descripcion]) VALUES (1, 1, N'Sistema de rociadores', N'Sistema de rociadores automáticos', CAST(N'2023-04-20' AS Date), N'Sistema de rociadores para edificio comercial')
INSERT [dbo].[Equipos] ([id_equipo], [id_empresa], [nombre_equipo], [tipo_equipo], [fecha_ingreso], [descripcion]) VALUES (2, 1, N'Extintores', N'Extintores portátiles', CAST(N'2023-04-15' AS Date), N'Extintores para oficinas')
INSERT [dbo].[Equipos] ([id_equipo], [id_empresa], [nombre_equipo], [tipo_equipo], [fecha_ingreso], [descripcion]) VALUES (3, 2, N'Bomba contra incendios', N'Bomba contra incendios', CAST(N'2023-04-10' AS Date), N'Bomba contra incendios para edificio residencial')
INSERT [dbo].[Facturacion] ([id_facturacion], [id_empresa], [id_servicio], [fecha_facturacion], [monto_facturacion]) VALUES (1, 1, 1, CAST(N'2023-04-13' AS Date), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[Facturacion] ([id_facturacion], [id_empresa], [id_servicio], [fecha_facturacion], [monto_facturacion]) VALUES (2, 2, 2, CAST(N'2023-04-12' AS Date), CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Facturacion] ([id_facturacion], [id_empresa], [id_servicio], [fecha_facturacion], [monto_facturacion]) VALUES (3, 3, 3, CAST(N'2023-04-11' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Inspecciones] ([id_inspeccion], [id_equipo], [fecha_inspeccion], [resultado_inspeccion], [descripcion_inspeccion]) VALUES (1, 1, CAST(N'2023-04-16' AS Date), N'Satisfactoria', N'Inspección anual del sistema de rociadores')
INSERT [dbo].[Inspecciones] ([id_inspeccion], [id_equipo], [fecha_inspeccion], [resultado_inspeccion], [descripcion_inspeccion]) VALUES (2, 2, CAST(N'2023-04-15' AS Date), N'Satisfactoria', N'Inspección mensual de extintores')
INSERT [dbo].[Inspecciones] ([id_inspeccion], [id_equipo], [fecha_inspeccion], [resultado_inspeccion], [descripcion_inspeccion]) VALUES (3, 3, CAST(N'2023-04-14' AS Date), N'No satisfactoria', N'Inspección trimestral de la bomba contra incendios')
INSERT [dbo].[Mantenimientos] ([id_mantenimiento], [id_equipo], [fecha_mantenimiento], [descripcion_mantenimiento], [costo_mantenimiento]) VALUES (1, 1, CAST(N'2023-04-19' AS Date), N'Mantenimiento preventivo del sistema de rociadores', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Mantenimientos] ([id_mantenimiento], [id_equipo], [fecha_mantenimiento], [descripcion_mantenimiento], [costo_mantenimiento]) VALUES (2, 2, CAST(N'2023-04-18' AS Date), N'Recarga de extintores', CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[Mantenimientos] ([id_mantenimiento], [id_equipo], [fecha_mantenimiento], [descripcion_mantenimiento], [costo_mantenimiento]) VALUES (3, 3, CAST(N'2023-04-17' AS Date), N'Mantenimiento preventivo de la bomba contra incendios', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pagos] ([id_pago], [id_empresa], [fecha_pago], [monto_pago], [descripcion_pago], [id_cliente]) VALUES (1, 1, CAST(N'2023-04-10' AS Date), CAST(500.00 AS Decimal(10, 2)), N'Pago por inspección anual de sistema de rociadores', 1)
INSERT [dbo].[Pagos] ([id_pago], [id_empresa], [fecha_pago], [monto_pago], [descripcion_pago], [id_cliente]) VALUES (2, 2, CAST(N'2023-04-09' AS Date), CAST(1500.00 AS Decimal(10, 2)), N'Pago por instalación de extintores', 2)
INSERT [dbo].[Pagos] ([id_pago], [id_empresa], [fecha_pago], [monto_pago], [descripcion_pago], [id_cliente]) VALUES (3, 3, CAST(N'2023-04-08' AS Date), CAST(2000.00 AS Decimal(10, 2)), N'Pago por mantenimiento de bomba contra incendios', 3)
INSERT [dbo].[Servicios] ([id_servicio], [id_empresa], [fecha_servicio], [hora_servicio], [tipo_servicio], [descripcion_servicio], [id_cliente]) VALUES (1, 1, CAST(N'2023-04-25' AS Date), CAST(N'10:00:00' AS Time), N'Inspección anual', N'Inspección anual de sistema de rociadores', 1)
INSERT [dbo].[Servicios] ([id_servicio], [id_empresa], [fecha_servicio], [hora_servicio], [tipo_servicio], [descripcion_servicio], [id_cliente]) VALUES (2, 2, CAST(N'2023-04-24' AS Date), CAST(N'12:00:00' AS Time), N'Instalación de extintores', N'Instalación de 10 extintores en edificio de oficinas', 2)
INSERT [dbo].[Servicios] ([id_servicio], [id_empresa], [fecha_servicio], [hora_servicio], [tipo_servicio], [descripcion_servicio], [id_cliente]) VALUES (3, 3, CAST(N'2023-04-23' AS Date), CAST(N'14:00:00' AS Time), N'Mantenimiento de bomba contra incendios', N'Mantenimiento preventivo de bomba contra incendios en edificio residencial', 3)
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
