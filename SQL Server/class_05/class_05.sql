-- Class 05

-- ============================================ Topics ============================================ 
-- Normilalization
-- JOINS (INNER, LEFT, RIGHT, FULL,CROSS)
-- Cascading Integrity Constraints
-- ON DELETE CASCADE
-- ON UPDATE CASCADE
-- ON UPDATE NULL
-- ON DELETE NULL
-- ON UPDATE DEFAULT
-- ON DELETE DEFAULT


CREATE DATABASE pmtz_202310g_class_05;
use pmtz_202310g_class_05;

CREATE TABLE departments(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL
);
INSERT into departments(name) values ('IT'),('HR'),('Sales'),('Finance'),('Marketing');
INSERT into departments(name) values ('SEO');

CREATE TABLE employees(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL,
    salary int NOT NULL,
    designation varchar(50) NOT NULL,
    department_id int NOT NULL,
    FOREIGN KEY(department_id) REFERENCES departments(id)
)

insert into employees(name,salary,designation,department_id) values 
('Ali',50000,'Manager',1),
('Ahmed',40000,'Manager',2),
('Mohamed',30000,'Manager',3),
('Mahmoud',55000,'Manager',4),
('Adel',61000,'Manager',5),
('Usman',35000,'React Developer',1),
('Basit',40000,'Java Developer',1),
('Basit',40000,'Accountent',4);

insert into employees(name,salary,designation,department_id) values 
('Khan',70000,'SEO Expert',7);

SELECT * from employees;

-- CROSS Join

SELECT * FROM employees CROSS JOIN departments;

-- INNER Join

-- FOREIGN KEY = PRIMARY KEY
-- PRIMARY KEY = FOREIGN KEY

--  All Columns

SELECT * FROM employees INNER JOIN departments ON employees.department_id = departments.id;

--  Specific Columns

SELECT employees.id,employees.name,employees.salary,employees.designation,employees.department_id,departments.name
FROM employees INNER JOIN departments
ON employees.department_id = departments.id;

-- Using Alias

SELECT e.id,e.name,e.salary,e.designation,e.department_id,d.name as department
FROM employees e INNER JOIN departments d
ON e.department_id = d.id;

-- LEFT JOIN

SELECT e.id,e.name,e.salary,e.designation,e.department_id,d.name as department
FROM employees e LEFT JOIN departments d
ON e.department_id = d.id;

-- Right JOIN

SELECT e.id,e.name,e.salary,e.designation,e.department_id,d.name as department
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.id;

-- FULL JOIN

SELECT e.id,e.name,e.salary,e.designation,e.department_id,d.name as department
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.id;


-- Cascading Integrity Constraints

delete from departments where id = 3; -- It will not be deleted because it has foreign key constraint
delete from departments where id = 6;

CREATE TABLE employees(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(50) NOT NULL,
    salary int NOT NULL,
    designation varchar(50) NOT NULL,
    department_id int NOT NULL,
    -- FOREIGN KEY(department_id) REFERENCES departments(id) on DELETE CASCADE
    FOREIGN KEY(department_id) REFERENCES departments(id) on DELETE set NULL
);
