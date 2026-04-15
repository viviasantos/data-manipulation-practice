-- DQL: Data Query Language
/* Used to query data.
-- Main command:
SELECT
*/

-- =========================================
-- HAVING - BASIC (WITH GROUP BY)
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;


-- =========================================
-- HAVING - WITH SUM
-- =========================================
SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 1000;


-- =========================================
-- HAVING - WITH AVG
-- =========================================
SELECT country, AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 500;


-- =========================================
-- HAVING - WITH MIN
-- =========================================
SELECT country, MIN(score) AS min_score
FROM customers
GROUP BY country
HAVING MIN(score) > 300;


-- =========================================
-- HAVING - WITH MAX
-- =========================================
SELECT country, MAX(score) AS max_score
FROM customers
GROUP BY country
HAVING MAX(score) > 800;


-- =========================================
-- HAVING - WITH WHERE (IMPORTANT)
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
WHERE score > 0
GROUP BY country
HAVING COUNT(*) > 1;


-- =========================================
-- HAVING - MULTIPLE CONDITIONS
-- =========================================
SELECT country, COUNT(*) AS total, AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING COUNT(*) > 1
   AND AVG(score) > 500;


-- =========================================
-- HAVING - WITH ORDER BY
-- =========================================
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 1
ORDER BY total DESC;


-- =========================================
-- HAVING - USING ALIAS (POSTGRESQL LIMITATION)
-- =========================================
-- In PostgreSQL, you CANNOT use alias in HAVING directly
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;


-- =========================================
-- HAVING - FILTERING NULL VALUES
-- =========================================
SELECT country, COUNT(score) AS total_scores
FROM customers
GROUP BY country
HAVING COUNT(score) > 0;


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
   AND AVG(score) > 500
ORDER BY avg_score DESC;

SELECT *
FROM customers
GROUP BY country
HAVING SUM (score) >800

SELECT country, AVG(score) AS avg_score
FROM customers
WHERE score <> 0
GROUP BY country
HAVING AVG(score) > 430;

