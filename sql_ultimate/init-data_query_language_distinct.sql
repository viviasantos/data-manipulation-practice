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
-- DISTINCT - BASIC (REMOVE DUPLICATES)
-- =========================================
SELECT DISTINCT country
FROM customers;


-- =========================================
-- DISTINCT - SINGLE COLUMN
-- =========================================
SELECT DISTINCT first_name
FROM customers;


-- =========================================
-- DISTINCT - MULTIPLE COLUMNS
-- =========================================
SELECT DISTINCT country, first_name
FROM customers;


-- =========================================
-- DISTINCT - WITH ORDER BY
-- =========================================
SELECT DISTINCT country
FROM customers
ORDER BY country;


-- =========================================
-- DISTINCT - WITH WHERE
-- =========================================
SELECT DISTINCT country
FROM customers
WHERE score > 0;


-- =========================================
-- DISTINCT - ON (POSTGRESQL SPECIFIC)
-- =========================================
SELECT DISTINCT ON (country) country, first_name, score
FROM customers
ORDER BY country, score DESC;


-- =========================================
-- DISTINCT - WITH NULL VALUES
-- =========================================
SELECT DISTINCT score
FROM customers;


-- =========================================
-- COMPLETE EXAMPLE
-- =========================================
SELECT DISTINCT country
FROM customers
WHERE score IS NOT NULL
ORDER BY country;