CREATE TABLE [dbo].[author]
(
	author_id INT IDENTITY(1,1) NOT NULL,
    author_name VARCHAR(400),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_author PRIMARY KEY (author_id)
)
GO
