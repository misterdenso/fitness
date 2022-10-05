--Заполнение посещений
-- exec sp_executesql N'SELECT
-- DATEADD(DAY,CAST(DATEPART(DAY,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Date_Time) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) [Date],
-- T1._Fld3897RRef,
-- CAST(COUNT(DISTINCT T1._IDRRef) AS NUMERIC(12)) [Quantity]
-- into ##DensoVisitors
-- FROM dbo._Document3895 T1
-- WHERE ((T1._Fld4704 = @P2)) AND (T1._Posted = 0x01 AND (T1._Date_Time >= @P3) AND (T1._Date_Time <= @P4))
-- GROUP BY T1._Fld3897RRef,
-- DATEADD(DAY,CAST(DATEPART(DAY,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Date_Time) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''})))'
-- ,N'@P1 nvarchar(4000),@P2 numeric(10),@P3 datetime2(3),@P4 datetime2(3)',N'denso',0,@DateStart,@DateEnd

declare @DateStart datetime2(3)
declare @DateEnd datetime2(3)


set @DateStart='20220101'
set @DateEnd='20221231'

select	@DateStart = dateadd(year,2000,@DateStart),
		@DateEnd = dateadd(year,2000,@DateEnd)




exec sp_executesql N'SELECT
T1._Fld3897RRef [ClubID],
CAST(COUNT(DISTINCT T1._IDRRef) AS NUMERIC(12)) [Qty],
DATEADD(DAY,CAST(DATEPART(DAY,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Date_Time) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) [Date],
(T2._Fld2251RRef) [ItemID]
into ##DensoVisitors
FROM dbo._Document3895 T1
LEFT OUTER JOIN dbo._Document125X1 T2
ON (T1._Fld3900_TYPE = 0x08 AND T1._Fld3900_RTRef = 0x0000007D AND T1._Fld3900_RRRef = T2._IDRRef) AND (T2._Fld4704 = @P2)
WHERE ((T1._Fld4704 = @P3)) AND ((T1._Date_Time >= @P4) AND (T1._Date_Time <= @P5) AND T1._Posted = 0x01)
GROUP BY T1._Fld3897RRef,
DATEADD(DAY,CAST(DATEPART(DAY,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Date_Time) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Date_Time) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))),
(T2._Fld2251RRef)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 datetime2(3),@P5 datetime2(3)',N'denso',0,0,@DateStart,@DateEnd



delete	
from	dwh.[dbo].[Visitors]
where	[Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)


insert into dwh.[dbo].[Visitors]
	([Date]
      ,[ClubID]
	  ,[ItemID]
      ,[Quantity])
select	dateadd(year,-2000,[Date]),
		sys.fn_varbintohexstr(ClubID),
		isnull(sys.fn_varbintohexstr(ItemID),'0'),
		[Qty]
from	##DensoVisitors


drop table ##DensoVisitors