USE [master]
GO
/****** Object:  Database [QLK]    Script Date: 1/31/2023 9:14:46 PM ******/
CREATE DATABASE [QLK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\DATA\QLK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\DATA\QLK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLK] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLK] SET RECOVERY FULL 
GO
ALTER DATABASE [QLK] SET  MULTI_USER 
GO
ALTER DATABASE [QLK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLK', N'ON'
GO
ALTER DATABASE [QLK] SET QUERY_STORE = OFF
GO
USE [QLK]
GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MaDDH] [int] NOT NULL,
	[MaHangHoa] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [bigint] NULL,
 CONSTRAINT [PK_CTDDH] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MaPN] [int] NOT NULL,
	[MaHangHoa] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[Gia] [bigint] NOT NULL,
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] IDENTITY(1,1) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaiLy]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaiLy](
	[MaDL] [int] IDENTITY(1,1) NOT NULL,
	[MST] [int] NOT NULL,
	[TenDL] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](500) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[ChiecKhau] [float] NULL,
 CONSTRAINT [PK_DaiLy] PRIMARY KEY CLUSTERED 
(
	[MaDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NOT NULL,
	[MaNV] [int] NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[MaDL] [int] NULL,
	[TongTien] [bigint] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHangHoa] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Gia] [bigint] NOT NULL,
	[GiamGia] [int] NULL,
	[Anh] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](4000) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[MaLoai] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DVT] [nvarchar](50) NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[MST] [int] NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](500) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](40) NOT NULL,
	[Ten] [nvarchar](40) NOT NULL,
	[CMND] [nvarchar](15) NULL,
	[NgaySinh] [date] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [nvarchar](50) NULL,
	[MaCV] [int] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNV] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[MaNCC] [int] NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[MaNV] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 1/31/2023 9:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (77, 1, 10, 4480)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (78, 7, 10, 5940)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (79, 8, 10, 5300)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (79, 14, 10, 9350)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (81, 1, 10, 5040)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (81, 2, 15, 5400)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (82, 12, 50, 5940)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (82, 16, 50, 2970)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (83, 12, 30, 5940)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (84, 16, 10, 3300)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (86, 2, 10, 6000)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (86, 9, 10, 4500)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (87, 8, 10, 5300)
INSERT [dbo].[CTDDH] ([MaDDH], [MaHangHoa], [SoLuong], [GiaBan]) VALUES (87, 16, 50, 3300)
GO
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1015, 1, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1016, 12, 10, 6000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1017, 3, 100, 4300)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1017, 7, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1018, 1, 100, 4600)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1018, 8, 100, 4100)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1018, 12, 200, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1019, 1, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1019, 2, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1019, 13, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1020, 1, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1020, 2, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1021, 13, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1022, 1, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1022, 2, 20, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1025, 1, 40, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1025, 2, 20, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1026, 2, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1028, 3, 10, 2000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1028, 8, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1029, 1, 100, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1030, 1, 10, 2000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1030, 2, 10, 2000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1031, 7, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1031, 12, 20, 4500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1032, 1, 70, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1032, 2, 10, 4500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1033, 1, 10, 4400)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1033, 3, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1039, 1, 10, 4400)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1039, 3, 10, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1052, 1, 20, 4400)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1052, 2, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1052, 3, 50, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1053, 1, 20, 4400)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1053, 2, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1053, 3, 50, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1082, 16, 100, 3000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1083, 8, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1083, 9, 100, 3900)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1084, 7, 100, 3500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1084, 10, 20, 3500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1085, 13, 20, 8000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1085, 14, 10, 8500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1087, 1, 10, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1088, 16, 100, 2500)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1089, 11, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1089, 12, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1090, 1, 10, 3000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1090, 3, 50, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1091, 2, 20, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1092, 1, 10, 3000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1092, 3, 50, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1093, 1, 10, 3000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1093, 3, 50, 5000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1096, 1, 100, 4000)
INSERT [dbo].[CTPN] ([MaPN], [MaHangHoa], [SoLuong], [Gia]) VALUES (1096, 2, 100, 3900)
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (1, N'Admin')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (2, N'Bán Hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (4, N'Quản Lý')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (5, N'Kho')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (6, N'Lái Xe')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (7, N'Bảo Vệ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (10, N'SALE')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
GO
SET IDENTITY_INSERT [dbo].[DaiLy] ON 

INSERT [dbo].[DaiLy] ([MaDL], [MST], [TenDL], [DiaChi], [SDT], [ChiecKhau]) VALUES (1, 58001234, N'Đại Lý Bà Hằng', N'123 Nguyễn Xiễn', N'0123456789', 0)
INSERT [dbo].[DaiLy] ([MaDL], [MST], [TenDL], [DiaChi], [SDT], [ChiecKhau]) VALUES (4, 58004567, N'Khách Sạn Hoa Hồng', N'56 Nguyễn văn Tăng', N'0654789321', 10)
INSERT [dbo].[DaiLy] ([MaDL], [MST], [TenDL], [DiaChi], [SDT], [ChiecKhau]) VALUES (5, 58003344, N'Khách Sạn Nguyễn Kim', N'23 Nguyễn văn Tăng', N'0654123778', 2)
SET IDENTITY_INSERT [dbo].[DaiLy] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (77, CAST(N'2022-08-01' AS Date), 4, 3, 5, 56000)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (78, CAST(N'2022-08-01' AS Date), 4, 3, 4, 59400)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (79, CAST(N'2022-08-02' AS Date), 4, 3, 1, 146500)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (81, CAST(N'2022-08-02' AS Date), 6, 3, 5, 131400)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (82, CAST(N'2022-08-02' AS Date), 6, 3, 4, 445500)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (83, CAST(N'2022-08-02' AS Date), 4, 3, 5, 178200)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (84, CAST(N'2022-08-02' AS Date), 6, 3, 5, 29700)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (86, CAST(N'2022-08-02' AS Date), 4, 1, 5, 94500)
INSERT [dbo].[DonDatHang] ([MaDDH], [Ngay], [MaNV], [TinhTrang], [MaDL], [TongTien]) VALUES (87, CAST(N'2022-08-02' AS Date), 4, 1, 5, 196200)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (1, N'Pepsi', 5600, 0, N'resources/images/pepsi.png', N'a', 1, 1, 90, N'LON')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (2, N'Revive', 6000, 0, N'resources/images/revive.jpg', N'2', 1, 1, 115, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (3, N'Revive Chanh Muối', 6200, 0, N'resources/images/revive_chanhmuoi.jpg', N'3', 1, 1, 260, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (7, N'Coca Cola', 6600, 0, N'resources/images/coca.png', N'1', 1, 1, 90, N'LON')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (8, N'C2 Vị Đào', 5300, 0, N'resources/images/c2vidao.jpg', N'', 1, 8, 60, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (9, N'C2 Vị Vải', 4500, 0, N'resources/images/hong-tra-c2-vi-vai.jpg', N'', 1, 8, 90, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (10, N'Sprite 330 ml', 6300, 0, N'resources/images/sprite.jpg', N'', 1, 1, 20, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (11, N'Sprite vị chanh', 5500, 0, N'resources/images/sprite-vi-chanh-.jpg', N'', 1, 1, 100, N'LON')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (12, N'7UP', 6600, 0, N'resources/images/7up.jpg', N'', 1, 1, 20, N'LON')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (13, N'Strongbow Vị Dâu Lon 330ml', 8800, 0, N'resources/images/strongbow-vi-dau-lon-cao-330ml.jpg', N'', 1, 15, 20, N'LON')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (14, N'Strongbow Vị Dâu Chai 330ml', 9350, 0, N'resources/images/strongbow-dau-den-chai-330ml.jpg', N'', 1, 15, 0, N'KEN')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (15, N'Dasani 350ml', 3000, 0, N'resources/images/Dasani-350ml-e1560347308849.jpg', N'', 0, 9, 0, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (16, N'Aquafina', 3300, 0, N'resources/images/aquafina-15l.jpeg', N'', 1, 9, 80, N'CHAI')
INSERT [dbo].[HangHoa] ([MaHangHoa], [Ten], [Gia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaLoai], [SoLuong], [DVT]) VALUES (17, N'Corona', 6000, 0, N'resources/images/corona-beer.png', N'', 0, 15, 0, N'KEN')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (1, 12389654, N'Công ty TNHH Bông ty', N'1 Lý thường kiệt, Tp HCM', N'0234565697')
INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (2, 89233784, N'Công Ty TNHH BK', N'2 Trạng trình, Quận 2, Tp HCM', N'0687998955')
INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (7, 58013456, N'Cong Ty TNHH Mai Son Que', N'12 Go Cong, Tp HCM', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (12, 300588569, N'VIETNAM DAIRY PRODUCTS JOINT STOCK COMPANY', N'10 Tân Trào, Phường Tân Phú, Quận 7, Tp HCM', N'0123698547')
INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (13, 300792451, N'COCA-COLA BEVERAGES VIET NAM LIMITED ', N'Số 485, Đường Xa Lộ Hà Nội, Phường Linh Trung', N'0234567890')
INSERT [dbo].[NhaCungCap] ([MaNCC], [MST], [TenNCC], [DiaChi], [SDT]) VALUES (25, 123123123, N'NHA CUNG ABC', N'72 Hai Bà Trưng', N'0021345678')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (4, N'DO VAN THAO', N'DUY', N'123456789', CAST(N'2021-12-12' AS Date), 1, 1, N'2011565656', 5, N'23 thang thien', N'h@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (5, N'DANG MINH', N'CHIEN', N'235456878', CAST(N'2022-03-01' AS Date), 1, 1, N'0698989898', 2, N'123 Hoang Hoa Tham', N'chien@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (6, N'DIEU GIA', N'BAO', N'565323248', CAST(N'2022-03-03' AS Date), 1, 1, N'0898948879', 1, N'5 Trang Trinh', N'xxthanchet026xx@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (8, N'LE VAN', N'NAM', N'565623145', CAST(N'2022-03-19' AS Date), 1, 1, N'0565656565', 5, N'12 Cầu Giấy', N'lvn@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (9, N'TRAN MINH', N'HOA', N'565984666', CAST(N'2022-03-02' AS Date), 1, 1, N'0123456789', 4, N'123 Lê Văn Việt', N'tmh@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (10, N'LE VAN', N'A', N'23547968', CAST(N'2022-03-01' AS Date), 1, 1, N'0123456789', 4, N'12 Cầu Giấy', N'3@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (13, N'Nguyen Kien', N'Kien', N'123654789', CAST(N'1999-12-03' AS Date), 1, 1, N'01234556688', 7, N'123 Nguyen Xien', N'nkk@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (29, N'LE VAN', N'Bell', N'331556787', CAST(N'2022-03-25' AS Date), 1, 1, N'0123456789', 2, N'23 Nguyen Xien', N'5@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (30, N'LE VAN', N'LOAN', N'123546789', CAST(N'2022-03-01' AS Date), 1, 1, N'0123456789', 5, N'72 Hai Bà Trưng', N'aaaa@gmail.com')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SDT], [MaCV], [DiaChi], [Email]) VALUES (31, N'LE VAN', N'B', N'556665', CAST(N'2022-03-03' AS Date), 0, 1, N'0123456789', 4, N'72 Hai Bà Trưng', N'12335@gmail.com')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1015, CAST(N'2022-03-22' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1016, CAST(N'2022-03-23' AS Date), 4, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1017, CAST(N'2022-03-23' AS Date), 6, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1018, CAST(N'2022-03-23' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1019, CAST(N'2022-03-25' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1020, CAST(N'2022-03-25' AS Date), 8, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1021, CAST(N'2022-03-25' AS Date), 8, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1022, CAST(N'2022-03-25' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1025, CAST(N'2022-03-25' AS Date), 8, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1026, CAST(N'2022-03-27' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1028, CAST(N'2022-03-27' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1029, CAST(N'2022-03-27' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1030, CAST(N'2022-03-30' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1031, CAST(N'2022-03-30' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1032, CAST(N'2022-03-30' AS Date), 8, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1033, CAST(N'2022-03-31' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1039, CAST(N'2022-04-22' AS Date), 6, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1052, CAST(N'2022-07-05' AS Date), 6, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1053, CAST(N'2022-07-05' AS Date), 6, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1082, CAST(N'2022-07-27' AS Date), 8, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1083, CAST(N'2022-07-27' AS Date), 8, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1084, CAST(N'2022-07-27' AS Date), 8, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1085, CAST(N'2022-07-27' AS Date), 8, 1, 25)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1087, CAST(N'2022-08-01' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1088, CAST(N'2022-08-01' AS Date), 4, 1, 12)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1089, CAST(N'2022-08-01' AS Date), 4, 1, 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1090, CAST(N'2022-08-01' AS Date), 6, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1091, CAST(N'2022-08-01' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1092, CAST(N'2022-08-01' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1093, CAST(N'2022-08-01' AS Date), 4, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [MaNCC]) VALUES (1096, CAST(N'2022-08-02' AS Date), 6, 1, 12)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Active], [MaNV]) VALUES (N'admin', N'123', 1, 6)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Active], [MaNV]) VALUES (N'BH', N'123', 1, 5)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Active], [MaNV]) VALUES (N'KHO', N'123', 1, 4)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Active], [MaNV]) VALUES (N'NAM', N'123', 1, 8)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Active], [MaNV]) VALUES (N'QL', N'123', 1, 10)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (1, N'Nước có ga')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (8, N'Nước ngọt')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (9, N'Nước tinh khiết')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (15, N'Nước có cồn')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
/****** Object:  Index [IX_DaiLy]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[DaiLy] ADD  CONSTRAINT [IX_DaiLy] UNIQUE NONCLUSTERED 
(
	[MST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DaiLy_1]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[DaiLy] ADD  CONSTRAINT [IX_DaiLy_1] UNIQUE NONCLUSTERED 
(
	[TenDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangHoa]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [IX_HangHoa] UNIQUE NONCLUSTERED 
(
	[Ten] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NhaCungCap]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [IX_NhaCungCap] UNIQUE NONCLUSTERED 
(
	[MST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NhaCungCap_1]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [IX_NhaCungCap_1] UNIQUE NONCLUSTERED 
(
	[TenNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NhanVien]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [IX_NhanVien] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaiKhoan]    Script Date: 1/31/2023 9:14:47 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [IX_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DonDatHang]
GO
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_HangHoa] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_HangHoa]
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_HangHoa] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_HangHoa]
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_DaiLy] FOREIGN KEY([MaDL])
REFERENCES [dbo].[DaiLy] ([MaDL])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_DaiLy]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NhanVien]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_TheLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_TheLoai]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QLK] SET  READ_WRITE 
GO
