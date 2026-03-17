-- Restaurant Orders Project
-- Objective 1 - Explore the items table
-- Your first objective is to better understand the items table by finding the number of rows in the table, the least and most expensive items, and the item prices within each category.

USE restaurant_db;

-- 1.1 - View the menu_items table
SELECT *
FROM menu_items;

-- 1.2 - Write a query to find the number of items on the menu
SELECT COUNT(*) AS total_items
FROM menu_items;

-- 1.3 - Most expensive items on the menu
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- 1.4 - Least expensive item on the menu
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- 1.5 - What are the least on the menu
SELECT*
FROM menu_items
ORDER BY price ASC
LIMIT 1;

-- 1.6 - How many Italian dishes are on the menu? 
SELECT category, COUNT(*) AS category
FROM menu_items
WHERE category = 'Italian'
GROUP BY category;

-- 1.7 - What are the least  expensive Italian dishes on the menu
SELECT category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC
Limit 1;

-- 1.8 most expensive Italian dishes on the menu?
SELECT category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
Limit 1;

-- 1.9 - How many dishes are in each category? 
SELECT category, COUNT(*) AS total_dishes
FROM menu_items
GROUP BY category;

-- 1.10 - What is the average dish price within each category?
SELECT category, AVG(price) AS average
FROM menu_items
GROUP BY category;

-- ----------------------------------------------------------------------------------
-- Objective 2 - Explore the orders table
-- Your second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.

-- 2.1 View the order_details table. What is the date range of the table?
SELECT MIN(order_date) AS min_order_data_range, MAX(order_date) AS max_order_data_range
FROM order_details;

-- 2.2 How many orders were made within this date range? 
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- 2.3 How many items were ordered within this date range?
SELECT COUNT(DISTINCT item_id) AS total_item_id
FROM order_details;

-- 2.4 Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS had_more_orders
FROM order_details
GROUP BY order_id
ORDER BY had_more_orders DESC
LIMIT 1;

-- 2.5 Which orders had the less number of items?
SELECT order_id, COUNT(item_id) AS had_less_orders
FROM order_details
GROUP BY order_id
ORDER BY had_less_orders ASC
LIMIT 1;

-- 2.6 How many orders had more than 12 items?
SELECT order_id, COUNT(item_id) AS total_item_id
FROM order_details 
GROUP BY order_id
HAVING total_item_id >12
ORDER BY total_item_id DESC;

-- Objective 3 Analyze customer behavior
-- Your final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.

-- 3.1 Combine the menu_items and order_details tables into a single table
SELECT *
FROM menu_items AS menu_itens_list
LEFT JOIN order_details AS orders_details_list
ON menu_itens_list.menu_item_id = orders_details_list.item_id
ORDER BY item_id ASC;

-- 3.2 What were the least ordered items? 
SELECT menu_items.item_name,
    COUNT(order_details.item_id) AS total_orders
FROM menu_items
LEFT JOIN order_details
    ON menu_items.menu_item_id = order_details.item_id
GROUP BY menu_items.item_name
ORDER BY total_orders ASC
LIMIT 1;

-- 3.3 What were the most ordered items? 
SELECT menu_items.item_name, 
COUNT(order_details.item_id) AS total_orders
FROM menu_items
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY menu_items.item_name
LIMIT 1;

-- What were the top 5 orders that spent the most money?
SELECT order_details.order_id, SUM(menu_items.price) AS total_by_order
FROM menu_items
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY order_id
ORDER BY total_by_order DESC
LIMIT 5;

-- What were the top 5 lower orders that spent the most money?
SELECT order_details.order_id, SUM(menu_items.price) As total_by_order
FROM menu_items
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY order_id
ORDER BY total_by_order ASC
LIMIT 5;

-- View the details of the highest spend order. Which specific items were purchased?
SELECT order_details.order_id,
       menu_items.item_name
FROM menu_items
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
WHERE order_details.order_id IN (440, 2075, 1957, 330, 2675)
ORDER BY order_details.order_id, menu_items.item_name ASC;

-- OR 

SELECT 
    order_details.order_id,
    menu_items.item_name,
    menu_items.price
FROM order_details
INNER JOIN menu_items
    ON order_details.item_id = menu_items.menu_item_id
WHERE order_details.order_id IN (
    SELECT order_details.order_id
    FROM order_details
    INNER JOIN menu_items
        ON order_details.item_id = menu_items.menu_item_id
    GROUP BY order_details.order_id
    ORDER BY SUM(menu_items.price) DESC
)
ORDER BY order_details.order_id, menu_items.item_name;

