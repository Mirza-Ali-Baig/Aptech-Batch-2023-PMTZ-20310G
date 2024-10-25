-- Class 06
-- ===================================== Topics =====================================
-- Alter
-- Views
-- Variables
-- Stored Procedures
--  Input Parameters
--  Output Parameters


CREATE DATABASE pmtz_202310g_class_06;
USE pmtz_202310g_class_06;

CREATE TABLE products (
    Id INT,
    Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

INSERT INTO products VALUES
(1, 'Product 1', 10.99, 50),
(2, 'Product 2', 19.99, 25),
(3, 'Product 3', 7.99, 100),
(4, 'Product 4', 12.99, 75),
(5, 'Product 5', 8.99, 40);

SELECT * FROM products


-- ===================================== ALTER COMMANDS =====================================

-- ===================================== ADD COLUMN =====================================

ALTER TABLE products ADD Description text;

-- ===================================== DROP COLUMN =====================================

ALTER TABLE products DROP Description;

-- ===================================== ALTER COLUMN =====================================
alter table products alter column Id INT Not NULL;

-- ===================================== Add PRIMARY KEY =====================================
alter table products ADD PRIMARY KEY (Id);
-- ===================================== DROP PRIMARY KEY =====================================
alter table products DROP CONSTRAINT PK__products__3214EC071839D279;

-- ===================================== ADD UNIQUE =====================================

ALTER TABLE products ADD UNIQUE (Name);

-- ===================================== DROP UNIQUE =====================================
ALTER TABLE products DROP CONSTRAINT UQ__products__737584F6C41D2D36;

-- ===================================== ADD FOREIGN KEY =====================================
CREATE TABLE categories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
);

Alter TABLE products ADD catergoy_id int FOREIGN KEY REFERENCES categories(Id);

-- ===================================== DROP FOREIGN KEY =====================================
ALTER TABLE products DROP CONSTRAINT FK__products__caterg__3B75D760;


-- ===================================== Rename Column =====================================

EXECUTE sp_rename 'products.Name','Title','COLUMN';

-- ===================================== Rename Table =====================================
EXECUTE sp_rename 'products','my_products';

EXECUTE sp_rename 'my_products','products';

-- ===================================== Rename Database =====================================

EXECUTE sp_renamedb 'pmtz_202310g_class_06','class_07';


-- ===================================== Views =====================================

select * from  products;


CREATE TABLE departments(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL
);
INSERT into departments(name) values ('IT'),('HR'),('Sales'),('Finance'),('Marketing');

CREATE TABLE cities(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL
)

insert into cities(name) values ('Karachi'),('Lahore'),('Islamabad'),('Peshawar'),('Quetta');
CREATE TABLE employees(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL,
    salary int NOT NULL,
    designation varchar(50) NOT NULL,
    city_id int NOT NULL,
    FOREIGN KEY(city_id) REFERENCES cities(id),
    department_id int NOT NULL,
    FOREIGN KEY(department_id) REFERENCES departments(id)
)

insert into employees(name,salary,designation,city_id,department_id) values 
('Ali',50000,'Manager',1,1),
('Ahmed',40000,'Manager',1,2),
('Mohamed',30000,'Manager',3,3),
('Mahmoud',55000,'Manager',4,4),
('Adel',61000,'Manager',3,5),
('Usman',35000,'React Developer',1,1),
('Basit',40000,'Java Developer',2,1),
('Basit',40000,'Accountent',4,4);



SELECT e.id,e.name,e.salary,e.designation,c.name as city,d.name as department from employees e join cities c on e.city_id = c.id join departments d on e.department_id = d.id;

-- Create View
CREATE VIEW EmployeeInfo
AS
SELECT 
    e.id,e.name,e.salary,e.designation,c.name as city,d.name as department
    from employees e join cities c on e.city_id = c.id join departments d on e.department_id = d.id;

-- Call a View
select * from EmployeeInfo;
select name,designation from EmployeeInfo;

-- DROP VIEW
DROP VIEW EmployeeInfo;

-- ALTER VIEW
ALTER VIEW EmployeeInfo
AS
SELECT 
    e.*,c.name as city,d.name as department
    from employees e join cities c on e.city_id = c.id join departments d on e.department_id = d.id;












-- alt + upper arrow
-- shift + alt + down arrow