CREATE TABLE [dbo].[customer]
(
	customer_id INT IDENTITY(1,1) NOT NULL,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(350),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
)
GO
