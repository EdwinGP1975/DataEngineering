CREATE TABLE [staging].[custOrder]
(
	[orderId] INT NOT NULL,
	[historyId] INT NOT NULL,
	[orderDateKey] INT NOT NULL,
	[statusDateKey] INT NOT NULL,
	[bookSk] INT NOT NULL,
	[customerSk] INT NOT NULL,
	[destDeliverySiteSk] INT NOT NULL,
	[shippingMethodSk] INT NOT NULL,
	[publisherSk] INT NOT NULL,
	[price] DECIMAL(5, 2) NOT NULL,
	[quantity] INT NOT NULL,
	[orderDate] DATETIME NOT NULL,
	[lastStatusId] INT NOT NULL,
	[lastStatusDate] DATETIME NOT NULL,
	[lastOrderStatus] VARCHAR(20) NOT NULL
)
GO
