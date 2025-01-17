USE [master]
GO
/****** Object:  Database [SecurityDatabase_A]    Script Date: 08 Jan 2019 11:30:46 ******/
CREATE DATABASE [SecurityDatabase_A]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SecurityDatabase_A', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SecurityDatabase_A.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SecurityDatabase_A_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SecurityDatabase_A_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SecurityDatabase_A] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SecurityDatabase_A].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SecurityDatabase_A] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET ARITHABORT OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SecurityDatabase_A] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SecurityDatabase_A] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SecurityDatabase_A] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SecurityDatabase_A] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SecurityDatabase_A] SET  MULTI_USER 
GO
ALTER DATABASE [SecurityDatabase_A] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SecurityDatabase_A] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SecurityDatabase_A] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SecurityDatabase_A] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SecurityDatabase_A] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SecurityDatabase_A', N'ON'
GO
ALTER DATABASE [SecurityDatabase_A] SET QUERY_STORE = OFF
GO
USE [SecurityDatabase_A]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SecurityDatabase_A]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 08 Jan 2019 11:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 08 Jan 2019 11:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[MusicPath] [text] NULL,
	[Genre_fk] [int] NOT NULL,
	[User_fk] [uniqueidentifier] NOT NULL,
	[Signature] [text] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 08 Jan 2019 11:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission] [bit] NOT NULL,
	[Music_fk] [int] NOT NULL,
	[User_fk] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08 Jan 2019 11:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 08 Jan 2019 11:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08 Jan 2019 11:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Blocked] [bit] NOT NULL,
	[NoOfAttempts] [int] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[PublicKey] [text] NULL,
	[PrivateKey] [text] NULL,
	[RecoveryCode] [varchar](256) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Title]) VALUES (1, N'Hip/Hop')
INSERT [dbo].[Genres] ([Id], [Title]) VALUES (2, N'EDM')
INSERT [dbo].[Genres] ([Id], [Title]) VALUES (3, N'House Music')
INSERT [dbo].[Genres] ([Id], [Title]) VALUES (4, N'Classic')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([Id], [Name], [Description], [MusicPath], [Genre_fk], [User_fk], [Signature]) VALUES (6, N'iio', N'123', N'\App_Data\4349b477-1a16-4c0f-a86d-3a035e876283.wav', 1, N'51356c88-4b1a-40d1-8d74-20b815e8ac66', N'BZ64L/kXW9f+YbQftoEVVVT+TtwqAhK9umH7hjd00ZS2CaokFUK0NISZY/QbR68gxy+WyhuoTF755kwe+pPD6Zg2slzTGdpfcTXc9rqqZsk1MJiZulmE/pDlzcnXQFSqshxtkW/qaHSrhW7DRkMv39RqKzaqAqt0gA5JUYrKn70=')
SET IDENTITY_INSERT [dbo].[Musics] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Title]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([Id], [Title]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[UserRoles] ([RoleId], [UserId]) VALUES (1, N'fed29520-eb87-4401-bc8d-09b711356ac7')
INSERT [dbo].[UserRoles] ([RoleId], [UserId]) VALUES (1, N'51356c88-4b1a-40d1-8d74-20b815e8ac66')
INSERT [dbo].[UserRoles] ([RoleId], [UserId]) VALUES (1, N'a4b498e6-c11c-4941-a6bd-319c9de4624b')
INSERT [dbo].[UserRoles] ([RoleId], [UserId]) VALUES (1, N'b8eabc13-efa7-4422-8f81-831bac541b21')
INSERT [dbo].[UserRoles] ([RoleId], [UserId]) VALUES (2, N'522b93a6-ebb2-4550-8fcd-80a51d96a056')
INSERT [dbo].[Users] ([Email], [Password], [FirstName], [LastName], [Mobile], [Blocked], [NoOfAttempts], [Id], [PublicKey], [PrivateKey], [RecoveryCode]) VALUES (N'test@email.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'123', N'123', N'123', 0, 0, N'fed29520-eb87-4401-bc8d-09b711356ac7', N'<RSAKeyValue><Modulus>uEScwZsZ1Ai9l/hvbKyltRhBZfzHUIjiBS3phQkSMvAYy2HwWaBHgvPyJgXo4NSEZF7b3z8cHEfdHTUidxJZ7laLnrdWEe5lwJU9JqPlNFO2kanHfjWfq1kmwuhDp7DZUhmhu+kcTcthWCYSoNNBQBW8S9cr/Q3tXG7uT0AsXFE=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>', N'<RSAKeyValue><Modulus>uEScwZsZ1Ai9l/hvbKyltRhBZfzHUIjiBS3phQkSMvAYy2HwWaBHgvPyJgXo4NSEZF7b3z8cHEfdHTUidxJZ7laLnrdWEe5lwJU9JqPlNFO2kanHfjWfq1kmwuhDp7DZUhmhu+kcTcthWCYSoNNBQBW8S9cr/Q3tXG7uT0AsXFE=</Modulus><Exponent>AQAB</Exponent><P>2RW1s62dbCDm3od0CNmiTAHuEmUHaT2NRaZtwlREUxmX9RRNQ/SddSWrl0Tpw5PYRkbnDvXyZYplwZbuZUysiw==</P><Q>2UzmTHqGljHm8V8VVyKjLppF5EI9zxJBMLLM1pu1oDDTB3wSNiJxDDuOgZb3CSYP2PU4Ztg17uMOzHpdA15qEw==</Q><DP>xsArpZ/Uu0S8Wwyk3d1zzCcQMuMwj9f82cHwR7UjAPozt/yoaQkyiCi/GzXK2Hcp0d3kejwPe4vkcgOfrDsw1Q==</DP><DQ>ZmzL5OKgC62r6LvjyDWoazAGn6flkHRPTBALY2DzxHUfE1kVEHU9igGMk2LAQIyzTZWQp1FkYpyd/h3zN8JKBw==</DQ><InverseQ>zJZeplPk9EC3oQqcb8SWSXY/7xBSj74Nq0npKVNouTchAJvMVJBBZDGYYcFegoTh2LicKSkPt+scexgPVcHj9g==</InverseQ><D>rAr7pNPwUIT8p5hASGIFsUh9PwC9A1daV+WfAyQOBtse+z1tD/FS81RagN/Bp7EkDyZ1+UFOOKVsMCn9DNlodkZrN+rZiiuBIYPYM6tFH0Q6lsN40VzJJP3pUlxmT3ANrYD5RakuaAHqjCRgOvedhCZVU5pw5f1wC4pqMH0UaIU=</D></RSAKeyValue>', NULL)
INSERT [dbo].[Users] ([Email], [Password], [FirstName], [LastName], [Mobile], [Blocked], [NoOfAttempts], [Id], [PublicKey], [PrivateKey], [RecoveryCode]) VALUES (N'yalcin.formosa@hotmail.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'123', N'123', N'123', 0, 0, N'51356c88-4b1a-40d1-8d74-20b815e8ac66', N'<RSAKeyValue><Modulus>xeEgsudrd0GYCv7MEC+7zybBaujqjDMVI3Ai2B5VuCmrCT0cbEhxcDcRjdrsMke+o4NkS6TX9FA3Z+FBueSush1fPoHx3fm3DOE2/9t00nADN0LZ2KdWiPC12CQdcm0XNMLfE0uTfj8lk/praOnZ+bko0c2RC/q7M9Qgo63CGIU=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>', N'<RSAKeyValue><Modulus>xeEgsudrd0GYCv7MEC+7zybBaujqjDMVI3Ai2B5VuCmrCT0cbEhxcDcRjdrsMke+o4NkS6TX9FA3Z+FBueSush1fPoHx3fm3DOE2/9t00nADN0LZ2KdWiPC12CQdcm0XNMLfE0uTfj8lk/praOnZ+bko0c2RC/q7M9Qgo63CGIU=</Modulus><Exponent>AQAB</Exponent><P>/zdJhTyepT6W63vKaPNq+bq0kjO/Y4Tt6l5FnCSj6BYYbbCU6LrOPlOIJVTQCol+GjHAoUJwDjBO6K3e0NO/hw==</P><Q>xny/pH8djrlrgeOLRAKpnTgauL+No46Ih6LRl3xT1W95QoMvzeRgND/IC3lnWAZ9T0dVFXS5tmmjG0KcDldykw==</Q><DP>qguaTs3vHkavo8LdQEQ/mJjPy0HzWUmug6PAWaMIGpDuQdePv+kHlftuEQGLhBnMDYPsxwVPSATj7qA6f4U2bQ==</DP><DQ>wQt7aIWpPbLg+MdSH6dnR93VP3IuU7DA4QpeRrNI5gExMptc1ycS2j5eVaqR9G77WSvLeL66EMvVMyIpnVk3uQ==</DQ><InverseQ>UsYzz3Oa4Q5xsAoAob0JL8tM3nSMrkLht6OSm+PoOKk45VOQX3YytnvE9+4ZZPS3rwmSuQFXshS7QqVl6HZlTg==</InverseQ><D>PG0kHB3ZTmCkem8Wh7bb5kVSeUBJJ6kNwnWi3lZdHND0nuyfel2g7oCShrwctrn7+FjOTt825y97y+gYtxijU8xhxvd6CFQno5x+dkSehYD8ppMoPukgskwpDGYjzR9CHQc9ctC/zoKNA9BUhWRn7xYMdyaPQKoA++UEX+G+aP0=</D></RSAKeyValue>', N'')
INSERT [dbo].[Users] ([Email], [Password], [FirstName], [LastName], [Mobile], [Blocked], [NoOfAttempts], [Id], [PublicKey], [PrivateKey], [RecoveryCode]) VALUES (N'newaccount@email', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'123', N'123', N'123', 0, 0, N'a4b498e6-c11c-4941-a6bd-319c9de4624b', N'<RSAKeyValue><Modulus>sbw7HanU5lhp8z7shOql6GnwCHJM053W1L6ZR2pdz+9w62saW3FcszwpCEslS46ts+V1EJY2HXIh6t65svXrCLRi2nMasdTbO0+h+3AGXgG2SGpqYV4PE5jwLYQ8QTv6U9zuK/6V12AGY8/oRbKZkLr80PFtGRDNhUSsT0eAgsk=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>', N'<RSAKeyValue><Modulus>sbw7HanU5lhp8z7shOql6GnwCHJM053W1L6ZR2pdz+9w62saW3FcszwpCEslS46ts+V1EJY2HXIh6t65svXrCLRi2nMasdTbO0+h+3AGXgG2SGpqYV4PE5jwLYQ8QTv6U9zuK/6V12AGY8/oRbKZkLr80PFtGRDNhUSsT0eAgsk=</Modulus><Exponent>AQAB</Exponent><P>3zarqaD7+iUxWQSPoJJ1dsLDqe2j+x3cmQClLE3wMMvd0+WLRrCmNKKOSRcA3Xi3jVOjD+YxFTtfC+3dvi2OSw==</P><Q>y9d5qMF6iQlXKJi0zp6PRGiCL/3KOrxdoXAqiJ7LI5iHLqJqXRCPIJUFq1IGysnYpi/X5nu9OhNkcKINlAl2uw==</Q><DP>asBrwtmCCPUmr6sVwbapxN2K1EcZ6Kw0Z1w+ony3xa6KbZ/XRzyOkJe5ssz0lfb42fdJAf6WNNBLOZpONXj2Fw==</DP><DQ>YfaEOV4Cjak3ggMhocsB/1ZaesX1UpUESnmld1MZPVooXXkgtOkoX/g+aT9alEq9G+ESWWpOXoLDWn4HGIYT0Q==</DQ><InverseQ>mYMwthjs7LMeqwc5jo4h3NykB3I9rJFVO+2TXStsaIrjD5iZpcOEf0Ko24zwMY0W06BaEGTU2/TqVZ+FKsmTpA==</InverseQ><D>DMEkQOGyHIGVwNXwJS2tkDsh9Yk2SC1YgFXZLA3PA5/8K3i5IHzHGTmk/CpgV8a6YmGCABm3cm+BTZiEHPqWzh92S7U4Y1FeIkq0fel6Zfiw+xMheROWj06/txysaUCQOt7DXP0xqxs5ciMfQ3V8ftY599iXGY9fKErS9r1gc70=</D></RSAKeyValue>', NULL)
INSERT [dbo].[Users] ([Email], [Password], [FirstName], [LastName], [Mobile], [Blocked], [NoOfAttempts], [Id], [PublicKey], [PrivateKey], [RecoveryCode]) VALUES (N'test1@email', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'123', N'123', N'123', 0, 0, N'522b93a6-ebb2-4550-8fcd-80a51d96a056', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Email], [Password], [FirstName], [LastName], [Mobile], [Blocked], [NoOfAttempts], [Id], [PublicKey], [PrivateKey], [RecoveryCode]) VALUES (N'testuser@email.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'123', N'123', N'123', 0, 0, N'b8eabc13-efa7-4422-8f81-831bac541b21', N'<RSAKeyValue><Modulus>34OL/cA47V73rsCa1gI894FJeE75MnXpyJ+RjA8P/Vh/Uvk+S0U5Utyg4yI9QsjDzcN9SgS09zxmRi6+hVCdcuoiVVH5UUJ+b2EAdJlIHgLmu6scCdZq6fkiI10akKs4ivi979Lxf7V7KslvLm5cVbbsMLcG9HHMHvBEIxW1Iw0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>', N'<RSAKeyValue><Modulus>34OL/cA47V73rsCa1gI894FJeE75MnXpyJ+RjA8P/Vh/Uvk+S0U5Utyg4yI9QsjDzcN9SgS09zxmRi6+hVCdcuoiVVH5UUJ+b2EAdJlIHgLmu6scCdZq6fkiI10akKs4ivi979Lxf7V7KslvLm5cVbbsMLcG9HHMHvBEIxW1Iw0=</Modulus><Exponent>AQAB</Exponent><P>9sB59kWymt+yHpkaltcFOaZNQmRXI488W2uk75kMM7qsl5T8HWwc7wPlIKTRL5PBboon2y2taOIdgbvRhvw0Dw==</P><Q>5+QbglBKUVPdvo/0NbVA2dXzUUpbf76ysWhnte45OX7DGmIssk15uBi+awvsrRzPiewNuT+QTATObLVC6kyrIw==</Q><DP>isnMT8b4JMB5sVgwanNazwhJIHTLxoaETm+Hf/S3tkjjVwdHn0z2IUIxmGDcAES9Ye13aYKRrRKxwgzgV2p35Q==</DP><DQ>mchWzfb9Mi4SEjxZUfzgAxa2BCTxxSfsTWbV0HspjA2aybZtudlTbVlLfqYr0SoYIHlhKIcU5LUTSFh1BfjOTQ==</DQ><InverseQ>a4SbwDVLWMBNzLKIgo0oRQ/CMjQt1AT4z8nuQHXoQCBzMOE1VvW02ldAKszPgyFPnjM4XCxyQYH/hJ9ycWoHTA==</InverseQ><D>SIAZBqQ1Uvm9CZg8ITL0p6vuMvIa7v1Eaekogu/X1evA0R87z5qSr4gVP9e5W1JYAQRqPXotYQzcd+NttTyi9SovDe3rxE2BV+MiGUlBnRdxyJ+evew8eD/yTHgbdQqVFznr/F3U4ungS6oBfe4ic1z8VAuzJI09I0ByP4uh+pk=</D></RSAKeyValue>', NULL)
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_Permission]  DEFAULT ((0)) FOR [Permission]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NoOfAttempts]  DEFAULT ((0)) FOR [NoOfAttempts]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_Musics] FOREIGN KEY([Genre_fk])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_Musics]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_Users] FOREIGN KEY([User_fk])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_Users]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Musics] FOREIGN KEY([Music_fk])
REFERENCES [dbo].[Musics] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Musics]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users] FOREIGN KEY([User_fk])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [SecurityDatabase_A] SET  READ_WRITE 
GO
