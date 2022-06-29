SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateDimensions]

AS
BEGIN


MERGE DWH.[dbo].[Clubs] as t1
USING (select	fact.ClubID,
				T1._Description
		from
		(select distinct
				[ClubID]
		from	DWH.[dbo].[CardSales]) fact
		join
		dbo._Reference79X1 T1 on fact.ClubID=sys.fn_varbintohexstr(t1._IDRRef)) as t2
ON  t1.Code = t2.ClubID
when matched then  
    update set [Name] = [_Description]
when not matched then
    INSERT  ([Code], [Name])
    values (t2.ClubID, t2._Description);



-- select	fact.ClubID,
--         T1._Description
-- into    #Clubs
-- from
-- (select distinct
--         [ClubID]
-- from	DWH.[dbo].[CardSales]) fact
-- join
-- dbo._Reference79X1 T1 on fact.ClubID=sys.fn_varbintohexstr(t1._IDRRef)


-- MERGE DWH.[dbo].[Clubs] as t1
-- USING #Clubs as t2
-- ON  t1.Code = t2.ClubID
-- when matched then  
--     update set [Name] = [_Description]
-- when not matched then
--     INSERT  ([Code], [Name])
--     values (t2.ClubID, t2._Description);


-- drop table #Clubs



delete
from	DWH.[dbo].[Managers]

insert into DWH.[dbo].[Managers]
		([Code]
      ,[Name]
      ,[ShortName]
	  ,[Department])
SELECT distinct
fact.[ManagerID],
T1._Description,
--T1._Fld1084 + ' ' + left(T1._Fld1085,1) + '.' + left(T1._Fld1086,1) + '.',
T1._Fld7038,
T2._Description
FROM 
(select distinct
		[ManagerID]
from	DWH.[dbo].[CardSales]
union all
select distinct
		[ManagerID]
from	DWH.[dbo].Workouts) fact 
join
dbo._Reference73X1 T1 on fact.[ManagerID]=sys.fn_varbintohexstr(t1._IDRRef)
LEFT OUTER JOIN dbo._Reference3831 T2
ON (T1._Fld3933RRef = T2._IDRRef) AND (T2._Fld4704 = 0)
WHERE (T1._Fld4704 = 0)


INSERT INTO DWH.[dbo].[Managers]
           ([Code]
           ,[Name]
           ,[ShortName]
           ,[Department])
     VALUES
           ('0'
           ,'Остальные'
           ,'Остальные'
           ,'Остальные')

INSERT INTO DWH.[dbo].[Managers]
           ([Code]
           ,[Name]
           ,[ShortName]
           ,[Department])
     VALUES
           ('0x00000000000000000000000000000000'
           ,'Остальные'
           ,'Остальные'
           ,'Остальные')


--exec sp_executesql N'SELECT
--T1._IDRRef,
--T1._Fld7038,
--T2._Description,
--@P1
--FROM dbo._Reference73X1 T1
--LEFT OUTER JOIN dbo._Reference3831 T2
--ON (T1._Fld3933RRef = T2._IDRRef) AND (T2._Fld4704 = @P2)
--WHERE (T1._Fld4704 = @P3)',N'@P1 nvarchar(4000),@P2 numeric(10),@P3 numeric(10)',N'denso',0,0




delete
from	dwh.[dbo].[Items]

INSERT INTO dwh.[dbo].[Items]
           ([Code]
           ,[Name]
           ,[OrangeArt]
           ,[Folder]
           ,[ItemDepartment]
           ,[ItemType])
SELECT 
sys.fn_varbintohexstr(T1._IDRRef),
T1._Description,
T1._Fld6831,
T2._Description,
T3._Description,
sys.fn_varbintohexstr(T1._Fld833RRef)
FROM dbo._Reference56X1 T1
LEFT OUTER JOIN dbo._Reference56X1 T2
ON (T1._ParentIDRRef = T2._IDRRef) AND (T2._Fld4704 = 0)
LEFT OUTER JOIN dbo._Reference3831 T3
ON (T1._Fld3835RRef = T3._IDRRef) AND (T3._Fld4704 = 0)
WHERE (T1._Fld4704 = 0)
		and (sys.fn_varbintohexstr(T1._IDRRef) in (select distinct [ItemID] from	DWH.[dbo].[CardSales])
			or sys.fn_varbintohexstr(T1._IDRRef) in (select distinct [ItemID] from	DWH.[dbo].Workouts))



delete
from dwh.[dbo].[ExtensionTypes]


INSERT INTO dwh.[dbo].[ExtensionTypes]
           ([ExtensionTypeID]
           ,[Name])
SELECT 	sys.fn_varbintohexstr(T1._IDRRef),
		case
			when T1._EnumOrder=0 then 'Новое'
			when T1._EnumOrder=1 then 'Продление'
			when T1._EnumOrder=2 then 'Возобновление'
			when T1._EnumOrder=3 then 'Переоформление'
		end
FROM dbo._Enum212 T1

union all

select	'0',
		'Допы'






delete
from	dwh.[dbo].[Settings]

insert into dwh.[dbo].[Settings]([UpdateTime])
select	getdate()









END
GO
