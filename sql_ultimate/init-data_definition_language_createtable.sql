--DDL - DATA DEFINITION LANGUAGE
-- CREATE
-- ALTER
-- DROP


-- TYPE OF DATA
-- =========================================
-- NUMERIC TYPES (NUMBERS)
-- =========================================

-- INTEGER (whole numbers)
CREATE TABLE test_int (
    id INT,          -- normal integer (-2B to +2B)
    small SMALLINT,  -- smaller numbers
    big BIGINT       -- very large numbers
);

-- DECIMAL / NUMERIC (precise numbers - money, finance)
CREATE TABLE test_decimal (
    price NUMERIC(10,2)  -- total 10 digits, 2 after decimal (ex: 12345.67)
);

-- FLOAT (approximate numbers)
CREATE TABLE test_float (
    value REAL,          -- less precision
    value2 DOUBLE PRECISION -- more precision
);


-- =========================================
-- TEXT TYPES (STRINGS)
-- =========================================

CREATE TABLE test_text (
    name VARCHAR(50),   -- text with limit (use for names)
    description TEXT,   -- unlimited text (use for long text)
    code CHAR(5)        -- fixed length (always 5 characters)
);


-- =========================================
-- DATE & TIME TYPES (VERY IMPORTANT)
-- =========================================

CREATE TABLE test_dates (
    birth_date DATE,              -- only date (YYYY-MM-DD)
    event_time TIME,              -- only time (HH:MM:SS)
    created_at TIMESTAMP,         -- date + time
    created_tz TIMESTAMP WITH TIME ZONE -- date + time + timezone
);


-- =========================================
-- BOOLEAN TYPE
-- =========================================

CREATE TABLE test_boolean (
    is_active BOOLEAN  -- TRUE / FALSE
);


-- =========================================
-- UUID (UNIQUE IDENTIFIER)
-- =========================================

CREATE TABLE test_uuid (
    id UUID  -- unique id (used in APIs, systems)
);


-- =========================================
-- JSON (MODERN DATA)
-- =========================================

CREATE TABLE test_json (
    data JSON,   -- normal JSON
    data2 JSONB  -- optimized JSON (better performance)
);


-- =========================================
-- SERIAL (AUTO INCREMENT)
-- =========================================

CREATE TABLE test_serial (
    id SERIAL PRIMARY KEY  -- auto-increment (1,2,3...)
);


-- =========================================
-- WHEN TO USE EACH TYPE
-- =========================================

-- INT → ids, counts
-- NUMERIC → money, prices (exact values)
-- FLOAT → scientific / approximate values
-- VARCHAR → names, emails
-- TEXT → long descriptions
-- DATE → birthdays, events
-- TIMESTAMP → logs, created_at
-- BOOLEAN → true/false flags
-- UUID → unique identifiers (advanced)
-- JSONB → flexible data (APIs, configs)
-- SERIAL → auto increment IDs

CREATE TABLE person(
id INT NOT NULL,
person_name VARCHAR(5) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY(id));

)

