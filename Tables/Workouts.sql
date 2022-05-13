SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workouts](
	[Date] [datetime] NOT NULL,
	[SegmentID] [nvarchar](50) NOT NULL,
	[ClubID] [nvarchar](50) NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[ManagerID] [nvarchar](50) NOT NULL,
	[WorkoutID] [int] NULL,
	[Visitors] [int] NULL,
 CONSTRAINT [PK_Workouts] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[SegmentID] ASC,
	[ClubID] ASC,
	[ServiceType] ASC,
	[Department] ASC,
	[ItemID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
