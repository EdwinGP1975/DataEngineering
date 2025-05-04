CREATE TABLE [dbo].[DimAuthor]
(
	[authorSk] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NOT NULL,
	[authorName] [varchar](400) NULL,
	[bookId] [int] NOT NULL,
	[titleBook] [varchar](400) NULL,
	[numPages] [int] null,
	CONSTRAINT [pk_Author] PRIMARY KEY ([authorSk])
)
