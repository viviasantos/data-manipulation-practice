-- NULL FUNCTIONS

-- IS NULL REPLACED SPECIFIC VALUE -- IN POSTGRE USE COALESCE() RETURN THE FIRTS NON-NULL VALUE FROM A LIST
SELECT COALESCE(shipaddress, 'unknown')
FROM sales.orders;

SELECT 
shipaddress,
billaddress,
COALESCE (shipaddress, billaddress, 'unknown')
FROM sales.orders;

SELECT 
shipaddress,
billaddress,
COALESCE(shipaddress, billaddress)
FROM sales.orders;

-- Exercise - Find average scores of the customers
SELECT 
firstname,
score,
ROUND(AVG(score),2) AS avg_without_coalesce,
ROUND(AVG(COALESCE(score,0)),2) AS coalesce_score
FROM sales.customers
GROUP BY customerid
ORDER BY coalesce_score;

-- Exercise Sort the customers from lowest to highest scores
SELECT 
firstname,
score,
COALESCE(score,0) AS coalesce_score
FROM sales.customers
ORDER BY coalesce_score ASC;

-- OR
SELECT 
firstname,
score,
CASE WHEN score IS NULL THEN 1 ELSE 0 END AS flag
FROM sales.customers
ORDER BY flag ASC;

-- NULLIF Compare two expessions returns
-- NULL, if they are equal;
-- FistValue, if the are not equal

-- Exercise -  Find the sales price for each order by dividing the sales by the quantity
SELECT 
orderid,
sales,
quantity,
sales/NULLIF(quantity,0) AS price
FROM sales.orders;

-- IS NULL - IS NOT NULL (BOOLEAN - TRUE OR FALSE)
-- IDENTIFY THE CUSTOMERS WHO HAVE NO SCORES

SELECT 
customerid,
firstname,
score,
score IS NULL AS flag_Nscore
FROM sales.customers;

-- OPOSIT
SELECT 
customerid,
firstname,
score,
score IS NOT NULL AS flag_Nscore
FROM sales.customers;

-- 
-- List all details for customers who have not placed any orders;
SELECT c.*
FROM sales. customers AS c
LEFT JOIN sales.orders AS o
ON c.customerid = o.customerid
WHERE o.customerid IS NULL;


-- EXAMPLE
WITH orders AS (
SELECT 1 AS id, 'A' category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, ' ' 
)
SELECT *
FROM sales.orders;

-- DATA POLICIES -- Set of rules tha defines how data should be handle
-- Example 
-- DATA POLICIES #1 - Only use NULLs and empty strings but avoid blank spaces.
SELECT *,
LENGTH(category) AS category_len,
LENGTH(TRIM(category)) AS policy1
FROM sales.products;

-- DATA POLICIES -- #2 - Only use NULLs and empty strings but avoid blank spaces.
SELECT *,
LENGTH(category) AS category_len,
NULLIF(TRIM(category),'') AS policy2
FROM sales.products;

-- DATA POLICIES -- #3 - Use the default value 'unknown' and avoid nulls, empty strings, and blank spaces
SELECT *,
COALESCE(category,'unknown') AS policy3
FROM sales.products;

-- DATAPOLICIES  #4 -- COMPLETE 1,2,3
SELECT *,
TRIM(category) AS policy1,
NULLIF(TRIM(category),'') AS policy2,
COALESCE(NULLIF(TRIM(category),''),'unknown') AS policy3
FROM sales.products;











