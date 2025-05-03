CREATE TABLE [dbo].[book_language] (
    language_id INT,
    language_code VARCHAR(8),
    language_name VARCHAR(50),
    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);
