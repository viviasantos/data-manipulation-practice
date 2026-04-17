-- DML - DATA MANIPULATION LANGUAGE
-- DELETE 

-- 1. Check data before deleting (SAFE STEP)
SELECT * FROM person
WHERE id = 1;

--------------------------------------------------

-- 2. Delete one row by ID
DELETE FROM person
WHERE id = 1;

--------------------------------------------------

-- 3. Delete by name
DELETE FROM person
WHERE person_name = 'Maria Silva';

--------------------------------------------------

-- 4. Delete with multiple conditions
DELETE FROM person
WHERE person_name = 'João Santos'
AND phone = '911111111';

--------------------------------------------------

-- 5. Delete rows with NULL values
DELETE FROM person
WHERE phone IS NULL;

--------------------------------------------------

-- 6. Delete using pattern (LIKE)
DELETE FROM person
WHERE person_name LIKE 'Ana%';

--------------------------------------------------

-- 7. Delete multiple specific rows
DELETE FROM person
WHERE id IN (2, 3, 4);

--------------------------------------------------

-- 8. DANGER: Delete ALL rows (use carefully ⚠️)
DELETE FROM person;

--------------------------------------------------

-- 9. Safer full delete with condition
DELETE FROM person
WHERE id IS NOT NULL;

