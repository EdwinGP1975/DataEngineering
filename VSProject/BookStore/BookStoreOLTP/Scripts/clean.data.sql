DELETE FROM dbo.order_history;
GO
DBCC CHECKIDENT ('dbo.order_history', RESEED);
GO

DELETE FROM dbo.order_line;
GO
DBCC CHECKIDENT ('dbo.order_line', RESEED);
GO

DELETE FROM dbo.cust_order;
GO
DBCC CHECKIDENT ('dbo.cust_order', RESEED);
GO

DELETE FROM dbo.customer_address;
GO
DBCC CHECKIDENT ('dbo.customer_address', RESEED);
GO

DELETE FROM dbo.[address];
GO
DBCC CHECKIDENT ('dbo.address', RESEED);
GO

DELETE FROM dbo.address_status;
GO
DBCC CHECKIDENT ('dbo.address_status', RESEED);
GO

DELETE FROM dbo.book_author;
GO
DBCC CHECKIDENT ('dbo.book_author', RESEED);
GO

DELETE FROM dbo.author;
GO
DBCC CHECKIDENT ('dbo.author', RESEED);
GO

DELETE FROM dbo.book;
GO
DBCC CHECKIDENT ('dbo.book', RESEED);
GO

DELETE FROM dbo.book_language;
GO
DBCC CHECKIDENT ('dbo.book_language', RESEED);
GO

DELETE FROM dbo.country;
GO
DBCC CHECKIDENT ('dbo.country', RESEED);
GO

DELETE FROM customer;
GO
DBCC CHECKIDENT ('customer', RESEED);
GO

DELETE FROM order_status;
GO
DBCC CHECKIDENT ('order_status', RESEED);
GO

DELETE FROM publisher;
GO
DBCC CHECKIDENT ('publisher', RESEED);
GO

DELETE FROM shipping_method;
GO
DBCC CHECKIDENT ('shipping_method', RESEED);
GO