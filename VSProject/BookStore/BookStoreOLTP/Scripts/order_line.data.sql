PRINT 'Populating order_line table';
SET NOCOUNT ON;

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
SELECT top 200
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();


/*#Add a line for all orders*/
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn;



/*#Add a line for some orders*/
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 4000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

/*
 2000
 1000
 300
 500
 50

 */

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 2000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 1000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 300
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 500
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();


WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 50
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 450 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 13 AND ol.price < 16
ORDER BY ol.order_id, ol.book_id;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 50 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 18 AND ol.price < 22
ORDER BY ol.order_id;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 150 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 19 AND ol.price < 21
ORDER BY ol.price;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 50 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 17 AND ol.price < 19
ORDER BY ol.order_id DESC; 
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 50 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 20
ORDER BY ol.price DESC;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 250 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 19 AND ol.price < 22
ORDER BY ol.price DESC;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 150 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 4 AND ol.price < 7
ORDER BY ol.book_id;
GO

INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 150 ol.order_id, ol.book_id, ol.price
FROM dbo.order_line ol
WHERE ol.price > 7 AND ol.price < 11
ORDER BY ol.book_id DESC;
GO