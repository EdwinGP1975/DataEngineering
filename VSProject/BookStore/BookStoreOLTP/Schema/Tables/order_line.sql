CREATE TABLE [dbo].[order_line]
(
	line_id INT IDENTITY(1,1) NOT NULL,
    order_id INT,
    book_id INT,
    price DECIMAL(5, 2),
    [rowversion] timestamp NOT NULL,
    CONSTRAINT pk_orderline PRIMARY KEY (line_id),
    CONSTRAINT fk_ol_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_ol_book FOREIGN KEY (book_id) REFERENCES book (book_id)
)
GO
