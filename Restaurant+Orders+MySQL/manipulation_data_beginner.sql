USE restaurant_db;

-- View all menu items
SELECT *
FROM menu_items;

-- Total number of items
SELECT COUNT(*) AS total_items
FROM menu_items;

-- Most expensive item
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- Least expensive item
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- What are the least 
SELECT*
FROM menu_items
ORDER BY price ASC
LIMIT 1;

-- and most expensive Italian dishes on the menu?



