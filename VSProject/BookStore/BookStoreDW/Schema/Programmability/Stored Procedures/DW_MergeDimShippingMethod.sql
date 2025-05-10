CREATE PROCEDURE [dbo].[DW_MergeDimShippingMethod]
AS
BEGIN

	UPDATE db
	SET 
         [methodName] = sau.[methodName]
	FROM [dbo].[DimShippingMethod] db
	INNER JOIN [staging].[shippingMethod] sau ON (db.[shippingMethodSk]=sau.[shippingMethodSk])
END