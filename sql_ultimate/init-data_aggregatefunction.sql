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
sales,
SUM(sales) OVER(PARTITION BY productid) AS total_sales_products
FROM sales.orders
ORDER BY productid;


-- Exercise -- Find the total sales across all orders 
-- addionally provide details such order id & order date
SELECT 
orderid,
orderdate,
SUM(sales) OVER() AS total_orders
FROM sales.orders;


-- Exercise -- Find the total sales for each product 
-- addionally provide details such order id & order date
SELECT 
orderid,
orderdate,
productid,
SUM(sales) OVER(PARTITION BY productid) AS total_sales_products
FROM sales.orders;


-- Exercise -- Find the total sales for each product and products
-- addionally provide details such order id & order date
SELECT 
orderid,
orderdate,
productid,
sales,
SUM(sales) OVER() AS total_orders,
SUM(sales) OVER(PARTITION BY productid) AS total_sales_products
FROM sales.orders;

-- Find the total sales for each combination of product and order status
SELECT
  sales,
  orderstatus,
  SUM(sales) OVER (PARTITION BY productid, orderstatus) AS total_sales
FROM sales.orders;

-- Exercise -- Calculate the moving average of sales for each product over time
SELECT
orderid,
sales,
productid,
orderdate,
ROUND(AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate),2) AS moving_average,
ROUND(AVG(sales) OVER(PARTITION BY productid,2)) AS avgby_average
FROM sales.orders;

-- Exercise -- Calculate the moving average of sales for each product over time, including only the next order
SELECT
orderid,
sales,
productid,
orderdate,
ROUND(AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING),2) AS rolling_avg
FROM sales.orders;

-- ORDER BY
-- Rank each order based on their sales from highest to lowest,
-- additionally provide details such orderid and orderdate

SELECT
orderid,
orderdate,
sales,
RANK() OVER(ORDER BY sales DESC) AS ranksales
FROM sales. orders;

-- ROWS BETWEEN CURRENT ROW AND FOLLOWING - Defines a subset of rows within each window
SELECT 
orderid,
orderdate,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY orderstatus ORDER BY orderdate
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS total_sales
FROM sales.orders;

-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
SELECT 
orderid,
orderdate,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY orderstatus ORDER BY orderdate
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS total_sales
FROM sales.orders;

-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
SELECT 
orderid,
orderdate,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY orderstatus ORDER BY orderdate
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_sales
FROM sales.orders;


-- RANK DATA USING WINDOW FUNCTION

-- RANK DATA -- ROW NUMBER 
-- Exercise -- Rank the orders based on their sales from highest to lowest
SELECT
orderid,
sales,
ROW_NUMBER() OVER(ORDER BY sales DESC) AS row_numberfunction
FROM sales.orders;


-- RANK 
SELECT
orderid,
sales,
RANK() OVER(ORDER BY sales DESC) AS rank_function
FROM sales.orders;


-- DENSE_RANK
SELECT
orderid,
sales,
DENSE_RANK() OVER(ORDER BY sales DESC) denserank_function
FROM sales. orders;

-- Exercise -- Find the top highest sales for each product
SELECT *
FROM(

SELECT
orderid,
productid,
sales,
ROW_NUMBER() OVER(PARTITION BY productid ORDER BY sales DESC) AS rankby_product
FROM sales.orders
)t WHERE rankby_product = 1

-- Exercise -- Find the lowest 2 customers based on their total sales
SELECT*
FROM(

SELECT
customerid,
SUM(sales) AS total_sales,
ROW_NUMBER() OVER(ORDER BY SUM(sales)) AS rank_customer
FROM sales.orders
GROUP BY customerid
) t WHERE rank_customer <= 2;

-- Exercise -- Assign unique IDs to the rows of the'Orders Archive' table
SELECT
ROW_NUMBER() OVER(ORDER BY orderid, orderdate) AS uniqueid,
*
FROM sales.ordersarchive;


-- Identify duplicates
-- Exercise -- Identify rows in the table 'Orders Archive' and return a clean result wothout any duplicates
SELECT *
FROM(
SELECT 
ROW_NUMBER() OVER (PARTITION BY orderid ORDER BY creationtime DESC) rn,
*
FROM sales.ordersarchive
)t WHERE rn = 1;

-- NTILE
-- Divides the tows into a specified number of approximately equal groups (buckets)

SELECT
orderid,
sales,
NTILE(1) OVER(ORDER BY sales DESC) AS onebucket,
NTILE(2) OVER (ORDER BY sales DESC) AS twobuckets,
NTILE(3) OVER (ORDER BY sales DESC) AS threebuckets,
NTILE(4) OVER (ORDER BY sales DESC) AS fourbuckets
FROM sales.orders;

-- Exercise -- Segment all orders into 3 categories: high, medium and low sales
SELECT 
orderid,
sales,
CASE buckets
WHEN 1 THEN 'high'
WHEN 2 THEN 'medium'
WHEN 3 THEN 'low'
END AS sales_category
FROM (
SELECT
orderid,
sales,
NTILE(3) OVER(ORDER BY sales DESC) AS buckets
FROM sales.orders
)t;

-- Exercise -- In order to export the data, divide the orders into 2 groups
SELECT
NTILE(2) OVER(ORDER BY orderid) AS buckets,
*
FROM sales.orders;

-- CUME_DIST AND PERCENT_RANK -- Percentage based in Rank functions
-- Exercise -- Find the products that fall within the highest 40% of the prices
SELECT*,
CONCAT(distrank *100, '%')distrank_percent
FROM(

SELECT
product,
price,
CUME_DIST() OVER (ORDER BY price DESC) AS distrank
FROM sales.products
)t WHERE distrank <= 0.4;


SELECT*,
CONCAT(percentrank *100, '%')percentrank_percent
FROM(

SELECT
product,
price,
PERCENT_RANK() OVER (ORDER BY price DESC) AS percentrank
FROM sales.products
)t WHERE percentrank <= 0.4;

-- Access a value from other row -- FIRST_VALUE -- LAST_VALUE -- LEAD -- LAG 

-- lEAD Function -- Access value from the next row within a window
-- LAG Function -- Access value from the previous row within a window

-- Exercise --Analyse the month over month(Mom) performance by finding the percentage change in sales between the current and previous month
SELECT*,
current_sales - previous_sales AS Mom_Change,
ROUND(CAST((current_sales - previous_sales) AS NUMERIC)/previous_sales *100,2) AS mom_perc
FROM(
SELECT
SUM(sales) AS current_sales,
EXTRACT(MONTH FROM orderdate) AS OrderMonth,
LAG(SUM(sales)) OVER (ORDER BY EXTRACT(MONTH FROM orderdate) ) AS previous_sales
FROM sales.orders
GROUP BY EXTRACT(MONTH FROM orderdate)
)t;

-- In order to analyze customer loyalty
-- Rank customers based on the average days between their orders
SELECT
customerid,
ROUND(AVG(days_between_orders),0) AS avg_between_orders,
RANK() OVER(ORDER BY COALESCE(AVG(days_between_orders)),99999) as rank_avg
FROM(

SELECT 
orderid,
customerid,
orderdate AS current_order,
LEAD(orderdate) OVER(PARTITION BY customerid ORDER BY orderdate) AS next_order,
LEAD(orderdate) OVER(PARTITION BY customerid ORDER BY orderdate) - orderdate AS days_between_orders
FROM sales.orders
)t GROUP BY customerid;

-- First and last value function
-- Find the lowest and highest sales for each product

SELECT
orderid,
productid,
sales,
FIRST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales) AS lowest_sales,
LAST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS highest_sales,
FIRST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales DESC) AS highest_sales2,
MIN(sales) OVER(PARTITION BY productid) AS highest_sales3
FROM sales.orders;

-- 











