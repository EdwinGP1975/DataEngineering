CREATE PROCEDURE [dbo].[DW_MergeDimAuthor]
AS
BEGIN

	UPDATE db
	SET 
         [authorName] = sau.[authorName]
	FROM [dbo].[DimAuthor] db
	INNER JOIN [staging].[author] sau ON (db.[authorSk]=sau.[authorSk])
END
