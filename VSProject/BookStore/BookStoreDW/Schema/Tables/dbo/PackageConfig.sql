CREATE TABLE [dbo].[PackageConfig]
(
	[packageId] [int] IDENTITY(1,1) NOT NULL CONSTRAINT pk_PackageConfig PRIMARY KEY,
	[tableName] [varchar](50) NOT NULL,
	[lastRowVersion] [bigint] NULL
)
GO
