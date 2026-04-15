-- DQL: Data Query Language
/* Used to query data.
-- Main command:
SELECT
*/


-- =========================================
-- GROUP BY - BASIC
-- =========================================
SELECT country
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - COUNT (COUNT ROWS)
-- =========================================
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - COUNT WITH COLUMN
-- =========================================
SELECT country, COUNT(score) AS total_scores
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - SUM
-- =========================================
SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - AVG (AVERAGE)
-- =========================================
SELECT country, AVG(score) AS avg_score
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - MIN
-- =========================================
SELECT country, MIN(score) AS min_score
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - MAX
-- =========================================
SELECT country, MAX(score) AS max_score
FROM customers
GROUP BY country;


-- =========================================
-- GROUP BY - MULTIPLE COLUMNS
-- =========================================
SELECT country, first_name, COUNT(*) AS total
FROM customers
GROUP BY country, first_name;


-- =========================================
-- GROUP BY - WITH WHERE
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
WHERE score > 500
GROUP BY country;


-- =========================================
-- GROUP BY - HAVING (FILTER GROUPS)
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;


-- =========================================
-- GROUP BY - HAVING WITH SUM
-- =========================================
SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 1000;


-- =========================================
-- GROUP BY - ORDER BY
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
ORDER BY total DESC;


-- =========================================
-- GROUP BY - USING ALIAS IN ORDER BY
-- =========================================
SELECT country, AVG(score) AS avg_score
FROM customers
GROUP BY country
ORDER BY avg_score DESC;


-- =========================================
-- GROUP BY - WITH NULL HANDLING
-- =========================================
SELECT country, COUNT(score) AS total_scores
FROM customers
GROUP BY country;


-- =========================================
-- COMPLETE EXAMPLE
-- =========================================
SELECT 
    country,
    COUNT(*) AS total_customers,
    AVG(score) AS avg_score
FROM customers
WHERE score IS NOT NULL
GROUP BY country
HAVING COUNT(*) > 1
ORDER BY avg_score DESC;

SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country;

SELECT country, SUM(score) AS total_score, COUNT(id) AS total_customers
FROM customers
GROUP BY country;
	





