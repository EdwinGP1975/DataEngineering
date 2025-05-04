CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
  AS
  BEGIN
	SELECT lastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE tableName = @tableName;
  END
GO
