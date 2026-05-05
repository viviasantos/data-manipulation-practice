-- AGGREGATE FUNCTIONS
-- COUNT, SUM, AVG, MAX, MIN, WINDOW

-- Exercise: 
-- Find the total numbers of orders
-- Find the total sales of all orders
-- Find the average sales of all orders
-- Find the highest score among customers
SELECT 
COUNT(orderid) AS total_orders,
SUM(sales) AS total_sales,
ROUND(AVG(sales),2) AS avg_sales
FROM sales.orders;

-- Find the highest score among customers
-- Find the lowest score among customers
SELECT
MAX(score) AS highest_score,
MIN(score) AS lowest_score
FROM sales.customers;

-- WINDOW FUNCTIONS
-- ROW_NUMBER, RANK(), DENSE_RANK, CUME_DIST,PERCENT_RANK,NTILE,LEAD,LAG,FIRST_VALUE

-- Exercise - Find the total sales Accross all orders
SELECT SUM(sales) AS total_sales
FROM sales.orders;


-- Exercise - Find the total sales for each product
SELECT productid,
SUM(sales) AS total_sales
FROM sales.orders
GROUP BY productid;

-- Exercise - Find the total sales for each product 
-- additionally provide details such order id & order date
SELECT 
productid,
orderid,
orderdate,
SUM(sales) AS total_sales
FROM sales.orders
GROUP BY 
productid,
orderid,
orderdate;


-- CORRECT
SELECT 
orderid,
orderdate,
productid,
SUM(sales) OVER(PARTITION BY productid) AS total_sales_products
FROM sales.orders
ORDER BY orderid;










