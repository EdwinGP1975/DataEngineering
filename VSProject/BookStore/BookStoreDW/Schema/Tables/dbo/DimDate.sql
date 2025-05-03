CREATE TABLE [dbo].[DimDate]
(
	[dateKey] [int] NOT NULL CONSTRAINT PK_DimDate PRIMARY KEY,
	[fullDate] [date] NOT NULL,
	[dayNumberOfWeek] [tinyint] NOT NULL,
	[dayNameOfWeek] [nvarchar](10) NOT NULL,
	[dayNumberOfMonth] [tinyint] NOT NULL,
	[dayNumberOfYear] [smallint] NOT NULL,
	[weekNumberOfYear] [tinyint] NOT NULL,
	[monthName] [nvarchar](10) NOT NULL,
	[monthNumberOfYear] [tinyint] NOT NULL,
	[calendarQuarter] [tinyint] NOT NULL,
	[calendarYear] [smallint] NOT NULL,
	[calendarSemester] [tinyint] NOT NULL
);
GO
