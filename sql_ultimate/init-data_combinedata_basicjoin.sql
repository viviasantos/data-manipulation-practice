-- COMBINE DATA 
-- NO JOINT - Combine all data between two tables
-- INNER JOIN - Returns only matching rows in both tables.
-- LEFT JOIN (LEFT OUTER JOIN) - Returns all rows from the left table + matching rows from the right.
-- RIGHT JOIN (RIGHT OUTER JOIN) -Returns all rows from the right table + matching rows from the left.
-- FULL JOIN (FULL OUTER JOIN) - Returns all rows from both tables.
-- CROSS JOIN - Returns all combinations (Cartesian product).
-- FULL ANTI JOIN - Returns only Rows that Dont Match in either tables.



-- NO JOINT - Combine all data between two tables
SELECT *
FROM customers;

SELECT *
FROM orders;

-- COMBINE THE DATA FOR TWO TABLES (INEER JOIN )
-- Returns only matching rows in both tables.
SELECT c.first_name, o.order_id
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

-- LEFT JOIN (LEFT OUTER JOIN) - Returns all rows from the left table + matching rows from the right.
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

-- CROSS JOIN - Returns all combinations (Cartesian product).
SELECT *
FROM customers AS c
CROSS JOIN orders AS o;

-- FULL ANTI JOIN - Returns only Rows that Dont Match in either tables.
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL;


