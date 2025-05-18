CREATE PROCEDURE [dbo].[GetCustOrderChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	;WITH lastHistoryStatus 
	  AS(SELECT oh.order_id, oh.history_id, oh.status_date, oh.status_id, os.status_value
		 FROM dbo.order_history oh
			JOIN dbo.order_status os ON os.status_id = oh.status_id
		 WHERE oh.status_id = (SELECT MAX(oh2.status_id)
							   FROM dbo.order_history oh2
							   WHERE oh2.order_id=oh.order_id)
			AND (
				  (oh.[rowversion] > CONVERT(ROWVERSION,@startRow)
					AND oh.[rowversion] <= CONVERT(ROWVERSION,@endRow))
				  OR (os.[rowversion] > CONVERT(ROWVERSION,@startRow)
					AND os.[rowversion] <= CONVERT(ROWVERSION,@endRow))
			
			)
		 GROUP BY oh.order_id, oh.history_id, oh.status_date, oh.status_id, os.status_value
		 --ORDER BY oh.order_id
		 )

	SELECT co.[order_id]
	  ,ol.[line_id]
	  ,lhs.[history_id]
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
						(CONVERT(CHAR(4),DATEPART(YEAR,lhs.status_date))
					  + CASE 
							WHEN DATEPART(MONTH,lhs.status_date) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,lhs.status_date))
							ELSE + CONVERT(CHAR(2),DATEPART(MONTH,lhs.status_date))
						END
					  + CASE 
							WHEN DATEPART(DAY,lhs.status_date) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,lhs.status_date))
							ELSE + CONVERT(CHAR(2),DATEPART(DAY,lhs.status_date))
						END))
	  ,ol.[book_id]
	  ,co.[customer_id]
	  ,co.[shipping_method_id]
	  ,co.[dest_address_id]
	  ,b.publisher_id
	  ,ol.[price]
	  ,quantity= COUNT(ol.book_id)
	  ,co.[order_date]
	  ,lastStatusId = lhs.status_id
	  ,lastOrderStatus = lhs.status_value
	  ,lastStatusDate = lhs.status_date
	FROM [dbo].[cust_order] co
		JOIN [dbo].[order_line] ol ON ol.order_id = co.order_id
		JOIN [dbo].[book] b ON b.book_id = ol.book_id
		join lastHistoryStatus lhs on lhs.order_id = ol.order_id
	WHERE (co.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND co.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (ol.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND ol.[rowversion] <= CONVERT(ROWVERSION,@endRow))
		OR (b.[rowversion] > CONVERT(ROWVERSION,@startRow)
			AND b.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	GROUP BY co.[order_id]
	  ,ol.[line_id]
	  ,lhs.[history_id]	
	  ,ol.[book_id]
	  ,co.[customer_id]
	  ,co.[shipping_method_id]
	  ,co.[dest_address_id]
	  ,b.publisher_id
	  ,ol.[price]
	  ,co.[order_date]
	  ,lhs.status_id
	  ,lhs.status_value
	  ,lhs.status_date
	ORDER BY co.order_id, ol.book_id
END
GO
