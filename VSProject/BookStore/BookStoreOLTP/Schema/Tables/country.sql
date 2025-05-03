CREATE TABLE [dbo].[country] (
    country_id INT,
    country_name VARCHAR(200),
    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT pk_country PRIMARY KEY (country_id)
)
