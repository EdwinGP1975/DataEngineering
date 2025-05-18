PRINT 'Populating order_history table';
SET NOCOUNT ON;

/* Add order received for all orders older than 30 secs
Total 7547 orders*/

INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT
    o.order_id,
    1 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 2), o.order_date) AS status_date
FROM dbo.cust_order o
WHERE o.order_date < DATEADD(ss, -30, GETDATE())
 AND NOT EXISTS (
    SELECT TOP 1 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
        AND oh.status_id = 1
 );
 GO

/*#Add Pending Delivery for most of these orders, within 2 days after the previous step, where orders are older than 2 days
6800 records*/

INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT TOP 6800
    o.order_id,
    2 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 24 * 2), o.order_date) AS status_date
FROM dbo.cust_order o
WHERE o.order_date < DATEADD(dd, -2, GETDATE())
 AND NOT EXISTS (
    SELECT TOP 1 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
        AND oh.status_id = 2
 );
 GO



/*#Add Delivery In Progress for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT TOP 4000
    o.order_id,
    3 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 24 * 2), o.status_date) AS status_date
FROM dbo.order_history o
WHERE o.status_date < DATEADD(dd, -2, GETDATE())
 AND o.status_id = 2
 AND NOT EXISTS (
    SELECT TOP 1 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
        AND oh.status_id = 3
 )
ORDER BY NEWID();
GO

/*#Add Delivered for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT TOP 3500
    o.order_id,
    4 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 24 * 6), o.status_date) AS status_date
FROM dbo.order_history o
WHERE o.status_date < DATEADD(dd, -6, GETDATE())
 AND o.status_id = 2
 AND NOT EXISTS (
    SELECT TOP 1 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
        AND oh.status_id = 4
 )
ORDER BY NEWID();
GO

/*#Add some Cancelled orders*/
INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT TOP 300
    o.order_id,
    5 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 24 * 6), o.status_date) AS status_date
FROM dbo.order_history o
WHERE o.status_id = 1
AND NOT EXISTS (
    SELECT 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
    AND (oh.status_id = 2 OR oh.status_id =5)
)
ORDER BY NEWID();
GO

/*#Add some Returned orders*/
INSERT INTO dbo.order_history (order_id, status_id, status_date)
SELECT TOP 200
    o.order_id,
    6 AS status_id,
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (60 * 60 * 24 * 7), o.status_date) AS status_date
FROM dbo.order_history o
WHERE o.status_date < DATEADD(dd, -7, GETDATE())
 AND o.status_id = 4
 AND NOT EXISTS (
    SELECT TOP 1 1
    FROM dbo.order_history oh
    WHERE oh.order_id = o.order_id
        AND oh.status_id = 6
 )
ORDER BY NEWID();
GO