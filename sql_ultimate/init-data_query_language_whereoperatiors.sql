-- SQL - STRUCTURED QUERY LANGUAGE
-- DQL - DATA QUERY LANQUAGE
-- WHERE OPERATORS

----------------------------------
-- ***COMPARISON OPERATORS ******
--   (=, <>, <, >, <=, >=)
----------------------------------
-- IQUAL CONDITION =
SELECT *
FROM customers
WHERE country = 'Germany';

-- ARE NOT IQUAL TO <>
SELECT *
FROM customers 
WHERE country <> 'Germany';

-- GREATER BY OTHER VALUE >
SELECT *
FROM customers
WHERE score > 200;

-- GREATER THAN OR IQUAL TO  >=
SELECT *
FROM customers
WHERE score >= 200;

-- LESS THAN OTHER VALUES <
SELECT *
FROM customers
WHERE score < 200;

-- LESS THAN OR EQUAL TO ANOTHER VALUES
SELECT *
FROM customers
WHERE score <= 200;

----------------------------------
-- ***LOGICAL OPERATORS ******
--   (AND, OR)
----------------------------------

-- ALL CONDITION MUST TO BE TRUE (AND)
SELECT*
FROM customers
WHERE country = 'Germany' AND score >=500;

-- AT LEAST ONE OF THE CONDITION MUST BE TRUE (OR)
SELECT *
FROM customers
WHERE country = 'Germany' OR score >=500;

-- ARENOT THE VALUE -  EXCLUDES MATCHING ROWS (NOT)
SELECT *
FROM customers
WHERE NOT country = 'Germany';

----------------------------------
-- ***RANGE OPERATORS ******
--   (BETWEEN)
----------------------------------

-- RETRIEVE A ROW THAT IS BETWEEN ONE VALUE AND ANOTHER VALUE (BETWEEN) 
SELECT*
FROM customers
WHERE score BETWEEN 100 AND 500;


----------------------------------
-- ***MEMBERSHIP OPERATOR ******
--   (IN, NOT IN)
----------------------------------

--- RETRIEVE ALL CUSTOMERS FROM EITHER GERMANY OR USA (IN)
SELECT *
FROM customers
WHERE country IN ('USA', 'Germany');


--- RETRIEVE ALL CUSTOMERS FROM NEITHER GERMANY OR USA (NOT IN)
SELECT *
FROM customers
WHERE country NOT IN('USA', 'Germany');

----------------------------------
-- ***SEARCH OPERATOR ******
--   (LIKE)
----------------------------------
-- Pattern	Meaning
-- 'A%'	starts with A
-- '%a'	ends with a
-- '%an%'	contains "an"
-- 'A__'	A + 2 letters
-- '_a%'	second letter is "a"
-- A%O start with A and finished with o

-- RETRIEVE ALL CUSTOMERS START WITH G (value+%)
SELECT *
FROM customers
WHERE first_name LIKE 'G%';

-- RETRIEVE ALL CUSTOMERS FINISHED WITH g (% + value)
SELECT*
FROM customers
WHERE first_name LIKE '%g';

-- RETRIEVE ALL CUSTOMERS THAT HAVE %Value%
SELECT*
FROM customers
WHERE first_name LIKE '%or%';

-- RETRIEVE ALL CUSTOMERS THAT START WITH G AND COINTAINT MORE 4 CARACTERES
SELECT *
FROM customers
WHERE first_name LIKE 'G____';

-- RETRIEVE ALL CUSTOMERS THAT FINISHED WITH G AND COINTAINT BEFORE 4 CARACTERES
SELECT *
FROM customers
WHERE first_name LIKE '____g';

-- RETRIEVE ALL CUSTOMERS THAT FINISHED WITH G
SELECT *
FROM customers
WHERE first_name LIKE '%__g';








