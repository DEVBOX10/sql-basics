USE [MockupApplication1]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 2/7/2024 7:17:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Pin] [int] NULL,
	[ActiveMember] [bit] NULL,
	[JoinDate] [date] NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (1, N'Stefanie', N'Buckley', N'swfoegy58@bxcwtl.org', 3047, 1, CAST(N'2013-04-03' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (2, N'Sandy', N'Mc Gee', N'mczlno22@rxmkwq.net', 5555, 1, CAST(N'1993-06-13' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (3, N'Lee', N'Warren', N'vpmljn7@cusfu.brsovb.org', 2487, 1, CAST(N'2020-05-03' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (4, N'Regina', N'Forbes', N'qiekszc.txpoca@tflkg.rsetzb.net', 2149, 0, CAST(N'2011-09-20' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (5, N'Daniel', N'Kim', N'nfds20@ldyif.-qpucw.net', 1260, 1, CAST(N'2017-01-17' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (6, N'Dennis', N'Nunez', N'jjmr156@ikjvwn.net', 1355, 0, CAST(N'2009-02-27' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (7, N'Myra', N'Zuniga', N'tzdajoot1@kfiuto.com', 2785, 1, CAST(N'1994-08-10' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (8, N'Teddy', N'Ingram', N'pwlf.fqvth@byfic.xmtanx.net', 2231, 0, CAST(N'1984-08-29' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (9, N'Annie', N'Larson', N'fabc.idcsvlsjcn@kyihcl.com', 2283, 0, CAST(N'2003-05-23' AS Date))
INSERT [dbo].[UserDetail] ([Id], [FirstName], [LastName], [EmailAddress], [Pin], [ActiveMember], [JoinDate]) VALUES (10, N'Herman', N'Anderson', N'rivvxh@uqiiky.nmrknj.org', 2897, 1, CAST(N'1987-01-13' AS Date))
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
GO
USE [master]
GO
ALTER DATABASE [MockupApplication1] SET  READ_WRITE 
GO
