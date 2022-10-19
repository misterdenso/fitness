USE [fitfinal]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStatVisitors]    Script Date: 18.10.2022 17:01:12 ******/
DROP PROCEDURE [dbo].[UpdateStatVisitors]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStatVisitors]    Script Date: 18.10.2022 17:01:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStatVisitors]
        @DateStart datetime2(3),
		@DateEnd datetime2(3)
AS
BEGIN

select	@DateStart = dateadd(year,2000,@DateStart),
		@DateEnd = dateadd(year,2000,@DateEnd)




--ВТ_ЧК
exec sp_executesql N'--INSERT INTO #tt296 WITH(TABLOCK) (_Q_000_F_000_TYPE, _Q_000_F_000_RTRef, _Q_000_F_000_RRRef, _Q_000_F_001RRef, _Q_000_F_002) 
SELECT DISTINCT
T9._Fld2250_TYPE _Q_000_F_000_TYPE,
T9._Fld2250_RTRef _Q_000_F_000_RTRef,
T9._Fld2250_RRRef _Q_000_F_000_RRRef,
T9._Fld2263RRef _Q_000_F_001RRef,
@P1 _Q_000_F_002
into ##tt296
FROM (SELECT
T8._Fld3021RRef AS Fld3021RRef,
T8._Fld3020RRef AS Fld3020RRef
FROM (SELECT
T3.Fld3020RRef AS Fld3020RRef,
T3.MAXPERIOD_ AS MAXPERIOD_,
SUBSTRING(MAX(T6._RecorderTRef + T6._RecorderRRef),1,4) AS MAXRECORDERTRef,
SUBSTRING(MAX(T6._RecorderTRef + T6._RecorderRRef),5,16) AS MAXRECORDERRRef
FROM (SELECT
T4._Fld3020RRef AS Fld3020RRef,
MAX(T4._Period) AS MAXPERIOD_
FROM dbo._InfoRg3019 T4
LEFT OUTER JOIN dbo._Document125X1 T5
ON (T4._Fld3020RRef = T5._IDRRef) AND (T5._Fld4704 = @P2)
WHERE ((T4._Fld4704 = @P3)) AND (T4._Period <= @P4 AND ((T5._Fld2264RRef = @P5)))
GROUP BY T4._Fld3020RRef) T3
INNER JOIN dbo._InfoRg3019 T6
ON T3.Fld3020RRef = T6._Fld3020RRef AND T3.MAXPERIOD_ = T6._Period
LEFT OUTER JOIN dbo._Document125X1 T7
ON (T6._Fld3020RRef = T7._IDRRef) AND (T7._Fld4704 = @P6)
WHERE ((T6._Fld4704 = @P7)) AND (((T7._Fld2264RRef = @P8)))
GROUP BY T3.Fld3020RRef,
T3.MAXPERIOD_) T2
INNER JOIN dbo._InfoRg3019 T8
ON T2.Fld3020RRef = T8._Fld3020RRef AND T2.MAXPERIOD_ = T8._Period AND T2.MAXRECORDERTRef = T8._RecorderTRef AND T2.MAXRECORDERRRef = T8._RecorderRRef
WHERE (T8._Fld4704 = @P9)) T1
LEFT OUTER JOIN dbo._Document125X1 T9
ON (T1.Fld3020RRef = T9._IDRRef) AND (T9._Fld4704 = @P10)
LEFT OUTER JOIN dbo._InfoRg2977 T10
ON ((0x08 = T10._Fld2979_TYPE AND 0x00000038 = T10._Fld2979_RTRef AND T9._Fld2251RRef = T10._Fld2979_RRRef) AND (T10._Fld2978_TYPE = 0x08 AND T10._Fld2978_RTRef = 0x00000044 AND T10._Fld2978_RRRef = @P11)) AND (T10._Fld4704 = @P12)
WHERE ((T1.Fld3021RRef = @P13) OR (T1.Fld3021RRef = @P14)) AND (T10._Fld2978_TYPE IS NULL AND T10._Fld2978_RTRef IS NULL AND T10._Fld2978_RRRef IS NULL)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 datetime2(3),@P5 varbinary(16),@P6 numeric(10),@P7 numeric(10),@P8 varbinary(16),@P9 numeric(10),@P10 numeric(10),@P11 varbinary(16),@P12 numeric(10),@P13 varbinary(16),@P14 varbinary(16)',N'denso',0,0,@DateStart,0xBF3C881733694B8F462E8D8B9E26692F,0,0,0xBF3C881733694B8F462E8D8B9E26692F,0,0,0x812E00155D59960211E9B210C0F3382A,0,0x95E8A0F52FEC658B4EE269005888801B,0x8401FC76F183B74F44A0BD0A796ABF26


--ВТ_Посещения
exec sp_executesql N'--INSERT INTO #tt297 WITH(TABLOCK) (_Q_000_F_000, _Q_000_F_001_TYPE, _Q_000_F_001_RTRef, _Q_000_F_001_RRRef, _Q_000_F_002RRef, _Q_000_F_003) 
SELECT
CAST(COUNT(DISTINCT T1._IDRRef) AS NUMERIC(12)) _Q_000_F_000,
T1._Fld3898_TYPE _Q_000_F_001_TYPE,
T1._Fld3898_RTRef _Q_000_F_001_RTRef,
T1._Fld3898_RRRef _Q_000_F_001_RRRef,
T1._Fld3897RRef _Q_000_F_002RRef,
@P1 _Q_000_F_003
into ##tt297
FROM dbo._Document3895 T1
INNER JOIN ##tt296 T2 WITH(NOLOCK)
ON (T2._Q_000_F_000_TYPE = T1._Fld3898_TYPE AND T2._Q_000_F_000_RTRef = T1._Fld3898_RTRef AND T2._Q_000_F_000_RRRef = T1._Fld3898_RRRef) AND (T2._Q_000_F_001RRef = T1._Fld3897RRef)
WHERE ((T1._Fld4704 = @P2)) AND ((T1._Date_Time >= @P3) AND (T1._Date_Time <= @P4) AND T1._Posted = 0x01)
GROUP BY T1._Fld3898_TYPE,
T1._Fld3898_RTRef,
T1._Fld3898_RRRef,
T1._Fld3897RRef',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 datetime2(3),@P4 datetime2(3)',N'denso',0,@DateStart,@DateEnd


--ВТ_Группа
exec sp_executesql N'--INSERT INTO #tt298 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001, _Q_000_F_002, _Q_000_F_003) 
SELECT
T1._Q_000_F_002RRef _Q_000_F_000RRef,
T1._Q_000_F_000 _Q_000_F_001,
CAST((COUNT(DISTINCT CASE WHEN T1._Q_000_F_001_TYPE = 0x01 THEN 0x01 END) + COUNT(DISTINCT CASE WHEN T1._Q_000_F_001_TYPE = 0x08 THEN T1._Q_000_F_001_RTRef + T1._Q_000_F_001_RRRef END)) AS NUMERIC(12)) _Q_000_F_002,
@P1 _Q_000_F_003
into ##tt298
FROM ##tt297 T1 WITH(NOLOCK)
GROUP BY T1._Q_000_F_002RRef,
T1._Q_000_F_000',N'@P1 nvarchar(4000)',N'denso'


--ВТ_Посетили
exec sp_executesql N'--INSERT INTO #tt299 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001, _Q_000_F_002, _Q_000_F_003) 
SELECT
T1._Q_000_F_000RRef _Q_000_F_000RRef,
CASE 
    WHEN (T1._Q_000_F_001 < 4.0) THEN N''1-3'' 
    WHEN (T1._Q_000_F_001 < 8.0) THEN N''4-7'' 
    WHEN (T1._Q_000_F_001 < 12.0) THEN N''8-11'' 
    ELSE N''12+'' 
END _Q_000_F_001,
CAST(SUM(T1._Q_000_F_002) AS NUMERIC(18, 0)) _Q_000_F_002,
@P1 _Q_000_F_003
into ##tt299
FROM ##tt298 T1 WITH(NOLOCK)
GROUP BY T1._Q_000_F_000RRef,
CASE WHEN (T1._Q_000_F_001 < 4.0) THEN N''1-3'' WHEN (T1._Q_000_F_001 < 8.0) THEN N''4-7'' WHEN (T1._Q_000_F_001 < 12.0) THEN N''8-11'' ELSE N''12+'' END',N'@P1 nvarchar(4000)',N'denso'


--ВТ_БезПосещений
exec sp_executesql N'--INSERT INTO #tt300 WITH(TABLOCK) (_Q_000_F_000, _Q_000_F_001RRef, _Q_000_F_002, _Q_000_F_003) 
SELECT
CAST((COUNT(DISTINCT CASE WHEN T1._Q_000_F_000_TYPE = 0x01 THEN 0x01 END) + COUNT(DISTINCT CASE WHEN T1._Q_000_F_000_TYPE = 0x08 THEN T1._Q_000_F_000_RTRef + T1._Q_000_F_000_RRRef END)) AS NUMERIC(12)) _Q_000_F_000,
T1._Q_000_F_001RRef _Q_000_F_001RRef,
@P1 _Q_000_F_002,
@P2 _Q_000_F_003
into ##tt300
FROM ##tt296 T1 WITH(NOLOCK)
LEFT OUTER JOIN ##tt297 T2 WITH(NOLOCK)
ON (T2._Q_000_F_001_TYPE = T1._Q_000_F_000_TYPE AND T2._Q_000_F_001_RTRef = T1._Q_000_F_000_RTRef AND T2._Q_000_F_001_RRRef = T1._Q_000_F_000_RRRef) AND (T2._Q_000_F_002RRef = T1._Q_000_F_001RRef)
WHERE (T2._Q_000_F_001_TYPE IS NULL AND T2._Q_000_F_001_RTRef IS NULL AND T2._Q_000_F_001_RRRef IS NULL)
GROUP BY T1._Q_000_F_001RRef',N'@P1 nvarchar(4000),@P2 nvarchar(4000)',N'0',N'denso'



delete	
from	dwh.[dbo].[VisitorsStat]
where	[Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)


INSERT INTO [DWH].[dbo].[VisitorsStat]
           ([Date]
           ,[ClubID]
           ,[GroupName]
           ,[Qty])
select 		dateadd(year,-2000,@DateStart),
			[ClubID],
			[Group] + ' посещений',
			[Qty]
from
	(
	SELECT
	sys.fn_varbintohexstr(T1._Q_000_F_000RRef) ClubID,
	T1._Q_000_F_001 [Group],
	T1._Q_000_F_002 Qty
	FROM ##tt299 T1 WITH(NOLOCK)
	UNION ALL 
	SELECT
	sys.fn_varbintohexstr(T2._Q_000_F_001RRef),
	CAST(T2._Q_000_F_002 AS NVARCHAR(4)),
	CAST(T2._Q_000_F_000 AS NUMERIC(18, 0))
	FROM ##tt300 T2 WITH(NOLOCK)
	) test




drop table ##tt296
drop table ##tt297
drop table ##tt298
drop table ##tt299
drop table ##tt300


END
GO


