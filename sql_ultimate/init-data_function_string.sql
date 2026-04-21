-- =========================
-- CREATE TABLE
-- =========================
CREATE TABLE employees (
    id SERIAL,
    name TEXT,
    salary NUMERIC,
    join_date DATE
);

-- =========================
-- INSERT DATA
-- =========================
INSERT INTO employees (name, salary, join_date) VALUES
('john', 1234.567, '2023-01-01'),
('ANA', -2000.345, '2022-06-15'),
('Mike', 1500.789, '2021-03-10');

-- =========================
-- SINGLE-ROW FUNCTIONS
-- =========================
SELECT 
    id,
    name,

    -- STRING FUNCTIONS
    UPPER(name) AS upper_name,
    LOWER(name) AS lower_name,
    LENGTH(name) AS name_length,
    CONCAT(name, ' works here') AS sentence,

    -- NUMERIC FUNCTIONS
    salary,
    ROUND(salary, 2) AS rounded_salary,
    ABS(salary) AS absolute_salary,
    CEIL(salary) AS ceil_salary,
    FLOOR(salary) AS floor_salary,

    -- DATE FUNCTIONS
    join_date,
    CURRENT_DATE AS today,
    AGE(join_date) AS experience,
    CURRENT_DATE - join_date AS days_worked,

    -- CONVERSION
    CAST(salary AS INTEGER) AS salary_int

FROM employees;

-- =========================
-- MULTIPLE-ROW (AGGREGATE) FUNCTIONS
-- =========================
SELECT 
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;



-- CONCAT - Combine multiple strings into one
-- Exercise - Show a list of customers first names together with country in one column
SELECT CONCAT(first_name,' ', country) AS name_country
FROM customers;

-- UPPER - Convert all characters to uppercase
SELECT UPPER(first_name) AS name_uppercase
FROM customers;

-- LOWER -  Convert all characters to lowercase
SELECT LOWER(first_name) AS name_uppercase
FROM customers;

-- UPPER - Convert all characters to uppercase
SELECT UPPER(first_name) AS name_uppercase
FROM customers;

-- INITCAP -  Convert the first character to uppercase and the remaining letters to lowercase
SELECT INITCAP(first_name) AS name_uppercase
FROM customers;