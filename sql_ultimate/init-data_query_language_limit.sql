-- DQL: Data Query Language
/* Used to query data.
-- Main command:
SELECT
*/

/* 
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...
*/

-- =========================================
-- LIMIT (TOP in PostgreSQL)
-- =========================================
SELECT *
FROM customers
LIMIT 5;


-- =========================================
-- LIMIT + ORDER BY (TOP 3 highest scores)
-- =========================================
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;


-- =========================================
-- LIMIT + WHERE (filter + top results)
-- =========================================
SELECT *
FROM customers
WHERE score > 0
ORDER BY score DESC
LIMIT 5;


-- =========================================
-- LIMIT + OFFSET (pagination)
-- =========================================
SELECT *
FROM customers
ORDER BY customerid
LIMIT 5 OFFSET 0;

SELECT *
FROM customers
ORDER BY customerid
LIMIT 5 OFFSET 5;


-- =========================================
-- TOP 1 PER COUNTRY (using ORDER BY + LIMIT logic)
-- =========================================
SELECT *
FROM customers
WHERE country = 'USA'
ORDER BY score DESC
LIMIT 1;


-- =========================================
-- TOP RESULTS WITH MULTIPLE CONDITIONS
-- =========================================
SELECT *
FROM customers
WHERE country IN ('USA', 'Germany')
  AND score IS NOT NULL
ORDER BY score DESC
LIMIT 3;


-- =========================================
-- TOP WITH CALCULATION
-- =========================================
SELECT first_name, score * 2 AS double_score
FROM customers
ORDER BY double_score DESC
LIMIT 5;

-- =========================================
-- FINAL EXAMPLE USING EVERY QUERY
-- =========================================


