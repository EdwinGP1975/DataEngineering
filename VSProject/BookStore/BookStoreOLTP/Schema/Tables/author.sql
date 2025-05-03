CREATE TABLE [dbo].[author] (
    author_id INT,
    author_name VARCHAR(400),
    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT pk_author PRIMARY KEY (author_id)
);
