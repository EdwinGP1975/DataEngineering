CREATE TABLE [dbo].[DimAuthor]
(
	[authorSk] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NOT NULL,
	[authorName] [varchar](400) NULL,
	CONSTRAINT [pk_Author] PRIMARY KEY ([authorSk])
)
