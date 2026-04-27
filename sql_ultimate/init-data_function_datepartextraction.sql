-- -- DATE TIME FUNCTION - TIMESTAMP -- PART EXTRACTION (DAY, MONTH, YEAR, EXTRACT, DATE_TRUNC, TO_CHAR)

SELECT current_database();


SELECT orderID, OrderDate, ShipDate, CreationTime
FROM Sales.orders;

SELECT
    orderID,
    CreationTime,
    '2025-08-20' AS hardcoded_date,
    '2025-08-20 00:00:00' AS hardcoded_timestamp,
	 CURRENT_DATE AS current_date
FROM sales.orders;

-- GET DATE - Return the current date
SELECT CURRENT_DATE;


-- EXTRACTION DATE
-- EXTRACTION YEAR, MONTH, DAY
SELECT orderdate,
EXTRACT(YEAR FROM orderdate) AS year_extract,
EXTRACT(MONTH FROM orderdate) As month_extract,
EXTRACT(DAY FROM orderdate) AS day_extract
FROM sales.orders

-- EXTRACTION WEEK, QUARTER... DATEPART
SELECT orderdate,
EXTRACT(WEEK FROM orderdate) AS week,
EXTRACT(QUARTER FROM orderdate) AS quarter
FROM sales.orders;

-- THE NAME OF THE PARTS - TO_CHAR + Argument
SELECT 
    creationtime,
    TO_CHAR(creationtime, 'Day') AS day_name,
    TO_CHAR(creationtime, 'YYYY') AS year,
    TO_CHAR(creationtime, 'Month') AS month,
    TO_CHAR(creationtime, 'HH24:MI:SS') AS time_hms
FROM sales.orders;


-- DATE_TRUNC - truncates (cuts) a timestamp to a specified precision and sets smaller units to zero.

SELECT
    creationtime,
    DATE_TRUNC('day', creationtime)   AS trunc_day,
    DATE_TRUNC('month', creationtime) AS trunc_month,
	DATE_TRUNC('year', creationtime) AS trunc_year,
    DATE_TRUNC('hour', creationtime)  AS trunc_hour,
    DATE_TRUNC('minute', creationtime) AS trunc_minute,
	DATE_TRUNC('second', creationtime) AS trunc_second
FROM sales.orders;


SELECT 
    orderid,
    creationTime,
    (DATE_TRUNC('month', CreationTime) + INTERVAL '1 month - 1 day')::date AS EndOfMonth,
    DATE_TRUNC('month', CreationTime)::date AS StartOfMonth
FROM sales.orders;


-- Exercise-- How many prders were placed each year, month

SELECT 
EXTRACT(YEAR FROM orderdate) AS year_order,
COUNT(orderid) AS count_order
FROM sales.orders
GROUP BY year_order;

SELECT 
TO_CHAR(orderdate, 'month') AS month_date,
COUNT(orderid) AS count_order
FROM sales.orders
GROUP BY month_date;

SELECT 
DATE_TRUNC('YEAR', orderdate) AS year_order,
COUNT(orderid) AS count_order
FROM sales.orders
GROUP BY year_order;

-- Show all orders that were placed during the month of February
SELECT 
    TO_CHAR(orderdate, 'Month') AS month_order,
    COUNT(orderid) AS total_order
FROM sales.orders
WHERE EXTRACT(MONTH FROM orderdate) = 2
GROUP BY TO_CHAR(orderdate, 'Month');



















