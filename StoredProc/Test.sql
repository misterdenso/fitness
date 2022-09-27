SELECT 
sys.fn_varbintohexstr(T1._IDRRef),
T1._Description,
T1._Fld6831,
T2._Description,
T3._Description,
sys.fn_varbintohexstr(T1._Fld833RRef),
T1._Fld803,
case
		when T1._Fld803 like '0'
			then 'бесплатно'
		when T1._Fld803 like '1'
			then 'короткая'
		when T1._Fld803 like '2'
			then 'длинная 9+'
		when T1._Fld803 like '3'
			then '5-8 мес'
		when T1._Fld803 like '4'
			then 'посещения'
		when T1._Fld803 like '5'
			then 'VIP'
		when T1._Fld803 like '6'
			then 'рекайринг'
		when T1._Fld803 like '7'
			then 'детская/юниор'
		when T1._Fld803 like '8'
			then 'корп.холдинг/для своих'
		when T1._Fld803 like '9'
			then 'день/утро/фитнес-день'
		else 'Другой'
	end
FROM dbo._Reference56X1 T1
LEFT OUTER JOIN dbo._Reference56X1 T2
ON (T1._ParentIDRRef = T2._IDRRef) AND (T2._Fld4704 = 0)
LEFT OUTER JOIN dbo._Reference3831 T3
ON (T1._Fld3835RRef = T3._IDRRef) AND (T3._Fld4704 = 0)
WHERE (T1._Fld4704 = 0)
		and (sys.fn_varbintohexstr(T1._IDRRef) in (select distinct [ItemID] from	DWH.[dbo].[CardSales])
			or sys.fn_varbintohexstr(T1._IDRRef) in (select distinct [ItemID] from	DWH.[dbo].Workouts))