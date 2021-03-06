USE [master]
GO
/****** Object:  Database [QuanLyKhachSan]    Script Date: 11/14/2016 2:21:27 PM ******/
CREATE DATABASE [QuanLyKhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyKhachSan', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyKhachSan.mdf' , SIZE = 5120KB , MAXSIZE = 5120KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKhachSan_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyKhachSan_log.ldf' , SIZE = 5120KB , MAXSIZE = 5120KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyKhachSan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyKhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyKhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyKhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyKhachSan] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyKhachSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyKhachSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyKhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyKhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyKhachSan]
GO
/****** Object:  Table [dbo].[tblChiTietPhieu]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieu](
	[IDPhieuThue] [int] NOT NULL,
	[IDPhong] [int] NOT NULL,
	[IDDichVu] [int] NOT NULL,
	[IDDoDung] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [int] NULL,
	[IDChiTietPhieu] [int] NOT NULL,
 CONSTRAINT [PK_tblChiTietPhieu] PRIMARY KEY CLUSTERED 
(
	[IDPhieuThue] ASC,
	[IDPhong] ASC,
	[IDDichVu] ASC,
	[IDDoDung] ASC,
	[IDChiTietPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDichVu]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDichVu](
	[IDDichVu] [int] NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[GiaThanh] [int] NULL,
 CONSTRAINT [PK_tblDichVu] PRIMARY KEY CLUSTERED 
(
	[IDDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDoDung]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoDung](
	[IDDoDung] [int] NOT NULL,
	[TenDoDung] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_tblDoDung] PRIMARY KEY CLUSTERED 
(
	[IDDoDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKhach]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhach](
	[IDKhach] [int] IDENTITY(1,1) NOT NULL,
	[TenKhach] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](20) NULL,
	[SoNguoi] [int] NULL,
 CONSTRAINT [PK_tblKhach] PRIMARY KEY CLUSTERED 
(
	[IDKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhieuThue]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuThue](
	[IDPhieuThue] [int] NOT NULL,
	[IDKhach] [int] NOT NULL,
	[ThoiGianThue] [date] NULL,
	[ThoiGianTra] [date] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_tblPhieuThue_1] PRIMARY KEY CLUSTERED 
(
	[IDPhieuThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhong]    Script Date: 11/14/2016 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhong](
	[IDPhong] [int] NOT NULL,
	[SucChua] [int] NULL,
	[GiaPhong] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPhong] PRIMARY KEY CLUSTERED 
(
	[IDPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (1, 1, 0, 0, 0, 0, 2)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (1, 1, 1, 1, 2, 25000, 4)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (1, 1, 2, 2, 3, 160000, 5)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (1, 2, 0, 0, 0, 0, 3)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (2, 2, 0, 0, 0, 0, 1)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (3, 1, 0, 0, 0, 0, 6)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (3, 1, 2, 1, 5, 60000, 9)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (3, 2, 0, 0, 0, 0, 7)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (3, 3, 0, 0, 0, 0, 8)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (4, 1, 0, 0, 0, 0, 10)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (4, 1, 2, 1, 2, 30000, 13)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (4, 2, 0, 0, 0, 0, 11)
INSERT [dbo].[tblChiTietPhieu] ([IDPhieuThue], [IDPhong], [IDDichVu], [IDDoDung], [SoLuong], [ThanhTien], [IDChiTietPhieu]) VALUES (4, 3, 0, 0, 0, 0, 12)
INSERT [dbo].[tblDichVu] ([IDDichVu], [TenDichVu], [GiaThanh]) VALUES (0, N'khong co', 0)
INSERT [dbo].[tblDichVu] ([IDDichVu], [TenDichVu], [GiaThanh]) VALUES (1, N'Goi-Dien', 5000)
INSERT [dbo].[tblDichVu] ([IDDichVu], [TenDichVu], [GiaThanh]) VALUES (2, N'Xong-hoi', 10000)
INSERT [dbo].[tblDoDung] ([IDDoDung], [TenDoDung], [SoLuong], [DonGia]) VALUES (0, N'khong co', 0, 0)
INSERT [dbo].[tblDoDung] ([IDDoDung], [TenDoDung], [SoLuong], [DonGia]) VALUES (1, N'May-dieu-hoa', 10, 10000)
INSERT [dbo].[tblDoDung] ([IDDoDung], [TenDoDung], [SoLuong], [DonGia]) VALUES (2, N'May-giat', 5, 50000)
SET IDENTITY_INSERT [dbo].[tblKhach] ON 

INSERT [dbo].[tblKhach] ([IDKhach], [TenKhach], [DiaChi], [SDT], [SoNguoi]) VALUES (3, N'syviet', N'nghean', N'077                 ', 5)
INSERT [dbo].[tblKhach] ([IDKhach], [TenKhach], [DiaChi], [SDT], [SoNguoi]) VALUES (9, N'cong1234567', N'hn', N'099                 ', 5)
INSERT [dbo].[tblKhach] ([IDKhach], [TenKhach], [DiaChi], [SDT], [SoNguoi]) VALUES (15, N'tuananh', N'thanh hoa', N'0999                ', 5)
INSERT [dbo].[tblKhach] ([IDKhach], [TenKhach], [DiaChi], [SDT], [SoNguoi]) VALUES (16, N'tuananh123', N'thanh hoa', N'0999                ', 5)
SET IDENTITY_INSERT [dbo].[tblKhach] OFF
INSERT [dbo].[tblPhieuThue] ([IDPhieuThue], [IDKhach], [ThoiGianThue], [ThoiGianTra], [TongTien]) VALUES (1, 9, CAST(0x183C0B00 AS Date), CAST(0x183C0B00 AS Date), 0)
INSERT [dbo].[tblPhieuThue] ([IDPhieuThue], [IDKhach], [ThoiGianThue], [ThoiGianTra], [TongTien]) VALUES (2, 3, NULL, NULL, 0)
INSERT [dbo].[tblPhieuThue] ([IDPhieuThue], [IDKhach], [ThoiGianThue], [ThoiGianTra], [TongTien]) VALUES (3, 15, CAST(0x193C0B00 AS Date), CAST(0x193C0B00 AS Date), 0)
INSERT [dbo].[tblPhieuThue] ([IDPhieuThue], [IDKhach], [ThoiGianThue], [ThoiGianTra], [TongTien]) VALUES (4, 16, CAST(0x193C0B00 AS Date), CAST(0x193C0B00 AS Date), 0)
INSERT [dbo].[tblPhong] ([IDPhong], [SucChua], [GiaPhong], [TrangThai]) VALUES (1, 2, 100000, N'đã thuê')
INSERT [dbo].[tblPhong] ([IDPhong], [SucChua], [GiaPhong], [TrangThai]) VALUES (2, 352, 32525, NULL)
INSERT [dbo].[tblPhong] ([IDPhong], [SucChua], [GiaPhong], [TrangThai]) VALUES (3, 20, 500000, NULL)
ALTER TABLE [dbo].[tblChiTietPhieu]  WITH NOCHECK ADD  CONSTRAINT [FK_tblChiTietPhieu_tblPhieuThue] FOREIGN KEY([IDPhieuThue])
REFERENCES [dbo].[tblPhieuThue] ([IDPhieuThue])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tblChiTietPhieu] NOCHECK CONSTRAINT [FK_tblChiTietPhieu_tblPhieuThue]
GO
ALTER TABLE [dbo].[tblPhieuThue]  WITH NOCHECK ADD  CONSTRAINT [FK_tblPhieuThue_tblKhach] FOREIGN KEY([IDKhach])
REFERENCES [dbo].[tblKhach] ([IDKhach])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tblPhieuThue] NOCHECK CONSTRAINT [FK_tblPhieuThue_tblKhach]
GO
USE [master]
GO
ALTER DATABASE [QuanLyKhachSan] SET  READ_WRITE 
GO
