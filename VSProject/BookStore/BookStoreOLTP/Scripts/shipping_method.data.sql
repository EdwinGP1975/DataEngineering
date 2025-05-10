PRINT 'Populating shipping_method table';

SET NOCOUNT ON;

SET IDENTITY_INSERT shipping_method ON; 

INSERT INTO shipping_method (method_id, method_name, cost) VALUES
(1, 'Standard', 5.9),
(2, 'Priority', 8.9),
(3, 'Express', 11.9),
(4, 'International', 24.5);

SET IDENTITY_INSERT shipping_method OFF; 