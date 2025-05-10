CREATE TABLE [dbo].[shipping_method]
(
	method_id INT IDENTITY(1,1) NOT NULL,
    method_name VARCHAR(100),
    cost DECIMAL(6, 2),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_shipmethod PRIMARY KEY (method_id)
)
GO
