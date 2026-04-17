-- DML - DATA MANIPULATION LANGUAGE
-- UPDATE 

-- 1. Update simples (uma coluna)
UPDATE person
SET phone = '911111111'
WHERE id = 1;

--------------------------------------------------

-- 2. Update múltiplas colunas
UPDATE person
SET person_name = 'Maria Silva',
    email = 'maria@test.com'
WHERE id = 2;

--------------------------------------------------

-- 3. Update por condição (nome)
UPDATE person
SET phone = '922222222'
WHERE person_name = 'João Santos';

--------------------------------------------------

-- 4. Update em valores NULL
UPDATE person
SET email = 'unknown@test.com'
WHERE email IS NULL;

--------------------------------------------------

-- 5. Update sem WHERE (ATENÇÃO: afeta TODA a tabela)
UPDATE person
SET email = 'default@test.com';

--------------------------------------------------

-- 6. Update com LIKE (filtro parcial)
UPDATE person
SET phone = '999999999'
WHERE person_name LIKE 'Maria%';

--------------------------------------------------

-- 7. Update com cálculo/valor fixo
UPDATE person
SET phone = '000000000'
WHERE id = 3;

UPDATE customers 
SET score = '0',
country = 'UK'
WHERE id =2;

SELECT*
FROM customers
WHERE id =2;

-- UPDATE ALL CUSTOMERS WITH A NULL SCORE BY SETTING THEIR SCORE TO 0
UPDATE customers
SET score=0
WHERE score IS NULL
