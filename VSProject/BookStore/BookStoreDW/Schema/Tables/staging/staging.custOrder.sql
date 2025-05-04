CREATE TABLE [staging].[custOrder]
(
	[orderId] INT NOT NULL,
	[lineId] INT NOT NULL,
	[historyId] INT NOT NULL,
	[statusId] INT NOT NULL,
	[orderDateKey] INT NOT NULL,
	[statusDateKey] INT NOT NULL,
	[bookSk] INT NOT NULL,
	[customerSk] INT NOT NULL,
	[destDeliverySiteSk] INT NOT NULL,	
	[shippingMethodSK] INT,
	[price] DECIMAL(5, 2),
	[orderDate] DATETIME,
	[statusDate] DATETIME,
	[statusValue] VARCHAR(20)
)
GO
