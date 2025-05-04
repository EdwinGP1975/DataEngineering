CREATE PROCEDURE [dbo].[DW_MergeFactCustOrder]
AS
BEGIN
	UPDATE fco
	SET [orderDateKey] = co.[orderDateKey]
      ,[statusDateKey] = co.[statusDateKey]
      ,[bookSk] = co.[bookSk]
      ,[customerSk] = co.[customerSk]
      ,[destDeliverySiteSk] = co.[destDeliverySiteSk]
      ,[shippingMethodSk] = co.[shippingMethodSK]
      ,[price] = co.[price]
      ,[orderDate] = co.[orderDate]
      ,[statusDate] = co.[statusDate]
      ,[statusValue] = co.[statusValue]
	FROM [dbo].[FactCustOrder] fco
		JOIN [staging].[custOrder] co ON (co.[orderId] =fco.[orderId] AND co.[lineId] = fco.[lineId] AND co.[historyId] = fco.[historyId] AND co.[statusId] = fco.[statusId])
END
GO
