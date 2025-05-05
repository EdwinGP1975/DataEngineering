CREATE TABLE [staging].[Book]
(
	[bookSk] [int] NOT NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[numPages] [int] NULL,
	[publicationDate] [date] NULL,
	[languageName] varchar(50) NULL,
)
