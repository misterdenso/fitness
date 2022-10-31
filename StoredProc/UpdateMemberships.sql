USE [fitfinal]
GO

/****** Object:  StoredProcedure [dbo].[UpdateMemberships]    Script Date: 31.10.2022 15:48:37 ******/
DROP PROCEDURE [dbo].[UpdateMemberships]
GO

/****** Object:  StoredProcedure [dbo].[UpdateMemberships]    Script Date: 31.10.2022 15:48:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMemberships]
		@Date datetime2(3)
AS
BEGIN


select	@Date = dateadd(year,2000,@Date)


exec sp_executesql N'--INSERT INTO #tt385 WITH(TABLOCK) (_Q_000_F_000_TYPE, _Q_000_F_000_RTRef, _Q_000_F_000_RRRef, _Q_000_F_001RRef, _Q_000_F_002) 
SELECT DISTINCT
T9._Fld2250_TYPE _Q_000_F_000_TYPE,
T9._Fld2250_RTRef _Q_000_F_000_RTRef,
T9._Fld2250_RRRef _Q_000_F_000_RRRef,
T9._Fld2263RRef _Q_000_F_001RRef,
@P1 _Q_000_F_002
into ##tt385
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
WHERE ((T1.Fld3021RRef = @P13) OR (T1.Fld3021RRef = @P14)) AND (T10._Fld2978_TYPE IS NULL AND T10._Fld2978_RTRef IS NULL AND T10._Fld2978_RRRef IS NULL)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10),@P4 datetime2(3),@P5 varbinary(16),@P6 numeric(10),@P7 numeric(10),@P8 varbinary(16),@P9 numeric(10),@P10 numeric(10),@P11 varbinary(16),@P12 numeric(10),@P13 varbinary(16),@P14 varbinary(16)',
N'denso',0,0,@Date,0xBF3C881733694B8F462E8D8B9E26692F,0,0,0xBF3C881733694B8F462E8D8B9E26692F,0,0,0x812E00155D59960211E9B210C0F3382A,0,0x95E8A0F52FEC658B4EE269005888801B,0x8401FC76F183B74F44A0BD0A796ABF26

delete	
from	dwh.[dbo].[Memberships]
where	[Date] = dateadd(year,-2000,@Date)





INSERT INTO dwh.[dbo].[Memberships]
           ([Date]
           ,[ClientID]
           ,[ClubID])
select      cast(dateadd(year,-2000,@Date) as date),
            sys.fn_varbintohexstr(_Q_000_F_000_RRRef),
            sys.fn_varbintohexstr(_Q_000_F_001RRef)
from        ##tt385


drop table ##tt385





END
GO


