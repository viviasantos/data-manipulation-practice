

USE sql_store;

-- Creating a Calculated Column in SQL
-- Calculate new price with 10% increase

SELECT name, 
unit_price,
unit_price * 1.1 AS new_price
FROM products;

-- Use WHERE 
SELECT *
FROM customers
WHERE points >3000;
-- = <> <= != >= + - * /

-- Get the orders placed this year
SELECT customer_id As customer, first_name, points, birth_date, state
FROM customers
WHERE birth_date > '1990-01-01' OR 
(points < 1000 AND state = 'VA');

SELECT customer_id As customer, first_name, points, birth_date, state
FROM customers
WHERE NOT birth_date > '1990-01-01' OR 
(points < 1000 AND state = 'VA');

-- from the order_items table get the items
-- for order 6#
-- Where the total price is greater than 30

SELECT product_id, unit_price, quantity, unit_price * quantity >30 AS total_price
FROM  order_items
WHERE order_id = 6 AND unit_price * quantity >30
ORDER BY total_price DESC
LIMIT 6;

-- IN / NOT IN
SELECT*
FROM order_items
WHERE order_id NOT IN (6,7,8);

-- Return products with 
-- quantity stock equal 49, 38, 72

SELECT*
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- >= <=
SELECT *
FROM customers
WHERE points >=1000 AND points <=3000;

-- BETWEEN 
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- Return customer born 
					-- Between 01/01/1990 AND 01/01/2000
SELECT*
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- Start with or Finished with
-- % means N mumbers or caracters after... or before ... %-%
-- % any numbers of caracters
-- __ Single caracteres
SELECT*
FROM customers
WHERE last_name LIKE 'b%';

-- Get customers whose
-- address contain TRAIL or AVENUE
-- phone numbers end with 6

SELECT *
FROM customers
WHERE (address LIKE '%Trail%' OR address LIKE '%Avenue%')
AND phone LIKE '%6';



-- OR all customer with field
SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- OR with finish with
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose';

-- OR start with 
SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose';

-- OR All Customes with the last_name ge, ie, me
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- OR All Customes with the last_name ef, em, eq
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]';

-- OR All Customes with the last_name a - h + after e
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- ^ begineer
-- $ end
-- | logical or multiple 
-- [a,b,c,d,e] match any caracter
-- [a-h] from a to h - example

-- Get customers whose
-- first name are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name LIKE 'ELKA' OR first_name LIKE'AMBUR';

-- OR
SELECT *
FROM customers
WHERE first_name REGEXP 'Elza|Ambur';

-- last names end with EY or ON
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

-- last names start with my or contains SE
SELECT*
FROM customers
WHERE last_name LIKE 'my%' OR last_name LIKE '%se%';

-- OR
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

-- last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';

-- Field IS NULL
SELECT *
FROM customers
WHERE phone IS NULL;

-- Field IS NOT NULL
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- Get the order that arenot shiped
SELECT* 
FROM orders
WHERE shipped_date IS NULL;

-- SELECT only orders with ID 2
SELECT order_id, product_id, quantity, unit_price, quantity * unit_price AS total_price
FROM order_items
WHERE order_id=2
ORDER BY total_price DESC;

-- LIMIT SCRIPT
SELECT*
FROM order_items
ORDER BY order_id DESC
LIMIT 5;

SELECT*
FROM order_items
ORDER BY order_id DESC
LIMIT 6,3;

-- Get the top three loyal customers
SELECT first_name, points
FROM customers
WHERE points IS NOT NULL
ORDER BY points DESC
LIMIT 3;


-- JOIN
SELECT order_id, o.product_id, quantity, p.name, o.unit_price
FROM order_items o
JOIN products p ON o.product_id = p.product_id;

-- JOIN WITH ANOTHER BD sql_store join sql_inventory
SELECT *
FROM order_items o
JOIN sql_inventory.products p ON  o.product_id = p.product_id;

-- JOIN WITH ANOTHER BD sql_store join sql_inventory
SELECT *
FROM order_items o
JOIN sql_inventory.products p ON o.product_id = p.product_id;

USE sql_hr;

-- JOIN TWO TABLES
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

-- JOIN MULTIPLE TABLES
USE sql_store;
SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name As status
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_statuses os
ON o.status = os.order_status_id;

-- JOIN payments +  clients table + payments_methods
USE sql_invoicing;

SELECT p.date, p.invoice_id, p.amount, c.name, pm.name
FROM payments p
JOIN clients c
ON p.client_id = c.client_id
JOIN payment_methods pm
ON  p.payment_method = pm.payment_method_id;

USE sql_store;
SELECT*
FROM order_items oi
JOIN order_item_notes oin
ON oi.order_id = oin.order_id
AND oi.product_id = oin.product_id;

-- Implicit Join sintaxe
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

-- OUTER JOIN
SELECT p.product_id, p.name, oi.quantity
FROM products p
RIGHT JOIN order_items oi
ON p.product_id = oi.product_id;

-- OUTER JOIN
SELECT p.product_id, p.name, oi.quantity
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id;

-- MULTIPLE TABLES OUTER JOIN
SELECT c.customer_id, c.first_name, o.order_id, s.shipper_id, s.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id
ORDER BY c.customer_id;

-- SELF JOIN -- 
USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name AS manager, m.reports_to
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id
ORDER BY employee_id;

-- 
USE sql_invoicing;
SELECT *
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
ON p.payment_id = pm.payment_method_id;

-- Natural Join
Select *
From payments p
NATURAL JOIN payment_methods pm;

-- Combine JOIN - Combine every record from one table with every record of another table
USE sql_store;
SELECT c.first_name AS customer, p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.customer_id;

-- OR
SELECT c.first_name AS customer, p.name AS product
FROM customers c, products p
ORDER BY c.customer_id;

-- Do Cross Join between shippers and products
-- Using the implicit sintax
-- Unsing the explicit sintax
USE sql_store;
SELECT *
FROM shippers s
CROSS JOIN products p
ORDER BY p.product_id;

-- OR
SELECT s.name AS shipper_name, p.name AS product_name
FROM shippers s, products p
ORDER BY p.product_id;

-- Combine rows UNIONS
SELECT o. order_id, o.order_date, 'Active' AS status
FROM orders o
WHERE order_date >= '2019-01-01'
UNION
SELECT o. order_id, o.order_date, 'Archieve' AS status
FROM orders o
WHERE order_date < '2019-01-01';

-- Union rows between two differents tables
SELECT c.first_name
FROM customers c
UNION
SELECT s.name
FROM shippers s;

-- Create a new field with pre-define values
SELECT customer_id, first_name, points,
CASE
WHEN points < 2000 THEN 'Bronze'
WHEN points BETWEEN 2001 AND 3000 THEN 'Silver'
WHEN points BETWEEN 3001 AND 4000 THEN 'Gold'
ELSE 'other'
END AS type
FROM customers;



























