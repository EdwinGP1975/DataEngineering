IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[DimDate])
 BEGIN
	BEGIN TRAN 
		DECLARE @startdate DATE = '2016-01-01',
				@enddate   DATE = '2025-06-01';
		DECLARE @datelist TABLE(fullDate DATE);

	IF @startdate IS NULL
		BEGIN
			SELECT TOP 1 
				   @startdate = fullDate
			FROM dbo.DimDate 
			ORDER By dateKey ASC;
		END

	WHILE (@startdate <= @enddate)
	BEGIN 
		INSERT INTO @datelist(fullDate)
		SELECT @startdate

		SET @startdate = DATEADD(dd,1,@startdate);
	END

	 INSERT INTO dbo.DimDate(dateKey
							,fullDate 
							,dayNumberOfWeek 
							,dayNameOfWeek 
							,dayNumberOfMonth 
							,dayNumberOfYear 
							,weekNumberOfYear 
							,[monthName] 
							,monthNumberOfYear 
							,calendarQuarter 
							,calendarYear 
							,calendarSemester)

	SELECT dateKey           = CONVERT(INT,CONVERT(VARCHAR,dl.fullDate,112))
		  ,fullDate          = dl.fullDate
		  ,dayNumberOfWeek   = DATEPART(dw,dl.fullDate)
		  ,dayNameOfWeek     = DATENAME(WEEKDAY,dl.fullDate) 
		  ,dayNumberOfMonth  = DATEPART(d,dl.fullDate)
		  ,dayNumberOfYear   = DATEPART(dy,dl.fullDate)
		  ,weekNumberOfYear  = DATEPART(wk, dl.fullDate)
		  ,[monthName]       = DATENAME(MONTH,dl.fullDate) 
		  ,monthNumberOfYear = MONTH(dl.fullDate)
		  ,calendarQuarter   = DATEPART(qq, dl.fullDate)
		  ,calendarYear      = YEAR(dl.fullDate)
		  ,calendarSemester  = CASE DATEPART(qq, dl.fullDate)
										WHEN 1 THEN 1
										WHEN 2 THEN 1
										WHEN 3 THEN 2
										WHEN 4 THEN 2
								  END
		FROM @datelist              dl 
		LEFT OUTER JOIN dbo.DimDate dd ON (dl.fullDate = dd.fullDate)
		WHERE dd.fullDate IS NULL;
	COMMIT TRAN
END
GO
