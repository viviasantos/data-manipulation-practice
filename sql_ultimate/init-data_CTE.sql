-- CTE -- Common Table Expression
-- RECURSIVE AND NON RECURSIVE
-- STEP1 -- Find the total sales for customer

WITH CTE_total_sales (
SELECT
customerid,
SUM(sales) AS total_sales
FROM sales.orders
GROUP BY customerid
)
-- Main query
SELECT 
c.customerid,
c.firstname,
c.lastname,
cts.total_sales
FROM sales.customers AS c
LEFT JOIN CTE_total_sales AS cts
ON cts.customerid = c.customerid
ORDER BY customerid;

-- Multiple Standalone CTE
-- Exercise
-- 1 STEP -- Find the total sales per customer
-- 2 STEP -- Find the last order date per customer
-- 3 STEP -- Rank Customers based on total sales per customer


-- 1 STEP -- Find the total sales per customer
WITH CTE_total_sales AS (
SELECT
customerid,
SUM(sales) AS total_sales
FROM sales.orders
GROUP BY customerid
)
-- 2 STEP -- Find the last order date per customer
, CTE_last_order AS (
SELECT
customerid,
MAX(orderdate) AS last_order
FROM sales.orders
GROUP BY customerid
)
-- Nested CTE -- CTE inside another CTE
-- 3 STEP -- Rank Customers based on total sales per customer
, CTE_sales_rank AS (
SELECT
customerid,
total_sales,
RANK() OVER(ORDER BY total_sales DESC) AS customer_rank
FROM CTE_total_sales
)

-- Main query
SELECT 
c.customerid,
c.firstname,
c.lastname,
cts.total_sales,
clo.last_order,
srank. customer_rank
FROM sales.customers AS c
LEFT JOIN CTE_total_sales AS cts
ON cts.customerid = c.customerid
LEFT JOIN CTE_last_order AS clo
ON clo.customerid = c.customerid
LEFT JOIN CTE_sales_rank AS srank
ON srank.customerid = c.customerid
ORDER BY customerid;


