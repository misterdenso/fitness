SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateFitnessSales]
	@DateStart datetime2(3),
	@DateEnd datetime2(3)
AS
BEGIN

select	@DateStart = dateadd(year,2000,@DateStart),
		@DateEnd = dateadd(year,2000,@DateEnd)




--ПоступлениеДССумма
exec sp_executesql N'--INSERT INTO #tt352 WITH(TABLOCK) (_Q_000_F_000_TYPE, _Q_000_F_000_RTRef, _Q_000_F_000_RRRef, _Q_000_F_001, _Q_000_F_002, _Q_000_F_003, _Q_000_F_004) 
SELECT
T1._Fld3299_TYPE _Q_000_F_000_TYPE,
T1._Fld3299_RTRef _Q_000_F_000_RTRef,
T1._Fld3299_RRRef _Q_000_F_000_RRRef,
CAST(SUM(T1._Fld3302) AS NUMERIC(21, 3)) _Q_000_F_001,
CASE WHEN (T1._Fld3302 < 0.0) THEN 0x01 ELSE 0x00 END _Q_000_F_002,
@P1 _Q_000_F_003,
DATEADD(DAY,CAST(DATEPART(DAY,T1._Period) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) _Q_000_F_004
into ##fsales_tt352
FROM dbo._AccumRg3296 T1
WHERE ((T1._Fld4704 = @P2)) AND ((T1._Period >= @P3) AND (T1._Period <= @P4) AND (T1._RecordKind = @P5) AND (T1._Fld3299_TYPE = 0x08 AND T1._Fld3299_RTRef = 0x00000075))
GROUP BY T1._Fld3299_TYPE,
T1._Fld3299_RTRef,
T1._Fld3299_RRRef,
CASE WHEN (T1._Fld3302 < 0.0) THEN 0x01 ELSE 0x00 END,
DATEADD(DAY,CAST(DATEPART(DAY,T1._Period) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''})))
HAVING (CAST(SUM(T1._Fld3302) AS NUMERIC(21, 3)) <> 0.0)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 datetime2(3),@P4 datetime2(3),@P5 numeric(10)',N'denso',0,@DateStart,@DateEnd,0



--ПродажаСуммаДокумента
exec sp_executesql N'--INSERT INTO #tt365 WITH(TABLOCK) (_Q_000_F_000, _Q_000_F_001TRef, _Q_000_F_001RRef, _Q_000_F_002) 
SELECT
CAST(SUM(T1._Fld3232) AS NUMERIC(21, 2)) _Q_000_F_000,
T1._RecorderTRef _Q_000_F_001TRef,
T1._RecorderRRef _Q_000_F_001RRef,
@P1 _Q_000_F_002
into ##fsales_tt353
FROM dbo._AccumRg3221 T1
WHERE (T1._Fld4704 = @P2)
GROUP BY T1._RecorderTRef,
T1._RecorderRRef',N'@P1 nvarchar(4000),@P2 numeric(10)',N'denso',0




--ВозвратДСВводНАчОстатков
exec sp_executesql N'--INSERT INTO #tt354 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001, _Q_000_F_002, _Q_000_F_003TRef, _Q_000_F_003RRef, _Q_000_F_004, _Q_000_F_005) 
SELECT
T3._Fld1520RRef _Q_000_F_000RRef,
T1._Fld3303 _Q_000_F_001,
(CAST((CAST(SUM(T3._Fld1524) AS NUMERIC(21, 2)) * T1._Fld3302) AS NUMERIC(38, 8)) / T4._Fld1515) _Q_000_F_002,
T1._RecorderTRef _Q_000_F_003TRef,
T1._RecorderRRef _Q_000_F_003RRef,
@P1 _Q_000_F_004,
DATEADD(DAY,CAST(DATEPART(DAY,T1._Period) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''}))) _Q_000_F_005
into ##fsales_tt354
FROM dbo._AccumRg3296 T1
INNER JOIN dbo._Document120_VT2094 T2
ON (T1._RecorderTRef = 0x00000078 AND T1._RecorderRRef = T2._Document120_IDRRef)
INNER JOIN dbo._Document99_VT1518 T3
ON (T2._Fld2096_TYPE = 0x08 AND T2._Fld2096_RTRef = 0x00000063 AND T2._Fld2096_RRRef = T3._Document99_IDRRef)
LEFT OUTER JOIN dbo._Document99 T4
ON (T3._Document99_IDRRef = T4._IDRRef) AND (T4._Fld4704 = @P2)
WHERE ((((T1._Fld4704 = @P3)) AND (T2._Fld4704 = @P4)) AND (T3._Fld4704 = @P5)) AND ((T1._Period >= @P6) AND (T1._Period <= @P7) AND (T1._RecordKind = @P8) AND (T1._Fld3299_TYPE = 0x08 AND T1._Fld3299_RTRef = 0x00000062))
GROUP BY T3._Fld1520RRef,
T1._Fld3303,
T1._Fld3302,
T4._Fld1515,
T1._RecorderTRef,
T1._RecorderRRef,
DATEADD(DAY,CAST(DATEPART(DAY,T1._Period) AS NUMERIC(4)) - 1,DATEADD(MONTH,CAST(DATEPART(MONTH,T1._Period) AS NUMERIC(4)) - 1,DATEADD(YEAR,(CAST(DATEPART(YEAR,T1._Period) AS NUMERIC(4)) - 2000) - 2000,{ts ''4000-01-01 00:00:00''})))
HAVING (CAST(SUM(T1._Fld3302) AS NUMERIC(21, 3)) <> 0.0)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 numeric(10),@P5 numeric(10),@P6 datetime2(3),@P7 datetime2(3),@P8 numeric(10)',N'denso',0,0,0,0,@DateStart,@DateEnd,0




--ПродажиФакт
exec sp_executesql N'--INSERT INTO #tt355 WITH(TABLOCK) (_Q_000_F_000RRef, _Q_000_F_001, _Q_000_F_002_TYPE, _Q_000_F_002_RTRef, _Q_000_F_002_RRRef, _Q_000_F_003, _Q_000_F_004, _Q_000_F_005) 
SELECT
T2._Fld3226RRef _Q_000_F_000RRef,
((CAST(CAST(SUM(T2._Fld3232) AS NUMERIC(21, 2)) AS NUMERIC(17, 2)) * CAST(CAST(SUM(T1._Q_000_F_001) AS NUMERIC(27, 3)) AS NUMERIC(20, 3))) / CAST(SUM(T3._Q_000_F_000) AS NUMERIC(27, 2))) _Q_000_F_001,
T1._Q_000_F_000_TYPE _Q_000_F_002_TYPE,
T1._Q_000_F_000_RTRef _Q_000_F_002_RTRef,
T1._Q_000_F_000_RRRef _Q_000_F_002_RRRef,
T1._Q_000_F_002 _Q_000_F_003,
@P1 _Q_000_F_004,
T1._Q_000_F_004 _Q_000_F_005
into ##fsales_tt355
FROM ##fsales_tt352 T1 WITH(NOLOCK)
INNER JOIN dbo._AccumRg3221 T2
ON (T1._Q_000_F_000_TYPE = 0x08 AND T1._Q_000_F_000_RTRef = T2._RecorderTRef AND T1._Q_000_F_000_RRRef = T2._RecorderRRef)
INNER JOIN ##fsales_tt353 T3 WITH(NOLOCK)
ON (T2._RecorderTRef = T3._Q_000_F_001TRef AND T2._RecorderRRef = T3._Q_000_F_001RRef)
WHERE (T2._Fld4704 = @P2)
GROUP BY T2._Fld3226RRef,
T1._Q_000_F_000_TYPE,
T1._Q_000_F_000_RTRef,
T1._Q_000_F_000_RRRef,
T1._Q_000_F_002,
T1._Q_000_F_004
HAVING (CAST(SUM(T3._Q_000_F_000) AS NUMERIC(27, 2)) <> 0.0)
UNION ALL SELECT
T4._Q_000_F_000RRef,
CAST(SUM(T4._Q_000_F_002) AS NUMERIC(38, 8)),
CAST(NULL AS BINARY(1)),
CAST(NULL AS BINARY(4)),
CAST(NULL AS BINARY(16)),
CAST(NULL AS BINARY(1)),
@P3,
T4._Q_000_F_005
FROM ##fsales_tt354 T4 WITH(NOLOCK)
GROUP BY T4._Q_000_F_000RRef,
T4._Q_000_F_005',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 nvarchar(4000)',N'denso',0,N'denso'



--Итог
exec sp_executesql N'SELECT
CAST(SUM(T1._Q_000_F_001) AS NUMERIC(38, 8)) a,
CASE WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000075 THEN T9._Fld1967RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000061 THEN T10._Fld1411RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000069 THEN T11._Fld1648RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x0000006D THEN T12._Fld1777RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000F6A THEN T13._Fld3948RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000062 THEN T14._Fld1433RRef ELSE CAST(NULL AS BINARY(16)) END b,
CASE WHEN (CAST(CHARINDEX(N''Бассейн'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 
THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Бассейн'' WHEN (CAST(CHARINDEX(N''Групповые'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND 
T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Групповые'' WHEN (CAST(CHARINDEX(N''Детский клуб'',CASE WHEN 
T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) 
END) AS NUMERIC(12, 0)) > 0.0) THEN N''Детский клуб'' WHEN (CAST(CHARINDEX(N''Единоборства'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN 
T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Единоборства'' WHEN (CAST(CHARINDEX(N''Игровые виды'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Игровые виды'' WHEN (CAST(CHARINDEX(N''Массаж'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Массаж'' WHEN (CAST(CHARINDEX(N''Тренажерный зал'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Тренажерный зал'' WHEN (CAST(CHARINDEX(N''Мед. услуги'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Мед. услуги'' WHEN (CAST(CHARINDEX(N''Бар'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Бар'' ELSE N''Другое'' END c,
@P1 d,
T1._Q_000_F_005 e,
T1._Q_000_F_000RRef
into ##fsales_total
FROM ##fsales_tt355 T1 WITH(NOLOCK)
INNER JOIN dbo._InfoRg2977 T2
LEFT OUTER JOIN dbo._Reference69 T3
ON (T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 AND T2._Fld2978_RRRef = T3._IDRRef) AND (T3._Fld4704 = @P2)
LEFT OUTER JOIN dbo._Reference69 T4
ON (T3._ParentIDRRef = T4._IDRRef) AND (T4._Fld4704 = @P3)
LEFT OUTER JOIN dbo._Reference68 T5
ON (T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 AND T2._Fld2978_RRRef = T5._IDRRef) AND (T5._Fld4704 = @P4)
LEFT OUTER JOIN dbo._Reference68 T6
ON (T5._ParentIDRRef = T6._IDRRef) AND (T6._Fld4704 = @P5)
LEFT OUTER JOIN dbo._Reference67 T7
ON (T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 AND T2._Fld2978_RRRef = T7._IDRRef) AND (T7._Fld4704 = @P6)
LEFT OUTER JOIN dbo._Reference67 T8
ON (T7._ParentIDRRef = T8._IDRRef) AND (T8._Fld4704 = @P7)
ON (0x08 = T2._Fld2979_TYPE AND 0x00000038 = T2._Fld2979_RTRef AND T1._Q_000_F_000RRef = T2._Fld2979_RRRef) AND (CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T4._Description WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T6._Description WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T8._Description ELSE CAST(NULL AS NVARCHAR(100)) END = @P8)
LEFT OUTER JOIN dbo._Document117 T9
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000075 AND T1._Q_000_F_002_RRRef = T9._IDRRef) AND (T9._Fld4704 = @P9)
LEFT OUTER JOIN dbo._Document97 T10
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000061 AND T1._Q_000_F_002_RRRef = T10._IDRRef) AND (T10._Fld4704 = @P10)
LEFT OUTER JOIN dbo._Document105X1 T11
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000069 AND T1._Q_000_F_002_RRRef = T11._IDRRef) AND (T11._Fld4704 = @P11)
LEFT OUTER JOIN dbo._Document109 T12
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x0000006D AND T1._Q_000_F_002_RRRef = T12._IDRRef) AND (T12._Fld4704 = @P12)
LEFT OUTER JOIN dbo._Document3946 T13
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000F6A AND T1._Q_000_F_002_RRRef = T13._IDRRef) AND (T13._Fld4704 = @P13)
LEFT OUTER JOIN dbo._Document98 T14
ON (T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000062 AND T1._Q_000_F_002_RRRef = T14._IDRRef) AND (T14._Fld4704 = @P14)
WHERE (T2._Fld4704 = @P15)
GROUP BY CASE WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000075 THEN T9._Fld1967RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000061 THEN T10._Fld1411RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000069 THEN T11._Fld1648RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x0000006D THEN T12._Fld1777RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000F6A THEN T13._Fld3948RRef WHEN T1._Q_000_F_002_TYPE = 0x08 AND T1._Q_000_F_002_RTRef = 0x00000062 THEN T14._Fld1433RRef ELSE CAST(NULL AS BINARY(16)) END,
CASE WHEN (CAST(CHARINDEX(N''Бассейн'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 
THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Бассейн'' WHEN (CAST(CHARINDEX(N''Групповые'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND 
T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Групповые'' WHEN (CAST(CHARINDEX(N''Детский клуб'',CASE WHEN 
T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) 
END) AS NUMERIC(12, 0)) > 0.0) THEN N''Детский клуб'' WHEN (CAST(CHARINDEX(N''Единоборства'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN 
T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Единоборства'' WHEN (CAST(CHARINDEX(N''Игровые виды'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Игровые виды'' WHEN (CAST(CHARINDEX(N''Массаж'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Массаж'' WHEN (CAST(CHARINDEX(N''Тренажерный зал'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Тренажерный зал'' WHEN (CAST(CHARINDEX(N''Мед. услуги'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Мед. услуги'' WHEN (CAST(CHARINDEX(N''Бар'',CASE WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000045 THEN T3._Fld1027 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000044 THEN T5._Fld1019 WHEN T2._Fld2978_TYPE = 0x08 AND T2._Fld2978_RTRef = 0x00000043 THEN T7._Fld1011 ELSE CAST(NULL AS NVARCHAR(MAX)) END) AS NUMERIC(12, 0)) > 0.0) THEN N''Бар'' ELSE N''Другое'' END,
T1._Q_000_F_005,
T1._Q_000_F_000RRef',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 numeric(10),@P5 numeric(10),@P6 numeric(10),@P7 numeric(10),@P8 nvarchar(4000),@P9 numeric(10),@P10 numeric(10),@P11 numeric(10),@P12 numeric(10),@P13 numeric(10),@P14 numeric(10),@P15 numeric(10)',N'denso',0,0,0,0,0,0,N'Отчет продажи фитнес',0,0,0,0,0,0,0



--select * from ##fsales_total 


delete 
from	dwh.[dbo].[FitnessSales]
where	[Date] between dateadd(year,-2000,@DateStart) and dateadd(year,-2000,@DateEnd)



INSERT INTO dwh.[dbo].[FitnessSales]
           ([Date]
           ,[ClubID]
           ,[Department]
		   ,[ItemID]
           ,[Amount])
select	dateadd(year,-2000,f.e),
		sys.fn_varbintohexstr(f.b),
		f.c,
		sys.fn_varbintohexstr(f._Q_000_F_000RRef),
		f.a
from	##fsales_total f
where	f.b is not null








drop table ##fsales_tt352
drop table ##fsales_tt353
drop table ##fsales_tt354
drop table ##fsales_tt355
drop table ##fsales_total



END
GO
