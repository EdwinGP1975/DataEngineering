CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN

	UPDATE db
	SET 
         [firstName]		= sb.[firstName]
        ,[lastName]			= sb.[lastName]
        ,[email]			= sb.[email]
	FROM [dbo].[DimCustomer] db
	INNER JOIN [staging].[Customer] sb ON (db.[customerSk]=sb.[customerSk])
END
GO
