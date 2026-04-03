-- A. KPIs requirement
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

-- B. PROBLEM STATEMENT - CHARTS REQUIREMENT
-- We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirements for creating charts:

-- 1 Daily Trend for Total Orders:
-- Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis.
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day;


-- 2.Monthly Trend for Total Orders:
-- Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will allow us to identify peak hours or periods of high order activity.

SELECT MONTHNAME(order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_month
ORDER BY total_orders DESC;

-- 3.Percentage of Sales by Pizza Category:
-- Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

SELECT pizza_category, 
FORMAT(
SUM(total_price),0) AS total_sales,
ROUND(
SUM(total_price) *100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1),2) 
AS percentage
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category
ORDER BY percentage DESC;


-- 4. Percentage of Sales by Pizza Size:
-- Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE QUARTER(order_date)=1) AS DECIMAL(10,2)) AS percentage_sales_per_size
FROM pizza_sales
WHERE QUARTER(order_date)=1
GROUP BY pizza_size
ORDER BY percentage_sales_per_size DESC;

-- 5. Total Pizzas Sold by Pizza Category:
-- Create a funnel chart that presents the total number of pizzas sold for each category. This chart will allow us to compare the sales performance of different pizza categories.
SELECT
pizza_category, #
SUM(quantity) AS total_sales_per_category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_sales_per_category DESC;

-- 6. Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
-- Create a bar chart highlighting the top 5 best-selling pizzas based on revenue, total quantity, and total orders. This chart will help us identify the most popular pizza options.

-- 5 BESTSELLER PER REVENUE
SELECT pizza_name,
CONCAT('€', FORMAT(SUM(total_price),2, 'de_DE')) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 5;

-- 5 BESTSELLER PER QUANTITY
SELECT pizza_name,
CAST(SUM(quantity) AS DECIMAL(10,0)) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- 5 BESTSELLER PER TOTAL ORDER
SELECT pizza_name,
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,0)) AS total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_order DESC
LIMIT 5;




-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
-- Create a bar chart showcasing the bottom 5 worst-selling pizzas based on revenue, total quantity, and total orders. This chart will enable us to identify underperforming or less popular pizza options.

-- 5 LESS SALES PER REVENUE
SELECT pizza_name,
CONCAT('€', FORMAT(SUM(total_price),2, 'DE_de'))AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
Limit 5;

-- 5 LESS PER QUANTITY
SELECT pizza_name,
CAST(SUM(quantity) AS DECIMAL(10,0)) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

-- 5 LESS PER TOTAL ORDER
SELECT pizza_name,
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,0)) AS total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_order ASC
LIMIT 5;
