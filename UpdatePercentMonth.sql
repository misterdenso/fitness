-- Create a new stored procedure called 'UpdatePercentMonth' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdatePercentMonth'
)
DROP PROCEDURE dbo.UpdatePercentMonth
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.UpdatePercentMonth
        @DateStart datetime2(3),
		@DateEnd datetime2(3)
AS

declare @i datetime2(3),
        @Start datetime2(3),
		@End datetime2(3)



select @i = @DateStart


while month(@i)<=month(@DateEnd)
	begin

		select	@Start = DATEADD(month, DATEDIFF(month, 0, @i), 0),
				@End = DATEADD(month, DATEDIFF(month, 0, @i) + 1, 0) 

        exec dbo.UpdatePercent  @Start, @End

		select @i = DATEADD(month,1,@i)

	end

