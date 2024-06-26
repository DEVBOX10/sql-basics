USE [Mocked1]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 12/16/2023 2:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InputDate] [date] NULL,
	[Specification] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
