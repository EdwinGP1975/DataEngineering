IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[DimDate]
			  WHERE [dateKey] = 0)
BEGIN

    INSERT INTO [dbo].[DimDate]
               ([dateKey]
               ,[fullDate]
               ,[dayNumberOfWeek]
               ,[dayNameOfWeek]
               ,[dayNumberOfMonth]
               ,[dayNumberOfYear]
               ,[weekNumberOfYear]
               ,[monthName]
               ,[monthNumberOfYear]
               ,[calendarQuarter]
               ,[calendarYear]
               ,[calendarSemester])
         VALUES
               (0
               ,GETDATE()
               ,0
               ,''
               ,0
               ,0
               ,1
               ,''
               ,0
               ,0
               ,0
               ,0);
END
GO
