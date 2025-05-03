CREATE TABLE [dbo].[publisher] (
    publisher_id INT,
    publisher_name VARCHAR(400),
    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
);
