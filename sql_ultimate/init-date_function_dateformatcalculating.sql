-- DATE&TIME FUNCTIONS -- DATE CALCULATE (ADD,)

-- DATE ADD OR SUB -- IN POSTGRE USE INTERVAL

SELECT 
  orderdate,
  orderdate + INTERVAL '2 years' AS newOrderDate_PlusYear,
  orderDate - INTERVAL '2 years' AS newOrderDate_SubYear,
  orderDate + INTERVAL '3 months' AS newOrderDate_PlusMonth,
  orderDate - INTERVAL '3 months' AS newOrderDate_SubMonth,
  orderDate - INTERVAL '10 days' AS newOrderDate_Subdays,
  orderDate + INTERVAL '10 days' AS newOrderDate_Plusdays
FROM sales.orders;

-- DATE DIFF -- IN POSTGRE USE (-)
SELECT 
Shipdate,
OrderDate,
Shipdate - OrderDate AS diff_days
FROM sales.orders;

-- Exercise : Calculate the age of employees
SELECT 
firstname,
birthdate,
CURRENT_DATE - birthdate AS ageOfImployees
FROM sales.employees;

-- Exercise : Calculate the average shipping durantion in days for each month
SELECT 
  DATE_TRUNC('month', orderdate) AS month,
  AVG(shipdate - orderdate) AS avg_shipping_days
FROM sales.orders
GROUP BY month
ORDER BY month;

-- Exercise: Find the number of days between each order and the previous order
SELECT 
    orderid,
    orderdate,
	LAG(orderdate) OVER (ORDER BY orderdate) AS previous_date,
    orderdate - LAG(orderdate) OVER (ORDER BY orderdate) AS days_difference
FROM sales.orders;


