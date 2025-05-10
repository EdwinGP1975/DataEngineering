CREATE TABLE [dbo].[order_status]
(
	status_id INT IDENTITY(1,1) NOT NULL,
    status_value VARCHAR(20),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
)
GO
