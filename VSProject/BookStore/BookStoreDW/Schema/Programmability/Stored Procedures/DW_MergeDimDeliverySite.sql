CREATE PROCEDURE [dbo].[DW_MergeDimDeliverySite]
AS
BEGIN
	UPDATE ds
	SET [streetNumber] = sds.[streetNumber]
      ,[streetName] = sds.[streetName]
      ,[city] = sds.[city]
      ,[countryName] = sds.[countryName]
      ,[addressStatus] = sds.[addressStatus]
	FROM [dbo].[DimDeliverySite] ds 
		JOIN [staging].[deliverySite] sds ON sds.deliverySiteSk = ds.deliverySiteSk
END
GO
