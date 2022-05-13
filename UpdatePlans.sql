SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UpdatePlans]
	@DateStart datetime2(3),
	@DateEnd datetime2(3)
AS
BEGIN

select	@DateStart = dateadd(year,2000,@DateStart),
		@DateEnd = dateadd(year,2000,@DateEnd)


exec sp_executesql N'SELECT
T1._Fld6380RRef,
T1._Fld6402RRef,
T1._Fld6381,
T1._Fld6382,
T1._Fld6869,
T2._Fld6373,
T2._Fld6375RRef,
T2._Fld6374RRef,
@P1 temp
into ##denso_temp
FROM dbo._Document6364_VT6378X1 T1
LEFT OUTER JOIN dbo._Document6364X1 T2
ON T1._Document6364_IDRRef = T2._IDRRef
WHERE (T2._Fld6373 >= @P2) AND (T2._Fld6373 <= @P3) AND T2._Posted = 0x01 AND (T2._Fld6374RRef = @P4)',N'@P1 nvarchar(4000),@P2 datetime2(3),@P3 datetime2(3),@P4 varbinary(16)',
N'denso',@DateStart,@DateEnd,0xB680005056C0000811E6A59D2495D883

delete
from	[DWH].[dbo].[SalesPlan]
where	[Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)

insert into [DWH].dbo.[SalesPlan](
		[ManagerID]
      ,[PlanTypeID]
      ,[Date]
      ,[ClubID]
      ,[DepartmentID]
      ,[SalesPlan]
      ,[CompletedPlanAmount]
      ,[CompletedPlanQty])
select	sys.fn_varbintohexstr(t._Fld6380RRef),
		sys.fn_varbintohexstr(t._Fld6402RRef),
		dateadd(year,-2000,t._Fld6373),
		sys.fn_varbintohexstr(t._Fld6375RRef),
		sys.fn_varbintohexstr(t._Fld6374RRef),
		sum(t._Fld6381),
		sum(t._Fld6382),
		sum(t._Fld6869)
from	##denso_temp t
group by
		t._Fld6380RRef,
		t._Fld6402RRef,
		dateadd(year,-2000,t._Fld6373),
		t._Fld6375RRef,
		t._Fld6374RRef

--адаптация ПланИД
update [DWH].dbo.[SalesPlan]
set		[PlanTypeID]='0xa5058b6cc78d22764475f86f541f31b0'
where	[PlanTypeID]='0x8294d867a759f1ff4d768294a35305d0'
		and [Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)

update [DWH].dbo.[SalesPlan]
set		[PlanTypeID]='0xacb37c6e5e2816f248fd3496be920fae'
where	[PlanTypeID]='0xa091c18ea7d5df654de7e2afe21cfc8b'
		and [Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)



drop table ##denso_temp





END
GO
