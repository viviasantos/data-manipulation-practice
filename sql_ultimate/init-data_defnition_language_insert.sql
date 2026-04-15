-- DML - DATA MANIPULATION LANGUAGE
-- INSERT 

-- TABLE (reference)
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    person_name VARCHAR(100) NOT NULL,
    birth_name VARCHAR(100),
    phone VARCHAR(20)
);

--------------------------------------------------
-- 1. Basic INSERT
--------------------------------------------------
INSERT INTO person (person_name, birth_name, phone)
VALUES ('Maria Silva', 'Maria Joana Silva', '911111111');

--------------------------------------------------
-- 2. Insert multiple rows
--------------------------------------------------
INSERT INTO person (person_name, birth_name, phone)
VALUES 
('João Santos', 'João Pedro Santos', '922222222'),
('Ana Costa', 'Ana Beatriz Costa', '933333333'),
('Carlos Lima', 'Carlos Henrique Lima', '944444444');

--------------------------------------------------
-- 3. Insert only some columns (others become NULL)
--------------------------------------------------
INSERT INTO person (person_name, phone)
VALUES ('Pedro Alves', '955555555');

--------------------------------------------------
-- 4. Insert using DEFAULT for id (auto increment)
--------------------------------------------------
INSERT INTO person (person_name, birth_name, phone)
VALUES ('Sofia Mendes', 'Sofia Mendes', '966666666');

--------------------------------------------------
-- 5. Insert explicit ID (not recommended usually)
--------------------------------------------------
INSERT INTO person (id, person_name, birth_name, phone)
VALUES (10, 'Luis Rocha', 'Luis Miguel Rocha', '977777777');

--------------------------------------------------
-- 6. Insert only default values (if allowed)
--------------------------------------------------
INSERT INTO person DEFAULT VALUES;


INSERT INTO customers(id, first_name, country, score)
VALUES(6,'Anna','USA', 100),
      (7,'Sam', 'BRA', NULL);



-- Copy the data from 'customers' table into person
INSERT INTO person(id, person_name, birth_date, email)
SELECT id, first_name, '1900-01-01', 'email'
FROM customers;


