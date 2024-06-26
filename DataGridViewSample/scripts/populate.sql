USE [EF.BookCatalog1]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 4/15/2024 4:56:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/15/2024 4:56:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Price], [CategoryId]) VALUES (1, N'C# in Depth', CAST(44.99 AS Decimal(10, 2)), 1)
INSERT [dbo].[Books] ([Id], [Title], [Price], [CategoryId]) VALUES (2, N'C# 11 and .NET 7 – Modern Cross-Platform Development Fundamentals: Start building websites and services with ASP.NET Core 7, Blazor, and EF Core 7', CAST(31.99 AS Decimal(10, 2)), 1)
INSERT [dbo].[Books] ([Id], [Title], [Price], [CategoryId]) VALUES (3, N'Apps and Services with .NET 7: Build practical projects with Blazor, .NET MAUI, gRPC, GraphQL, and other enterprise technologies', CAST(43.99 AS Decimal(10, 2)), 1)
INSERT [dbo].[Books] ([Id], [Title], [Price], [CategoryId]) VALUES (4, N'Entity Framework Core in Action', CAST(55.99 AS Decimal(10, 2)), 2)
INSERT [dbo].[Books] ([Id], [Title], [Price], [CategoryId]) VALUES (5, N'Practical Entity Framework Core 6 : Database Access for Enterprise Applications', CAST(45.99 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Description]) VALUES (1, N'Learn C#')
INSERT [dbo].[Categories] ([CategoryId], [Description]) VALUES (2, N'EF Core 7')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
/****** Object:  Index [IX_Books_CategoryId]    Script Date: 4/15/2024 4:56:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_CategoryId] ON [dbo].[Books]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories_CategoryId]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBooksWithCategories]    Script Date: 4/15/2024 4:56:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetBooksWithCategories] AS
BEGIN
SELECT Id,
       Title,
       Price,
       Books.CategoryId,
       Description
FROM dbo.Books
    INNER JOIN dbo.Categories
        ON Books.CategoryId = Categories.CategoryId;
END

GO
USE [master]
GO
ALTER DATABASE [EF.BookCatalog1] SET  READ_WRITE 
GO
