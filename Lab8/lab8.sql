-- Task 1
-- a
CREATE OR REPLACE FUNCTION incr(x INTEGER)
RETURNS INTEGER AS
    $$
        BEGIN
            RETURN $1+1;
        END;
    $$
LANGUAGE 'plpgsql';
SELECT * FROM incr(40);

-- b
CREATE OR REPLACE FUNCTION sum(x INTEGER, y INTEGER)
RETURNS INTEGER AS
    $$
        BEGIN
            RETURN $1+$2;
        END
    $$
LANGUAGE 'plpgsql';
SELECT * FROM sum(1, 2);


-- c
CREATE OR REPLACE FUNCTION div_by_2(x INTEGER)
RETURNS BOOLEAN AS
    $$
        BEGIN
            IF x % 2 == 0 THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        END;

    $$
LANGUAGE 'plpgsql';
SELECT * FROM div_by_2(10);

-- d
CREATE OR REPLACE FUNCTION password(x TEXT)
returns boolean as
    $$
        BEGIN
            IF length(x) >= 8 AND length(x) <= 15 THEN RETURN TRUE;
            ELSE RETURN FALSE;
            END IF;
        END;
    $$
LANGUAGE 'plpgsql';
SELECT * FROM password('onkfoapsmfoaspdm');

-- e
CREATE FUNCTION plus_minus(a INTEGER, OUT a_plus INTEGER, OUT a_minus INTEGER) AS
    $$
    BEGIN
        a_plus=a+1;
        a_minus=a-1;
    END;
    $$
    LANGUAGE  'plpgsql';
SELECT * FROM plus_minus(10);

-- Task 2
CREATE TABLE customer_data(
    id INTEGER PRIMARY KEY,
    name VARCHAR(60),
    age INT,
    birthday DATE,
    today DATE DEFAULT now()
);

-- a
CREATE OR REPLACE FUNCTION time()
RETURNS TRIGGER AS
    $$
        BEGIN
            IF(name!=new.name) THEN new.today = current_date;
            END IF;
            RETURN new;
        END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER today_1
    BEFORE UPDATE ON customer_data FOR EACH ROW EXECUTE PROCEDURE time();

INSERT INTO customer_data(id, name) VALUES (1, 'Marat');
UPDATE customer_data SET id = 2 WHERE name = 'Marat';

-- b
CREATE OR REPLACE FUNCTION age()
RETURNS TRIGGER AS
    $$
        BEGIN
            UPDATE customer_data SET age = round((current_date-new.birthday)/365.25) WHERE id = new.id;
            RETURN new;
        END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER task2_b AFTER INSERT ON customer_data
    FOR EACH ROW EXECUTE PROCEDURE age();
INSERT INTO customer_data(id, name, birthday)  VALUES (5, 'Marat', '2002-07-21');

-- c
CREATE TABLE product(
    id INTEGER PRIMARY KEY,
    name_of_prod VARCHAR(80),
    price INTEGER
);

CREATE OR REPLACE FUNCTION fprice()
RETURNS TRIGGER AS
    $$
        BEGIN
            UPDATE product SET price = price + 0.12 * price WHERE id = new.id;
            RETURN new;
        END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER COST AFTER INSERT ON product FOR EACH ROW EXECUTE PROCEDURE fprice();

INSERT INTO product(id, name_of_prod, price) VALUES (1, 'water', 120);
INSERT INTO product(id, name_of_prod, price) VALUES (2, 'juice', 500);


-- d
CREATE OR REPLACE FUNCTION delete_rollback()
RETURNS TRIGGER AS
    $$
        BEGIN
            INSERT INTO product(id, name_of_prod, price) VALUES (old.id, old.name, old.price);
            RETURN old;
        END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER del_rollback
    AFTER DELETE ON product FOR EACH ROW EXECUTE PROCEDURE delete_rollback();
DELETE FROM product WHERE id = 2;
SELECT * FROM product;
-- e (-)

-- Task 3

--Function is used to calculate the result using given inputs, but procedure is used to perform a certain tasks in the
--appropriate order. F is P, but P is not F; F - DDL, P + DDL; F + query, P - query; F -> value(code), P -> control.

-- Task 4
CREATE TABLE employee(
    id INTEGER,
    name VARCHAR(120),
    birthday DATE,
    age INTEGER,
    salary INTEGER,
    exp INTEGER,
    discount INTEGER
);
-- a
CREATE OR REPLACE PROCEDURE salary() AS
    $$
        BEGIN
            UPDATE employee SET salary = (exp/2)*0.1*salary+salary, discount = (exp/2)*0.1*employee.discount + employee.discount,
                                discount = (exp/5)*0.01 * employee.discount + employee.discount;
            COMMIT;
        END;
    $$
LANGUAGE 'plpgsql';


-- b
CREATE OR REPLACE PROCEDURE salary_1() AS
    $$
        BEGIN
            UPDATE employee SET salary = salary * 1.15 WHERE age >= 40;
            UPDATE employee SET salary = salary * 1.15 * (exp / 8);
            UPDATE employee SET discount = 20 WHERE exp >= 8;
            COMMIT;
        END;
    $$
LANGUAGE 'plpgsql';

-- Task 5 (-)
