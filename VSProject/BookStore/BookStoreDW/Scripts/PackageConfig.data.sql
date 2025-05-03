IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[PackageConfig]
			  WHERE [tableName] = 'DeliverySite')
 BEGIN
	INSERT [dbo].[PackageConfig] ([tableName], [lastRowVersion]) VALUES ('DeliverySite', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[PackageConfig]
			  WHERE [tableName] = 'Book')
 BEGIN
	INSERT [dbo].[PackageConfig] ([tableName], [lastRowVersion]) VALUES ('Book', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[PackageConfig]
			  WHERE [tableName] = 'Customer')
 BEGIN
  INSERT [dbo].[PackageConfig] ([tableName], [lastRowVersion]) VALUES ('Customer', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[PackageConfig]
			  WHERE [tableName] = 'CustOrder')
 BEGIN
	INSERT [dbo].[PackageConfig] ([tableName], [lastRowVersion]) VALUES ('CustOrder', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[PackageConfig]
			  WHERE [tableName] = 'ShippingMethod')
 BEGIN
	INSERT [dbo].[PackageConfig] ([tableName], [lastRowVersion]) VALUES ('ShippingMethod', 0)
 END
GO
