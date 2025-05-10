PRINT 'Populating address_status table';
SET NOCOUNT ON;

SET IDENTITY_INSERT address_status ON; 

INSERT INTO address_status (status_id, address_status) VALUES
(1, 'Active'),
(2, 'Inactive');

SET IDENTITY_INSERT address_status OFF; 