SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPlan](
	[ManagerID] [nvarchar](50) NOT NULL,
	[PlanTypeID] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[SalesPlan] [numeric](21, 3) NULL,
	[CompletedPlanAmount] [numeric](21, 3) NULL,
	[CompletedPlanQty] [numeric](21, 3) NULL,
 CONSTRAINT [PK_SalesPlan] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC,
	[PlanTypeID] ASC,
	[Date] ASC,
	[ClubID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
