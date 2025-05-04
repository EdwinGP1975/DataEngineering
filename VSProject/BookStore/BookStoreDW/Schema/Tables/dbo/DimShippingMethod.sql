CREATE TABLE [dbo].[DimShippingMethod]
(
	[shippingMethodSk] [int] IDENTITY(1,1) NOT NULL,
	[shippingMethodId] [int] NOT NULL,
	[methodName] [varchar](100) NULL,
	[cost] [decimal](6, 2) NULL,
	CONSTRAINT [pk_ShippingMethod] PRIMARY KEY ([shippingMethodSk])
)
