CREATE PROCEDURE [dbo].[GetDeliverySiteChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT a.[address_id]
      ,a.[street_number]
      ,a.[street_name]
      ,a.[city]
	  ,c.[country_name]
	  ,addst.[address_status]
	FROM [dbo].[address] a
		JOIN [dbo].[country] c ON c.country_id = a.country_id
		JOIN [dbo].[customer_address] ca ON ca.address_id = a.address_id
		JOIN [dbo].[address_status] addst ON addst.status_id = ca.status_id
	WHERE (a.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND a.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (c.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND c.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (ca.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND ca.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (addst.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND addst.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
