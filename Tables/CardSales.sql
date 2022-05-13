SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardSales](
	[Date] [datetime] NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[ClientID] [nvarchar](50) NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[MembershipID] [nvarchar](50) NOT NULL,
	[ExtensionTypeID] [nvarchar](50) NOT NULL,
	[Quantity] [numeric](21, 3) NULL,
	[Amount] [numeric](21, 3) NULL,
	[DurationMonth] [numeric](21, 3) NULL,
	[DurationDays] [numeric](21, 3) NULL,
 CONSTRAINT [PK_CardSales] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[ItemID] ASC,
	[ClientID] ASC,
	[ClubID] ASC,
	[ManagerID] ASC,
	[MembershipID] ASC,
	[ExtensionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
