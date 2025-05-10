CREATE PROCEDURE [dbo].[GetPublisherChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
 SELECT pb.[publisher_id],
        pb.[publisher_name]
        ,bk.[title]
        ,bk.[publication_date]
        ,pb.[rowversion]
   FROM [dbo].[publisher] pb
   inner join [dbo].[book] bk on pb.publisher_id=bk.publisher_id
   WHERE (pb.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND pb.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR
	     (bk.[rowversion] > CONVERT(ROWVERSION,@startRow) 
          AND bk.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END
GO