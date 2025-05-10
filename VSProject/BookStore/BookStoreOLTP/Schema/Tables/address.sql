CREATE TABLE [dbo].[address]
(
	address_id INT IDENTITY(1,1) NOT NULL,
    street_number VARCHAR(10),
    street_name VARCHAR(200),
    city VARCHAR(100),
    country_id INT,
	[rowversion] timestamp NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY (address_id),
    CONSTRAINT fk_addr_ctry FOREIGN KEY (country_id) REFERENCES country (country_id)
)
GO
