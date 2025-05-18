CREATE PROCEDURE [dbo].[DW_MergeFactCustOrder]
AS
BEGIN
	UPDATE fco
	SET [orderDateKey] = co.[orderDateKey],
		[statusDateKey] = co.[statusDateKey],
		[bookSk] = co.[bookSk],
		[customerSk] = co.[customerSk],
		[destDeliverySiteSk] = co.[destDeliverySiteSk],
		[shippingMethodSk] = co.[shippingMethodSk],
		[publisherSk] = co.[publisherSk],
		[price] = co.[price],
		[quantity] = co.[quantity],
		[orderDate] = co.[orderDate],
		[lastStatusId] = co.[lastStatusId],
		[lastStatusDate] = co.[lastStatusDate],
		[lastOrderStatus] = co.[lastOrderStatus]
	FROM [dbo].[FactCustOrder] fco
		JOIN [staging].[custOrder] co ON (
				co.[orderId] =fco.[orderId] 
			AND co.[lineId] = fco.[lineId] 
			AND co.[historyId] = fco.[historyId])
END
GO
