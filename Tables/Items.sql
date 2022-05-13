SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[OrangeArt] [nvarchar](200) NULL,
	[Folder] [nvarchar](200) NULL,
	[ItemDepartment] [nvarchar](50) NULL,
	[ItemType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
