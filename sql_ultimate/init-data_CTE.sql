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
-- 4 STEP -- Segment customers based on their total sales

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
-- 4 STEP -- Segment customers based on their total sales (Nested CTE)
, CTE_customer_segment AS(
SELECT
customerid,
total_sales,
CASE 
WHEN total_sales > 100 THEN 'High'
WHEN total_sales > 80 THEN 'Medium'
ELSE 'Low'
END AS customer_segment
FROM CTE_total_sales
)

-- Main query
SELECT 
c.customerid,
c.firstname,
c.lastname,
cts.total_sales,
clo.last_order,
srank. customer_rank,
cseg.customer_segment
FROM sales.customers AS c
LEFT JOIN CTE_total_sales AS cts
ON cts.customerid = c.customerid
LEFT JOIN CTE_last_order AS clo
ON clo.customerid = c.customerid
LEFT JOIN CTE_sales_rank AS srank
ON srank.customerid = c.customerid
LEFT JOIN CTE_customer_segment AS cseg
ON cseg.customerid = c.customerid
ORDER BY customerid;

-- CTE Recursive
-- Generate a sequence of number from 1 to 20

WITH RECURSIVE CTE_series AS(
-- Anchor query
 SELECT 
 1 AS mynumber
 UNION ALL 
 -- Recursive query
 SELECT
 mynumber + 1
 FROM CTE_series
 WHERE mynumber < 20
)
-- Main query
SELECT *
FROM CTE_series

-- Task -- Show the employee hierarchy by displaying each employee's level within the orgazination
WITH RECURSIVE CTE_emp_hierarch AS (
-- Anchor query
SELECT
employeeid,
Managerid,
1 AS level
FROM sales.employees
WHERE managerid IS NULL
UNION ALL
-- Recursive query
SELECT
e.employeeid,
e.Managerid,
level + 1
FROM sales.employees AS e
INNER JOIN CTE_emp_hierarch AS ceh
ON e.managerid = ceh.managerid
)

-- Main query
SELECT*
FROM CTE_emp_hierarch;


