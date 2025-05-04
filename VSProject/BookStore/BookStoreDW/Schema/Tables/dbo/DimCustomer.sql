CREATE TABLE [dbo].[DimCustomer]
(
	[customerSk] INT NOT NULL IDENTITY(1,1),
	[customerId] INT NOT NULL,
	[firstName] VARCHAR(200) NULL, 
	[lastName] VARCHAR(200) NULL, 
	[email] VARCHAR(350) NULL,
	CONSTRAINT pk_DimCustomer PRIMARY KEY ([customerSk])
)
