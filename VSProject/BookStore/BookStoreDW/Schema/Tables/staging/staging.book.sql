CREATE TABLE [staging].[Book]
(
	[bookSk] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[numPages] [int] NULL,
	[publicationDate] [date] NULL,
	[languageName] varchar(50) NULL,
)
