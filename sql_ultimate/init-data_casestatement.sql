-- CASE STATEMENT
-- Evaluates a list of condition and returns a value when the first condition is met
-- CASE
-- WHEN
-- THEN
-- ELSE
-- END
SELECT
	SCORE,
	CASE
		WHEN SCORE >= 50
		AND SCORE < 500 THEN 'Medium'
		WHEN SCORE >= 500
		AND SCORE <= 900 THEN 'High'
		ELSE 'Low'
	END AS SCORE_CATEGORY
FROM
	SALES.CUSTOMERS;

-- USE CASE - CATEGORIZED DATA - DATA TRANSFORMATION
-- Group the data into different categories based on certain conditions
-- Exercise: Generate a report showing the total sales for each category:
-- High: If the sales higher than 50;
-- Medium: If the sales between 20 and 50;
-- Low: If the sales equal or lower than 20;
-- Sort the result from lowest to highest
SELECT
	SALES_CATEGORY,
	SUM(TOTAL_SALES) AS TOTAL_SALES
FROM
	(
		SELECT
			PRODUCTID,
			SUM(SALES) AS TOTAL_SALES,
			CASE
				WHEN SUM(SALES) > 50 THEN 'higher'
				WHEN SUM(SALES) BETWEEN 20 AND 50  THEN 'medium'
				ELSE 'lower'
			END AS SALES_CATEGORY
		FROM
			SALES.ORDERS
		GROUP BY
			PRODUCTID
	) T
GROUP BY
	SALES_CATEGORY
ORDER BY
	TOTAL_SALES DESC;

-- CASE STATEMENT RULES
-- The data type of the results must be matching;
-- Mapping Values - Transform the values from one form to another
-- Exercise -- Retrieve details with gender displayed as full text

	SELECT
	*,
	CASE
		WHEN GENDER = 'M' THEN 'Masculine'
		ELSE 'Feminine'
	END AS FULL_GENDER
FROM
	SALES.EMPLOYEES;


-- Retrieve customers details with abbreviated contry code
SELECT DISTINCT country
FROM sales.customers;

SELECT 
customerid, 
firstname,
country,
CASE
WHEN country = 'Germany' THEN 'DE'
WHEN country = 'USA' THEN 'US'
ELSE 'N/A'
END AS abreviated_country
FROM sales. customers;

-- OR QUICK FORMAT
SELECT 
customerid, 
firstname,
country,
CASE country
WHEN 'Germany' THEN 'DE'
WHEN 'USA' THEN 'US'
ELSE 'N/A'
END AS abreviated_country
FROM sales. customers;

-- HANDLING NULLS WITH CASE
-- Exercise: Find the average scores of customes and treat Nulls as 0
SELECT 
    customerid,
    lastname,
    score,

    ROUND(
        AVG(CASE  
                WHEN score IS NULL THEN 0
                ELSE score
            END) OVER (PARTITION BY customerid)
    , 2) AS new_score_clean,

    ROUND(
        AVG(CASE  
                WHEN score IS NULL THEN 0
                ELSE score
            END) OVER ()
    , 2) AS avg_customer_clean,

    ROUND(
        AVG(score) OVER ()
    , 2) AS avg_customer

FROM sales.customers
ORDER BY new_score_clean DESC;


-- CONDITIONAL AGGREGATION - Apply aggregate functions only on subsets of data tha fulfill certain condition
-- Exercise - Count how many times each customer has made an order with sales greater than 30
SELECT 
c.customerid,
COUNT(CASE WHEN o.sales > 30 THEN 1 ELSE 0 END) AS count_sales
FROM sales.customers AS c
LEFT JOIN sales.orders AS o
ON c.customerid=o.customerid
GROUP BY c.customerid
ORDER BY count_sales DESC;






