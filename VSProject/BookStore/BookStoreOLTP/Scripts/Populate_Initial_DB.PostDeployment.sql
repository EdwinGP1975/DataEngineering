/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

:r .\author.data.sql
:r .\publisher.data.sql
:r .\book_language.data.sql
:r .\shipping_method.data.sql
:r .\address_status.data.sql
:r .\order_status.data.sql
:r .\book.data.sql
:r .\book_author.data.sql
:r .\country.data.sql
:r .\address.data.sql
:r .\customer.data.sql
:r .\customer_address.data.sql
:r .\cust_order.data.sql
:r .\order_line.data.sql
:r .\order_history.data.sql