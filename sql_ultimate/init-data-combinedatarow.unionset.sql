-- SET OPERATORS - Combine the results of multiple queries into a single result
--(UNION, UNION ALL, EXCEPT, INTERSECT)

-- #1 RULE | ORDER BY can be used only once
-- #2 RULE | Same Number of Columns
-- #3 RULE | Matching Data Types
-- #4 RULE | Same Order of Columns
-- #5 RULE | First Query Controls Aliases
-- #6 RULE | Mapping Correct Columns

-- UNION - Merge all rows and removes duplicates
SELECT firstname, lastname
FROM sales.customers
UNION
SELECT firstname, lastname
FROM sales.employees;

-- UNION ALL- Merge all rows and mantain all data
SELECT firstname, lastname
FROM sales.customers
UNION ALL
SELECT firstname, lastname
FROM sales.employees;

-- EXCEPT - Return unic rows in the first table but just those are not in second table 
SELECT firstname, lastname
FROM sales.customers
EXCEPT
SELECT firstname, lastname
FROM sales. employees;

-- INTERSECT - Return Common rows between two tables
SELECT firstname, lastname
FROM sales.customers
INTERSECT
SELECT firstname, lastname
FROM sales. employees;


-- Exercise 
-- Orders data are stored in separate tables (orders and orderArchieve)
-- Combine all orders data into one report without duplicate

SELECT orderid, productid, customerid
FROM sales.orders
UNION
SELECT orderid, productid, customerid
FROM sales.ordersarchive;

