USE [master]
GO
/****** Object:  Database [QuanLyKhachSan]    Script Date: 03/11/2016 2:25:14 CH ******/
CREATE DATABASE [QuanLyKhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyKhachSan', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyKhachSan.mdf' , SIZE = 5120KB , MAXSIZE = 5120KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKhachSan_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyKhachSan_log.ldf' , SIZE = 5120KB , MAXSIZE = 5120KB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[tblChiTietPhieu]    Script Date: 03/11/2016 2:25:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieu](
	[IDPhieuThue] [int] NULL,
	[IDPhong] [int] NULL,
	[IDDichVu] [int] NULL,
	[IDDoDung] [int] NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [int] NULL,
	[IDChiTietPhieu] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblChiTietPhieu_1] PRIMARY KEY CLUSTERED 
(
	[IDChiTietPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDichVu]    Script Date: 03/11/2016 2:25:14 CH ******/
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
/****** Object:  Table [dbo].[tblDoDung]    Script Date: 03/11/2016 2:25:14 CH ******/
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
/****** Object:  Table [dbo].[tblKhach]    Script Date: 03/11/2016 2:25:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhach](
	[IDKhach] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tblPhieuThue]    Script Date: 03/11/2016 2:25:14 CH ******/
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
/****** Object:  Table [dbo].[tblPhong]    Script Date: 03/11/2016 2:25:14 CH ******/
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
INSERT [dbo].[tblPhong] ([IDPhong], [SucChua], [GiaPhong], [TrangThai]) VALUES (1, 2, 100000, N'đã thuê')
INSERT [dbo].[tblPhong] ([IDPhong], [SucChua], [GiaPhong], [TrangThai]) VALUES (2, 352, 32525, NULL)
ALTER TABLE [dbo].[tblChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieu_tblDichVu] FOREIGN KEY([IDDichVu])
REFERENCES [dbo].[tblDichVu] ([IDDichVu])
GO
ALTER TABLE [dbo].[tblChiTietPhieu] CHECK CONSTRAINT [FK_tblChiTietPhieu_tblDichVu]
GO
ALTER TABLE [dbo].[tblChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieu_tblDoDung] FOREIGN KEY([IDDoDung])
REFERENCES [dbo].[tblDoDung] ([IDDoDung])
GO
ALTER TABLE [dbo].[tblChiTietPhieu] CHECK CONSTRAINT [FK_tblChiTietPhieu_tblDoDung]
GO
ALTER TABLE [dbo].[tblChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieu_tblPhieuThue] FOREIGN KEY([IDPhieuThue])
REFERENCES [dbo].[tblPhieuThue] ([IDPhieuThue])
GO
ALTER TABLE [dbo].[tblChiTietPhieu] CHECK CONSTRAINT [FK_tblChiTietPhieu_tblPhieuThue]
GO
ALTER TABLE [dbo].[tblChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieu_tblPhong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[tblPhong] ([IDPhong])
GO
ALTER TABLE [dbo].[tblChiTietPhieu] CHECK CONSTRAINT [FK_tblChiTietPhieu_tblPhong]
GO
ALTER TABLE [dbo].[tblPhieuThue]  WITH CHECK ADD  CONSTRAINT [FK_tblPhieuThue_tblKhach1] FOREIGN KEY([IDKhach])
REFERENCES [dbo].[tblKhach] ([IDKhach])
GO
ALTER TABLE [dbo].[tblPhieuThue] CHECK CONSTRAINT [FK_tblPhieuThue_tblKhach1]
GO
USE [master]
GO
ALTER DATABASE [QuanLyKhachSan] SET  READ_WRITE 
GO
