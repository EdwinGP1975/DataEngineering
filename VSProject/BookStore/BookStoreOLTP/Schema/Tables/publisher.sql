CREATE TABLE [dbo].[publisher]
(
	publisher_id INT IDENTITY(1,1) NOT NULL,
    publisher_name VARCHAR(400),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
)
GO
