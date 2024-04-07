
USE [WinesDapper]
GO
/****** Object:  Table [dbo].[Wines]    Script Date: 4/7/2024 7:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wines](
	[WineId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[WineType] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wines] PRIMARY KEY CLUSTERED 
(
	[WineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WineType]    Script Date: 4/7/2024 7:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WineType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WineType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Wines] ON 

INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (1, N'Veuve Clicquot Rose', N'Rose')
INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (2, N'Whispering Angel Rose', N'Rose')
INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (3, N'Pinot Grigio', N'Red')
INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (4, N'Zinfandel', N'White')
INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (5, N'Banyuls Traditional French', N'White')
INSERT [dbo].[Wines] ([WineId], [Name], [WineType]) VALUES (6, N'Louis Jdot', N'Red')
SET IDENTITY_INSERT [dbo].[Wines] OFF
GO
SET IDENTITY_INSERT [dbo].[WineType] ON 

INSERT [dbo].[WineType] ([Id], [TypeName], [Description]) VALUES (1, N'Red', N'Imported red wine')
INSERT [dbo].[WineType] ([Id], [TypeName], [Description]) VALUES (2, N'White', N'Imported white wine')
INSERT [dbo].[WineType] ([Id], [TypeName], [Description]) VALUES (3, N'Rose', N'Imported rose wine')
SET IDENTITY_INSERT [dbo].[WineType] OFF
GO
USE [master]
GO
ALTER DATABASE [WinesDapper] SET  READ_WRITE 
GO
