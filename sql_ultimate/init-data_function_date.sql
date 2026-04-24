SELECT current_database();


-- DATE TIME FUNCTION - TIMESTAMP
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

-- GET DATE - Return the current date
SELECT*
FROM sales.orders;

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














