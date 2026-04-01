-- 1 - Total Revenue - The sum of TOTAL PRICE of all pizza orders
USE  sql_pizza_project;
SELECT SUM(total_price) AS sum_total_price
FROM pizza_sales;

-- 2 - Average Order Value - The average amount spent per order, calculating by dividing the total revenue by the total number of orders
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

-- 3 - Total Pizzas Sold - The Sum of the quantities of all pizzas sold
SELECT SUM(quantity) AS sum_quantity
FROM pizza_sales;

-- 4 - Total orders - The total numbers of orders placed
SELECT COUNT(DISTINCT order_id)
FROM pizza_sales;

-- 5 - Average pizzas per order - The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total numbers of orders
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS avg_pizzas_order
FROM pizza_sales;