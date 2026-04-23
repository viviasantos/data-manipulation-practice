-- NUMBER FUNCTIONS MANIPULATIONS
-- ROUND - unction is used to round numeric values to a specified number of decimal places.
SELECT sales, 
ROUND(sales,2) AS sales_2,
ROUND(sales,1) AS sales_1,
ROUND(sales,0) AS sales_0
FROM orders;

-- ABS -- function returns the absolute (positive) value of a number.
SELECT -10, 
ABS(-10)
FROM orders;


