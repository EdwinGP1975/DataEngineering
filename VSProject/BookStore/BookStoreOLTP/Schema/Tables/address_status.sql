CREATE TABLE [dbo].[address_status]
(
	status_id INT IDENTITY(1,1) NOT NULL,
    address_status VARCHAR(30),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_addr_status PRIMARY KEY (status_id)
)
GO
