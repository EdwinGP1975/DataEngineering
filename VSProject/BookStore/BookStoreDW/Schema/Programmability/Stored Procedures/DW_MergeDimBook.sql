CREATE PROCEDURE [dbo].[DW_MergeDimBook]
AS
BEGIN

	UPDATE db
	SET 
         [title]			= sb.[title]
        ,[isbn13]			= sb.[isbn13]
        ,[numPages]			= sb.[numPages]
        ,[publicationDate]	= sb.[publicationDate]
        ,[languageName]		= sb.[languageName]
	FROM [dbo].[DimBook] db
	INNER JOIN [staging].[Book] sb ON (db.[bookSk]=sb.[bookSk])
END
GO
