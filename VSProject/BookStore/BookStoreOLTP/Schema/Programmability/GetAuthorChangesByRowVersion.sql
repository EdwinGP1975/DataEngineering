CREATE PROCEDURE [dbo].[GetAuthorChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
 SELECT bk.[author_id]
        ,bk.[author_name]
        ,bk.[rowversion]
   FROM [dbo].[author] bk
   WHERE (bk.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bk.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END