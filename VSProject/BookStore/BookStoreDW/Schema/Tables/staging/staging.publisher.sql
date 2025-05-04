CREATE TABLE [staging].[Publisher]
(
	[publisherSK] [int] IDENTITY(1,1) NOT NULL,
	[publisherName] [varchar](400) NULL,
	[title] [varchar](400) NULL,
	[publicationDate] DATE NULL
)
