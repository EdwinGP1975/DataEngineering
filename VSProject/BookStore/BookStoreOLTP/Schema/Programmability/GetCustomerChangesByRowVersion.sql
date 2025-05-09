CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
 SELECT bk.[customer_id]
        ,bk.[first_name]
        ,bk.[last_name]
        ,bk.[email]    
   FROM [BookStore].[dbo].[customer] bk
   WHERE (bk.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bk.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO