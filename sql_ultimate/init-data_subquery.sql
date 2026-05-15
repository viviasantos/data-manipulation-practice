-- #3 Advanced SQL techniques
-- SUBQUERIES

-- *
SELECT
DISTINCT table_schema
FROM information_schema.tables;

SELECT *
FROM pg_database;

SELECT schemaname, tablename
FROM pg_catalog.pg_tables
WHERE schemaname LIKE 'pg_temp%';

-- Results types
-- SCALAR SUBQUERY -- JUST RETURN ONE VALUE
SELECT
AVG(sales)
FROM sales.orders;


-- ROW SBQUERY -- RETURN MULTIPLE ROWS & SINGLE COLUMN
SELECT
customerid
FROM sales.orders;

-- TABLE SUBQUERY -- RETURN MULTIPLE ROWS & MULTIPLE COLUMN 
SELECT *
FROM sales.orders;

-- Subquery in FROM clause
-- Exercise --  Find the products tha have a price higher than the average price of all products

-- Main query
SELECT*
FROM (
	-- Subquery
	SELECT 
	price,
	ROUND(AVG(price) OVER(),2) AS avg_price
	FROM sales.products
	)t
WHERE price > avg_price;


-- Exercise -- Rank customers based on their total amount of sales
SELECT
customerid,
total_sales,
RANK() OVER(ORDER BY total_sales DESC) AS customer_rank
FROM(
SELECT
customerid,
SUM(sales) AS total_sales
FROM sales.orders
GROUP BY customerid
)t;

-- Subquery in SELECT clause
-- Exercise -- Show the product IDs, names, prices and total number of orders
-- Main query
SELECT
productid,
product,
price,
-- Subquery
(SELECT COUNT(orderid) FROM sales.orders) AS total_orders
FROM sales.products;


-- JOIN subquery
-- Show all customer detail and find the total orders for each customer

-- Main query
SELECT
c.*,
o.total_orders
FROM sales.customers AS c
LEFT JOIN(
-- Subquery
	SELECT 
	customerid,
	COUNT(*) AS total_orders
	FROM sales.orders
	GROUP BY customerid)o
	ON c.customerid= o.customerid;

-- Subquery WHERE clause - Comparison operator
-- Exercise -- Find the products that have a price higher than the average price of all products

SELECT
products,
price
FROM sales.products
WHERE price > (
SELECT
ROUND(AVG(price),2) AS avg_price FROM sales.products
);


-- Subquery Where clause (In)  
-- Exercise -- Show the details of orders made by customers in Germany
-- Main query
SELECT 
    customerid,
    productid,
    orderstatus
FROM sales.orders
WHERE customerid IN 
-- Subquery
(SELECT 
        customerid
    FROM sales.customers
	WHERE country = 'Germany');

-- Exercise -- Show the details of orders for customers who are not from Germany
-- Main query
SELECT 
customerid,
productid,
orderstatus
FROM sales.orders
WHERE customerid NOT IN (
-- Subquery
SELECT
customerid
FROM sales.customers
WHERE country <> 'Germany');

-- Subquery Any 
-- Exercise -- female employees whose salaries are greater than the salaries of any male employees

-- Main query
SELECT
employeeid,
salary
FROM sales.employees
WHERE gender = 'F'
AND salary > ANY (
--Subquery
SELECT salary FROM sales.employees WHERE gender = 'M');

-- Subquery ALL 
SELECT
employeeid,
salary
FROM sales.employees
WHERE gender = 'F'
AND salary > ALL (
--Subquery
SELECT salary FROM sales.employees WHERE gender = 'M');



-- Correlated and Non correlated query
-- Exercise -- Show all customer details and find the total orders for each customer -- Non corretaled
-- Main query
SELECT
*,
-- Subquery
(SELECT COUNT(orderid) FROM sales.orders AS o WHERE o.customerid = c.customerid) AS total_sales 
FROM sales.customers AS c;



-- Exist operator
-- Exercise -- Show the order details for customers in Germany
-- Main query
SELECT*
FROM sales.orders AS o
WHERE EXISTS
	-- Subquery
	(SELECT * FROM sales.customers AS c WHERE country= 'Germany' AND o.customerid = c.customerid);

-- NOT EXISTS
	SELECT*
FROM sales.orders AS o
WHERE NOT EXISTS
	-- Subquery
	(SELECT * FROM sales.customers AS c WHERE country= 'Germany' AND o.customerid = c.customerid);




