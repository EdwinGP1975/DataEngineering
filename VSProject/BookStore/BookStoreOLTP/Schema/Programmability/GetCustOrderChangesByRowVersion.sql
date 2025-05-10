CREATE PROCEDURE [dbo].[GetCustOrderChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT co.[order_id]
	  ,ol.[line_id]
	  ,oh.[history_id]
	  ,os.[status_id]
	  ,orderDateKey = CONVERT(INT,
						(CONVERT(CHAR(4),DATEPART(YEAR,co.[order_date]))
					  + CASE 
							WHEN DATEPART(MONTH,co.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,co.[order_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(MONTH,co.[order_date]))
						END
					  + CASE 
							WHEN DATEPART(DAY,co.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,co.[order_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(DAY,co.[order_date]))
						END))
	  ,statusDateKey = CONVERT(INT,
						(CONVERT(CHAR(4),DATEPART(YEAR,oh.[status_date]))
					  + CASE 
							WHEN DATEPART(MONTH,oh.[status_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,oh.[status_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(MONTH,oh.[status_date]))
						END
					  + CASE 
							WHEN DATEPART(DAY,oh.[status_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,oh.[status_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(DAY,oh.[status_date]))
						END))
	  ,ol.[book_id]
	  ,co.[customer_id]
	  ,co.[shipping_method_id]
	  ,co.[dest_address_id]
	  ,ba.author_id
	  ,b.publisher_id
	  ,ol.[price]
	  ,co.[order_date]
	  ,oh.[status_date]
	  ,os.[status_value]
	FROM [dbo].[cust_order] co
		JOIN [dbo].[order_line] ol ON ol.order_id = co.order_id
		JOIN [dbo].[order_history] oh ON oh.order_id = co.order_id
		JOIN [dbo].[order_status] os ON os.status_id = oh.status_id
		JOIN [dbo].[book_author] ba ON ba.book_id = ol.book_id
		JOIN [dbo].[book] b ON b.book_id = ol.book_id
	WHERE (co.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND co.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (ol.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND ol.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (oh.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND oh.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (os.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND os.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (ba.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND ba.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (b.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND b.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
