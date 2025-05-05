CREATE TABLE [dbo].[FactCustOrder]
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
	[shippingMethodSk] INT,
	[authorSk] INT,
	[publisherSk] INT,
	[price] DECIMAL(5, 2),
	[orderDate] DATETIME,
	[statusDate] DATETIME,
	[statusValue] VARCHAR(20),
	CONSTRAINT pk_FactCustOrder PRIMARY KEY([orderId],[lineId],[historyId], [statusId]),
	CONSTRAINT fk_DimBook FOREIGN KEY([bookSk]) REFERENCES [dbo].[DimBook]([bookSk]),
	CONSTRAINT fk_DimCustomer FOREIGN KEY([customerSk]) REFERENCES [dbo].[DimCustomer]([customerSk]),
	CONSTRAINT fk_DimDeliverySite FOREIGN KEY([destDeliverySiteSk]) REFERENCES [dbo].[DimDeliverySite]([deliverySiteSk]),
	CONSTRAINT fk_DimShippingMethod FOREIGN KEY([shippingMethodSk]) REFERENCES [dbo].[DimShippingMethod]([shippingMethodSk]),
	CONSTRAINT fk_DimAuthor FOREIGN KEY([authorSk]) REFERENCES [dbo].[DimAuthor]([authorSk]),
	CONSTRAINT fk_DimPublisher FOREIGN KEY([publisherSk]) REFERENCES [dbo].[DimPublisher]([publisherSk]),
	CONSTRAINT fk_DimDate_orderDate FOREIGN KEY([orderDateKey]) REFERENCES [dbo].[DimDate] ([dateKey]),
	CONSTRAINT fk_DimDate_statusDate FOREIGN KEY([statusDateKey]) REFERENCES [dbo].[DimDate] ([dateKey])
)
GO
