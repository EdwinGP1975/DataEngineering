CREATE PROCEDURE [dbo].[GetBookChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
 SELECT bk.[book_id]
        ,bk.[title]
        ,bk.[isbn13]
        ,bk.[num_pages]
        ,bk.[publication_date]
        ,bk.[rowversion]
	    ,bl.[language_name]
   FROM [dbo].[book] bk
   inner join [dbo].[book_language] bl on bk.language_id=bl.language_id
   WHERE (bk.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bk.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR
	     (bl.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bl.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END
GO