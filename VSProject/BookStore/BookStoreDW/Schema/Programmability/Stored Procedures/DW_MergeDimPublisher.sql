CREATE PROCEDURE [dbo].[DW_MergeDimPublisher]
AS
BEGIN

	UPDATE dp
	SET 
         [publisherName]	= sp.[publisherName]
        ,[title]			= sp.[title]
        ,[publicationDate]	= sp.[publicationDate]
	FROM [dbo].[DimPublisher] dp
	INNER JOIN [staging].[Publisher] sp ON (dp.[publisherSK]=sp.[publisherSK])
END
GO
