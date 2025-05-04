CREATE TABLE [staging].[Customer]
(
	[customerSk] [int] IDENTITY(1,1) NOT NULL,
	[firstName] VARCHAR(200) NULL, 
	[lastName] VARCHAR(200) NULL, 
	[email] VARCHAR(350) NULL,
)
