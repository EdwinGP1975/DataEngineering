CREATE TABLE [dbo].[cust_order]
(
	order_id INT IDENTITY(1,1) NOT NULL,
    order_date DATETIME,
    customer_id INT,
    shipping_method_id INT,
    dest_address_id INT,
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_custorder PRIMARY KEY (order_id),
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
)
GO
