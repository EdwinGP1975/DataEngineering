PRINT 'Populating order_status table';

SET NOCOUNT ON;

SET IDENTITY_INSERT order_status ON; 

INSERT INTO order_status (status_id, status_value) VALUES
(1, 'Order Received'),
(2, 'Pending Delivery'),
(3, 'Delivery In Progress'),
(4, 'Delivered'),
(5, 'Cancelled'),
(6, 'Returned');

SET IDENTITY_INSERT order_status OFF; 