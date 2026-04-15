-- DQL: Data Query Language
/* Used to query data.
-- Main command:
SELECT
*/


-- =========================================
-- ORDER BY - ORDENATION 
-- =========================================

-- RETRIEVE ALL THE CUSTOMERS AND SORT THE RESULT BY HIGHEST SCORE FIRST 
SELECT *
FROM customers
ORDER BY score DESC;


-- =========================================
-- ORDER BY - DEFAULT (ASCENDING)
-- =========================================
SELECT *
FROM customers
ORDER BY score;


-- =========================================
-- ORDER BY - DESCENDING
-- =========================================
SELECT *
FROM customers
ORDER BY score DESC;


-- =========================================
-- ORDER BY - MULTIPLE COLUMNS
-- =========================================
SELECT *
FROM customers
ORDER BY country ASC, score DESC;


-- =========================================
-- ORDER BY - COLUMN POSITION
-- =========================================
SELECT first_name, country, score
FROM customers
ORDER BY 3 DESC;


-- =========================================
-- ORDER BY - USING ALIAS
-- =========================================
SELECT first_name AS name, score
FROM customers
ORDER BY name;


-- =========================================
-- ORDER BY - NULLS FIRST
-- =========================================
SELECT *
FROM customers
ORDER BY score NULLS FIRST;


-- =========================================
-- ORDER BY - NULLS LAST
-- =========================================
SELECT *
FROM customers
ORDER BY score NULLS LAST;


-- =========================================
-- ORDER BY - DESC + NULLS LAST
-- =========================================
SELECT *
FROM customers
ORDER BY score DESC NULLS LAST;


-- =========================================
-- ORDER BY - USING EXPRESSIONS
-- =========================================
SELECT first_name, score * 2 AS double_score
FROM customers
ORDER BY double_score DESC;


-- =========================================
-- ORDER BY - USING FUNCTIONS
-- =========================================
SELECT *
FROM customers
ORDER BY LOWER(first_name);


-- =========================================
-- ORDER BY - CUSTOM SORT WITH CASE
-- =========================================
SELECT *
FROM customers
ORDER BY 
    CASE 
        WHEN country = 'USA' THEN 1
        WHEN country = 'Germany' THEN 2
        ELSE 3
    END;


-- =========================================
-- COMPLETE EXAMPLE
-- =========================================
SELECT first_name, country, score
FROM customers
WHERE score > 0
ORDER BY country ASC, score DESC NULLS LAST;



SELECT *
FROM customers
ORDER BY country ASC, score DESC;