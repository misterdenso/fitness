SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FitnessSales](
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Amount] [numeric](21, 3) NULL,
 CONSTRAINT [PK_FitnessSales] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ClubID] ASC,
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
