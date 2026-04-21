-- STRING FUNCTION
/*
UPPER(text)        -- convert to uppercase
LOWER(text)        -- convert to lowercase
INITCAP(text)      -- capitalize first letter of each word

-- TRIM FUNCTIONS
TRIM(text)         -- remove spaces from both sides
LTRIM(text)        -- remove spaces from left side
RTRIM(text)        -- remove spaces from right side

-- CONCATENATION
CONCAT(a, b, c)    -- join strings
||                 -- string concatenation operator

-- LENGTH FUNCTIONS
LENGTH(text)       -- number of characters
CHAR_LENGTH(text)  -- same as LENGTH

-- SUBSTRING FUNCTIONS
SUBSTRING(text FROM x FOR y)  -- extract part of string

-- REPLACE FUNCTIONS
REPLACE(text, old, new)        -- replace part of string

-- SEARCH FUNCTIONS
POSITION(substring IN text)    -- find position of substring

-- PARTIAL EXTRACTION
LEFT(text, n)      -- first n characters
RIGHT(text, n)     -- last n characters

-- PADDING FUNCTIONS
LPAD(text, n, char) -- pad left
RPAD(text, n, char) -- pad right

-- OTHER
REVERSE(text)      -- reverse string
*/


-- CONCAT - Combine multiple strings into one
-- Exercise - Show a list of customers first names together with country in one column
SELECT CONCAT(first_name,' ', country) AS name_country
FROM customers;

-- UPPER - Convert all characters to uppercase
SELECT UPPER(first_name) AS name_uppercase
FROM customers;

-- LOWER -  Convert all characters to lowercase
SELECT LOWER(first_name) AS name_lowercase
FROM customers;

-- UPPER - Convert all characters to uppercase
SELECT UPPER(first_name) AS name_uppercase
FROM customers;

-- INITCAP -  Convert the first character to uppercase and the remaining letters to lowercase
SELECT INITCAP(first_name) 
FROM customers;

-- TRIM - Leading and trailing spaces
SELECT TRIM(first_name) 
FROM customers;

-- LTRIM - Leading and trailing spaces Left
SELECT LTRIM(first_name) 
FROM customers;

-- RTRIM - Leading and trailing spaces Right
SELECT RTRIM(first_name)
FROM customers;

-- Discovering where the spaces are and and the number of characters.  
SELECT first_name, LENGTH(first_name) AS len_name,
LENGTH(TRIM(first_name)) AS len_trim_name,
LENGTH(first_name) - LENGTH(TRIM(first_name)) 
FROM customers;
-- Or use WHERE to discovering
-- WHERE first_name <> TRIM(first_name);

-- REPLACE - specific character with a new character
SELECT country, REPLACE(country, 'UK','MODIFIED') AS country_modified
FROM customers;

--




