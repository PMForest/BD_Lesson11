-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.

-- !!! Archive - не поддерживает индексы, 
-- таблицы первичный ключ нет. !!!

--  TRIGGER users  

DROP TRIGGER IF EXISTS watchlog_users;
DELIMITER //
CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
		INSERT INTO logs (created_at, table_name, str_id, name_value)
        VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
DELIMITER ;

--  TRIGGER catalogs 

DROP TRIGGER IF EXISTS watclog_catalogs;
DELIMITER //
CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
		INSERT INTO logs (created_at, table_name, str_id, name_value)
        VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
DELIMITER ;

--   TRIGGER products

DROP TRIGGER IF EXISTS watchlog_products;
DELIMITER //
CREATE TRIGGER watchlog_prodcts AFTER INSERT ON products
FOR EACH ROW
BEGIN
		INSERT INTO logs (created_at, table_name, str_id, name_value)
        VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
DELIMITER ;

-- Test users

SELECT * FROM users;
SELECT * FROM logs;

INSERT sers (name, birthdey_at)
VALUES ('Васичка', '1999-01-01');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO sers (name, birthday_at)
VALUES ('Петрович', '1988-02-02'),
			('Магаданович', '1977-03-03'),
            ('Москвин', '1966-04-04'),
            ('Полянович', '1955-05-05');

SELECT * FROM users;
SELECT * FROM logs;

-- Test catalogs

SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('ОЗУ'),
		('Мат. платы'),
		('Корпуса');

SELECT * FROM catalogs;
SELECT * FROM logs;

-- Test products

SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('ZELMAN 5', 'ОЗУ', 3000.00, 22),
		('Плата PRO 12', 'Мат. платы', 500.00, 33),
		('Корпус № 4', 'Корпуса', 1500.00, 55);

SELECT * FROM products;
SELECT * FROM logs;












