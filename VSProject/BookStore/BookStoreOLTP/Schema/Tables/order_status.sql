CREATE TABLE [dbo].[order_status] (
    status_id INT,
    status_value VARCHAR(20),
    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
)
