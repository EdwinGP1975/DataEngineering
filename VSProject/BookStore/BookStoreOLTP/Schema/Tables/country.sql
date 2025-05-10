CREATE TABLE [dbo].[country]
(
	country_id INT IDENTITY(1,1) NOT NULL,
    country_name VARCHAR(200),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_country PRIMARY KEY (country_id)
)
GO
