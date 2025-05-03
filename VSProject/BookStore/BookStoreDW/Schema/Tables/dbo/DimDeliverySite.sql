CREATE TABLE [dbo].[DimDeliverySite]
(
	[deliverySiteSk] INT IDENTITY(1,1) NOT NULL,
    [addressId] INT NOT NULL,
	[streetNumber] VARCHAR(10),
    [streetName] VARCHAR(200),
    [city] VARCHAR(100),
    [countryName] VARCHAR(200),
    [addressStatus] VARCHAR(30),
	CONSTRAINT pk_Address PRIMARY KEY ([deliverySiteSk])
)
GO
