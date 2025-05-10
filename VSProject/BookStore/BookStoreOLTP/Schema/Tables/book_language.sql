CREATE TABLE [dbo].[book_language]
(
	language_id INT IDENTITY(1,1) NOT NULL,
    language_code VARCHAR(8),
    language_name VARCHAR(50),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_language PRIMARY KEY (language_id)
)
GO
