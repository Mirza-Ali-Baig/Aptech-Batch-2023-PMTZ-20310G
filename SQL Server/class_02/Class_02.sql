CREATE DATABASE pmtz_202310g_class_02;

use pmtz_202310g_class_02;

-- constraints / Rules

-- NOT Null
-- UNIQUE
-- CHECK
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY


-- Conditions

-- Relational Operators
-- Logical Operators

-- Advance Filtering
-- IN Operator 
-- BETWEEN Operator 
-- LIKE Operator 
-- -- Wildcard 

CREATE TABLE products (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price INT NOT NULL CHECK(price >= 5),
    quantity INT NOT NULL CHECK(quantity > 0) DEFAULT 1
);

INSERT INTO products (id, title, price, quantity) VALUES
(1, 'Wireless Mouse', 25, 10),
(2, 'Bluetooth Headphones', 70, 5),
(3, 'USB-C Charging Cable', 15, 20),
(4, 'Smartphone Stand', 30, 8),
(5, 'Laptop Backpack', 45, 12),
(6, 'Mechanical Keyboard', 90, 6),
(7, 'Gaming Monitor', 200, 4),
(8, 'External SSD 1TB', 100, 7),
(9, 'Wireless Charger', 20, 15),
(10, 'Webcam 1080p', 50, 9),
(11, 'Portable Hard Drive 2TB', 80, 5),
(12, 'Noise Cancelling Headphones', 150, 3),
(13, 'Smartwatch', 200, 6),
(14, 'Fitness Tracker', 100, 10),
(15, 'Bluetooth Speaker', 60, 4),
(16, 'HDMI Cable', 12, 25),
(17, 'Phone Case', 15, 15),
(18, 'Wireless Earbuds', 80, 8),
(19, 'Streaming Device', 50, 7),
(20, 'Gaming Mouse', 40, 10),
(21, '4K TV', 600, 2),
(22, 'Tablet Stand', 30, 9),
(23, 'Laptop Cooling Pad', 25, 6),
(24, 'USB Hub', 20, 12),
(25, 'Digital Camera', 500, 3),
(26, 'VR Headset', 400, 2),
(27, 'Action Camera', 300, 5),
(28, 'Wireless Print Scanner', 150, 4),
(29, 'Smart Home Hub', 100, 8),
(30, 'Home Security Camera', 120, 6),
(31, 'Smart Light Bulb', 20, 15),
(32, 'Wireless Router', 100, 5),
(33, 'Streaming Microphone', 80, 4),
(34, 'Smart Thermostat', 150, 2),
(35, 'Power Bank 20000mAh', 40, 10),
(36, 'Digital Photo Frame', 100, 3),
(37, 'Wireless Charging Stand', 25, 12),
(38, 'Electric Toothbrush', 90, 5),
(39, 'Cordless Vacuum Cleaner', 250, 2),
(40, 'Air Fryer', 100, 6),
(41, 'Instant Pot', 80, 4),
(42, 'Espresso Machine', 300, 1),
(43, 'Electric Kettle', 40, 7),
(44, 'Blender', 60, 8),
(45, 'Slow Cooker', 50, 10),
(46, 'Food Processor', 150, 3),
(47, 'Rice Cooker', 30, 12),
(48, 'Cookware Set', 200, 5),
(49, 'Cutlery Set', 40, 10),
(50, 'Kitchen Scale', 20, 15);



-- Select command
SELECT * FROM products;

-- Relational Operators
-- = (Equal)
-- != (Not Equal)
-- > (Greater than)
-- < (Less than)
-- >= (Greater than or equal to)
-- <= (Less than or equal to)


-- Where Clause

-- = (Equal)

SELECT * from products WHERE quantity=3;

SELECT * from products WHERE price=30;

-- != (Not Equal)

SELECT * from products WHERE price!=30;

-- > (Greater than)

SELECT * from products WHERE price > 50;

-- < (Less than)

SELECT * from products WHERE price < 80;

-- <= (Less than or equal to)

SELECT * from products WHERE price <= 80;


-- >= (Greater than or equal to)

SELECT * from products WHERE price >= 100;

-- Logical Operators

-- AND
-- OR
-- NOT

-- AND

SELECT * from products WHERE price > 10 AND price < 100;

SELECT * from products WHERE price > 10 AND price < 100 AND quantity=4;

-- OR

SELECT * from products WHERE title='Phone Case' or title ='Streaming Microphone';

SELECT * from products WHERE title='Phone Case' or title ='Streaming Microphone' or quantity=15;

-- Between

SELECT * from products WHERE price BETWEEN 10 and 100;

-- Between NOT
SELECT * from products WHERE price NOT BETWEEN 10 and 100;
-- IN

SELECT * FROM products WHERE title IN('Phone Case','Streaming Microphone','Food Processor','Air Fryer');

-- NOT IN
SELECT * FROM products WHERE title NOT IN('Phone Case','Streaming Microphone','Food Processor','Air Fryer');


-- LIKE
-- % (Any number of characters)
-- _ (Single character)

SELECT * from products WHERE title LIKE 'A%';

SELECT * from products WHERE title LIKE '%r';

SELECT * from products WHERE title LIKE 'f%r';

SELECT * from products WHERE title LIKE '%w%';


SELECT * from products WHERE title LIKE '__________';


SELECT * from products WHERE title LIKE '____a%';