-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdateRetentionRate'
)
DROP PROCEDURE dbo.UpdateRetentionRate
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.UpdateRetentionRate
    @DateStart datetime2(3),
	@DateEnd datetime2(3)
AS

    
select	@DateStart = dateadd(year,2000,@DateStart),
		@DateEnd = dateadd(year,2000,@DateEnd)


declare @PrevMonthDateStart datetime2(3),
        @PrevMonthDateEnd datetime2(3)

select  @PrevMonthDateStart = dateadd(month,-1,@DateStart),
        @PrevMonthDateEnd = dateadd(month,-1,@DateEnd)


--ПрошлыйМесяц
exec sp_executesql N'--INSERT INTO #tt232 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001RRef, _Q_000_F_002RRef, _Q_000_F_003) 
SELECT
T1.Fld3162RRef _Q_000_F_000RRef,
T1.Fld3167RRef _Q_000_F_001RRef,
T1.Fld3163RRef _Q_000_F_002RRef,
@P1 _Q_000_F_003
into ##tt232
FROM (SELECT
T2.Period_ AS Period_,
T2.Fld3162RRef AS Fld3162RRef,
T2.Fld3167RRef AS Fld3167RRef,
T2.Fld3163RRef AS Fld3163RRef,
CAST(SUM(T2.Fld3172Turnover_) AS NUMERIC(33, 2)) AS Fld3172Turnover_
FROM (SELECT
DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T3._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T3._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) AS Period_,
T3._Fld3162RRef AS Fld3162RRef,
T3._Fld3167RRef AS Fld3167RRef,
T3._Fld3163RRef AS Fld3163RRef,
CAST(SUM(T3._Fld3172) AS NUMERIC(27, 2)) AS Fld3172Turnover_
FROM dbo._AccumRgTn3179 T3
LEFT OUTER JOIN dbo._Reference56X1 T4
ON (T3._Fld3166RRef = T4._IDRRef) AND (T4._Fld4704 = @P2)
WHERE ((T3._Fld4704 = @P3)) AND (T3._Period >= @P4 AND T3._Period < @P5 AND ((NOT (((T3._Fld3163RRef = 0x00000000000000000000000000000000)))) AND (NOT (((T3._Fld3167RRef = 0x00000000000000000000000000000000)))) AND (T4._Fld831 = 0x00)) AND (T3._Fld3172 <> @P6))
GROUP BY DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T3._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T3._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))),
T3._Fld3162RRef,
T3._Fld3167RRef,
T3._Fld3163RRef
HAVING (CAST(SUM(T3._Fld3172) AS NUMERIC(27, 2))) <> 0.0
UNION ALL SELECT
DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T5._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T5._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) AS Period_,
T5._Fld3162RRef AS Fld3162RRef,
T5._Fld3167RRef AS Fld3167RRef,
T5._Fld3163RRef AS Fld3163RRef,
CAST(CAST(SUM(T5._Fld3172) AS NUMERIC(21, 2)) AS NUMERIC(27, 2)) AS Fld3172Turnover_
FROM dbo._AccumRg3161 T5
LEFT OUTER JOIN dbo._Reference56X1 T6
ON (T5._Fld3166RRef = T6._IDRRef) AND (T6._Fld4704 = @P7)
WHERE ((T5._Fld4704 = @P8)) AND (T5._Period >= @P9 AND T5._Period <= @P10 AND T5._Active = 0x01 AND ((NOT (((T5._Fld3163RRef = 0x00000000000000000000000000000000)))) AND (NOT (((T5._Fld3167RRef = 0x00000000000000000000000000000000)))) AND (T6._Fld831 = 0x00)))
GROUP BY DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T5._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T5._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))),
T5._Fld3162RRef,
T5._Fld3167RRef,
T5._Fld3163RRef
HAVING (CAST(CAST(SUM(T5._Fld3172) AS NUMERIC(21, 2)) AS NUMERIC(27, 2))) <> 0.0) T2
GROUP BY T2.Period_,
T2.Fld3162RRef,
T2.Fld3167RRef,
T2.Fld3163RRef
HAVING (CAST(SUM(T2.Fld3172Turnover_) AS NUMERIC(33, 2))) <> 0.0) T1
WHERE (T1.Fld3172Turnover_ > @P11)
GROUP BY T1.Fld3162RRef,
T1.Fld3167RRef,
T1.Fld3163RRef',
N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 datetime2(3),@P5 datetime2(3),@P6 numeric(10),@P7 numeric(10),@P8 numeric(10),@P9 datetime2(3),
@P10 datetime2(3),@P11 numeric(10)',
N'denso',0,0,@PrevMonthDateStart,@PrevMonthDateEnd,0,0,0,@PrevMonthDateEnd,@PrevMonthDateEnd,0




--ВыбранныйМесяц
exec sp_executesql N'--INSERT INTO #tt233 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001RRef, _Q_000_F_002RRef, _Q_000_F_003) 
SELECT
T1.Fld3162RRef _Q_000_F_000RRef,
T1.Fld3167RRef _Q_000_F_001RRef,
T1.Fld3163RRef _Q_000_F_002RRef,
@P1 _Q_000_F_003
into ##tt233
FROM (SELECT
T2.Period_ AS Period_,
T2.Fld3162RRef AS Fld3162RRef,
T2.Fld3167RRef AS Fld3167RRef,
T2.Fld3163RRef AS Fld3163RRef,
CAST(SUM(T2.Fld3172Turnover_) AS NUMERIC(33, 2)) AS Fld3172Turnover_
FROM (SELECT
DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T3._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T3._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) AS Period_,
T3._Fld3162RRef AS Fld3162RRef,
T3._Fld3167RRef AS Fld3167RRef,
T3._Fld3163RRef AS Fld3163RRef,
CAST(SUM(T3._Fld3172) AS NUMERIC(27, 2)) AS Fld3172Turnover_
FROM dbo._AccumRgTn3179 T3
LEFT OUTER JOIN dbo._Reference56X1 T4
ON (T3._Fld3166RRef = T4._IDRRef) AND (T4._Fld4704 = @P2)
WHERE ((T3._Fld4704 = @P3)) AND (T3._Period >= @P4 AND T3._Period < @P5 AND ((NOT (((T3._Fld3163RRef = 0x00000000000000000000000000000000)))) AND (NOT (((T3._Fld3167RRef = 0x00000000000000000000000000000000)))) AND (T4._Fld831 = 0x00)) AND (T3._Fld3172 <> @P6))
GROUP BY DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T3._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T3._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))),
T3._Fld3162RRef,
T3._Fld3167RRef,
T3._Fld3163RRef
HAVING (CAST(SUM(T3._Fld3172) AS NUMERIC(27, 2))) <> 0.0
UNION ALL SELECT
DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T5._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T5._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) AS Period_,
T5._Fld3162RRef AS Fld3162RRef,
T5._Fld3167RRef AS Fld3167RRef,
T5._Fld3163RRef AS Fld3163RRef,
CAST(CAST(SUM(T5._Fld3172) AS NUMERIC(21, 2)) AS NUMERIC(27, 2)) AS Fld3172Turnover_
FROM dbo._AccumRg3161 T5
LEFT OUTER JOIN dbo._Reference56X1 T6
ON (T5._Fld3166RRef = T6._IDRRef) AND (T6._Fld4704 = @P7)
WHERE ((T5._Fld4704 = @P8)) AND (T5._Period >= @P9 AND T5._Period <= @P10 AND T5._Active = 0x01 AND ((NOT (((T5._Fld3163RRef = 0x00000000000000000000000000000000)))) AND (NOT (((T5._Fld3167RRef = 0x00000000000000000000000000000000)))) AND (T6._Fld831 = 0x00)))
GROUP BY DATEADD(DAY,1.0 - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T5._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T5._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))),
T5._Fld3162RRef,
T5._Fld3167RRef,
T5._Fld3163RRef
HAVING (CAST(CAST(SUM(T5._Fld3172) AS NUMERIC(21, 2)) AS NUMERIC(27, 2))) <> 0.0) T2
GROUP BY T2.Period_,
T2.Fld3162RRef,
T2.Fld3167RRef,
T2.Fld3163RRef
HAVING (CAST(SUM(T2.Fld3172Turnover_) AS NUMERIC(33, 2))) <> 0.0) T1
WHERE (T1.Fld3172Turnover_ > @P11)
GROUP BY T1.Fld3162RRef,
T1.Fld3167RRef,
T1.Fld3163RRef',
N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 datetime2(3),@P5 datetime2(3),@P6 numeric(10),@P7 numeric(10),@P8 numeric(10),@P9 datetime2(3),
@P10 datetime2(3),@P11 numeric(10)',
N'denso',0,0,@DateStart,@DateEnd,0,0,0,@DateEnd,@DateEnd,0





--Итог
exec sp_executesql N'SELECT
T1._Q_000_F_000RRef [ClubID],
T1._Q_000_F_001RRef [ManagerID],
--T4._Fld3933RRef,
T5._Description [Department],
T1._Q_000_F_002RRef [QtyPast],
T2._Q_000_F_002RRef QtyRet,
T3._Q_000_F_002RRef QtyRetTotal,
T3._Q_000_F_001RRef ManagerTotal,
T2._Q_000_F_001RRef ManagerRet,
@P1 fdg
into ##RetRate
FROM ##tt232 T1 WITH(NOLOCK)
LEFT OUTER JOIN ##tt233 T2 WITH(NOLOCK)
ON (T1._Q_000_F_000RRef = T2._Q_000_F_000RRef) AND (T1._Q_000_F_001RRef = T2._Q_000_F_001RRef) AND (T1._Q_000_F_002RRef = T2._Q_000_F_002RRef)
LEFT OUTER JOIN ##tt233 T3 WITH(NOLOCK)
ON (T1._Q_000_F_000RRef = T3._Q_000_F_000RRef) AND (T1._Q_000_F_002RRef = T3._Q_000_F_002RRef)
LEFT OUTER JOIN dbo._Reference73X1 T4
ON (T1._Q_000_F_001RRef = T4._IDRRef) AND (T4._Fld4704 = @P2)
LEFT OUTER JOIN dbo._Reference3831 T5
ON (T4._Fld3933RRef = T5._IDRRef) AND (T5._Fld4704 = @P3)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10)',N'denso',0,0


-- select *
-- from    ##RetRate


delete	
from	dwh.[dbo].[RetentionRateFacts]
where	[Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)



INSERT INTO dwh.[dbo].[RetentionRateFacts]
           ([Date]
           ,[ClubID]
           ,[ManagerID]
           ,[Department]
           ,[QtyPast]
           ,[QtyRet]
           ,[QtyRetTotal]
           ,[ManagerTotal]
           ,[ManagerRet])
select  dateadd(year,-2000,@DateStart),
        sys.fn_varbintohexstr(t.ClubID),
        sys.fn_varbintohexstr(t.ManagerID),
        t.Department,
        sys.fn_varbintohexstr([QtyPast])
        ,sys.fn_varbintohexstr([QtyRet])
        ,sys.fn_varbintohexstr([QtyRetTotal])
        ,sys.fn_varbintohexstr([ManagerTotal])
        ,sys.fn_varbintohexstr([ManagerRet])
from    ##RetRate t




drop table ##tt232
drop table ##tt233
drop table ##RetRate