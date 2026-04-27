-- DATE&TIME FUNCTIONS -- FORMAT & CASTING (FORMAT, COVERT,CAST)

-- FORMAT (IN POSTGRE = TO_CHAR) -  Formats date or values
SELECT 
    TO_CHAR(orderdate, 'dd/MM/yyyy') AS formatted_orderdate,
	TO_CHAR(orderdate, 'MM/yyyy') AS formatted_orderdate,
	TO_CHAR(orderdate, 'day') AS formatted_orderdate,
	TO_CHAR(orderdate, 'year') AS formatted_orderdate
FROM sales.orders;

-- Exercise - Show CreationTime using the following format 
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT 
    TO_CHAR(CreationTime,'"Day" Dy Mon "Q"Q YYYY HH12:MI:SS AM'
    ) AS formatted_creationtime
FROM sales.orders;


SELECT TO_CHAR(CreationTime, '"Day:" Dy Mon yy') AS date_formater
FROM sales.orders;


-- CONVERT -  Convert date and values -- IN POSTGRE TO_CHAR
SELECT 
    CreationTime,

    -- 1. DATE REMOVE HOUR
    CreationTime::DATE AS as_date,

    -- 2. TEXT FORMAT TEXT
    CreationTime::TEXT AS as_text,

    -- 3. TIMESTAMP WRITING ALL DATE
    CreationTime::TIMESTAMP AS as_timestamp,

    -- 4. PERSONALIZE DATE
    TO_CHAR(CreationTime, 'DD/MM/YYYY') AS formatted_date,

    -- 5. TYPE NUMBER YYYYMMDD (INT)
    TO_CHAR(CreationTime, 'YYYYMMDD')::INT AS date_as_int,

    -- 6. Unix timestamp
    EXTRACT(EPOCH FROM CreationTime)::BIGINT AS unix_timestamp,

    -- 7. YEAR
    EXTRACT(YEAR FROM CreationTime)::INT AS year_only,

    -- 8. MONTH
    EXTRACT(MONTH FROM CreationTime)::INT AS month_only,

    -- 9. DAY
    EXTRACT(DAY FROM CreationTime)::INT AS day_only

FROM sales.orders;


-- CAST
SELECT 
CAST('123' AS INT) AS string_to_int,
CAST(123 AS VARCHAR) AS int_to_string,
CAST('2025-08-20' AS DATE) AS string_to_date,
CAST('2025-08-20' AS TIMESTAMP) AS string_to_datetime,
CreationTime,
CAST(CreationTime AS DATE) AS date_time_to_date
FROM sales.orders






