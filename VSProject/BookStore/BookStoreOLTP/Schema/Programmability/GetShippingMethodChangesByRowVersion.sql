CREATE PROCEDURE [dbo].[GetShippingMethodChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
 SELECT bk.[method_id]
        ,bk.[method_name]
		,bk.[cost]
        ,bk.[rowversion]
   FROM [dbo].[shipping_method] bk
   WHERE (bk.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bk.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END