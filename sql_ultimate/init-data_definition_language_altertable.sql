--DDL - DATA DEFINITION LANGUAGE
-- CREATE
-- ALTER
-- DROP

-- Add a new column
ALTER TABLE person
ADD COLUMN email VARCHAR(100);

-- Rename a column
ALTER TABLE person
RENAME COLUMN person_name TO full_name;

-- Change data type
ALTER TABLE person
ALTER COLUMN phone TYPE VARCHAR(20);

-- Set NOT NULL constraint
ALTER TABLE person
ALTER COLUMN full_name SET NOT NULL;

-- Remove NOT NULL constraint
ALTER TABLE person
ALTER COLUMN birth_name DROP NOT NULL;

-- Set default value
ALTER TABLE person
ALTER COLUMN phone SET DEFAULT 'N/A';

-- Remove default value
ALTER TABLE person
ALTER COLUMN phone DROP DEFAULT;

-- Add PRIMARY KEY
ALTER TABLE person
ADD CONSTRAINT person_pkey PRIMARY KEY (id);

-- Add UNIQUE constraint
ALTER TABLE person
ADD CONSTRAINT unique_phone UNIQUE (phone);

-- Add CHECK constraint
ALTER TABLE person
ADD CONSTRAINT phone_length_check CHECK (char_length(phone) >= 9);

-- Drop a constraint
ALTER TABLE person
DROP CONSTRAINT unique_phone;

-- Drop a column
ALTER TABLE person
DROP COLUMN birth_name;

-- Rename the table
ALTER TABLE person
RENAME TO people;
