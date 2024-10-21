-- Class 04
-- IDENTITY
-- TOP & PERCENT
-- ORDER BY => ASC | DESC
-- DISTINCT
-- AGGREGATE FUNCTIONS
-- GROUP BY 
-- HAVING
-- ALIAS

-- create database
CREATE DATABASE pmtz_202310g_class_04;

-- select database
USE pmtz_202310g_class_04;

-- IDENTITY(start, increment)
create table employees(
    id int PRIMARY KEY IDENTITY(1,1),
    name varchar(30) NOT NULL,
    email varchar(30) NOT NULL,
    designation varchar(15) NOT NULL,
    department varchar(20) NOT NULL,
    age int NOT NULL,
    gender varchar(6) NOT NULL,
    salary int
);

-- Insert data
INSERT INTO employees (name, email, designation, department, age, gender, salary) VALUES
('Ali Khan', 'ali.khan@example.com', 'Manager', 'Sales', 35, 'Male', 70000),
('Fatima Ali', 'fatima.ali@example.com', 'Engineer', 'IT', 28, 'Female', 60000),
('Ahmed Raza', 'ahmed.raza@example.com', 'Analyst', 'Finance', 32, 'Male', 50000),
('Ayesha Malik', 'ayesha.malik@example.com', 'Developer', 'IT', 30, 'Female', 65000),
('Usman Tariq', 'usman.tariq@example.com', 'Consultant', 'HR', 29, 'Male', 55000),
('Zara Qureshi', 'zara.qureshi@example.com', 'Designer', 'Marketing', 26, 'Female', 48000),
('Bilal Ahmed', 'bilal.ahmed@example.com', 'Coordinator', 'Admin', 40, 'Male', 52000),
('Sana Shah', 'sana.shah@example.com', 'Specialist', 'Customer', 27, 'Female', 46000),
('Hassan Javed', 'hassan.javed@example.com', 'Executive', 'Sales', 34, 'Male', 47000),
('Rabia Noor', 'rabia.noor@example.com', 'Executive', 'Sales', 31, 'Female', 75000),
('Khalid Mehmood', 'khalid.mehmood@example.com', 'Auditor', 'Finance', 38, 'Male', 68000),
('Nida Aslam', 'nida.aslam@example.com', 'Teacher', 'Training', 33, 'Female', 49000),
('Rehan Bashir', 'rehan.bashir@example.com', 'Architect', 'IT', 36, 'Male', 72000),
('Aiman Mirza', 'aiman.mirza@example.com', 'Planner', 'Operations', 29, 'Female', 53000),
('Saad Qazi', 'saad.qazi@example.com', 'Advisor', 'Legal', 41, 'Male', 80000),
('Maryam Zafar', 'maryam.zafar@example.com', 'Director', 'Admin', 37, 'Female', 85000),
('Hamza Farooq', 'hamza.farooq@example.com', 'Operator', 'Manufacturing', 39, 'Male', 54000),
('Aleeza Khan', 'aleeza.khan@example.com', 'Clerk', 'Office', 25, 'Female', 41000),
('Shahbaz Ali', 'shahbaz.ali@example.com', 'Supervisor', 'Production', 42, 'Male', 62000),
('Maliha Tariq', 'maliha.tariq@example.com', 'Technician', 'Maintenance', 28, 'Female', 58000),
('Zaid Haroon', 'zaid.haroon@example.com', 'Manager', 'Logistics', 31, 'Male', 73000),
('Hira Jamil', 'hira.jamil@example.com', 'Accountant', 'Finance', 29, 'Female', 56000),
('Qasim Nawaz', 'qasim.nawaz@example.com', 'Researcher', 'Development', 34, 'Male', 67000),
('Amna Aziz', 'amna.aziz@example.com', 'Trainer', 'Training', 30, 'Female', 47500),
('Tahir Saeed', 'tahir.saeed@example.com', 'Executive', 'HR', 33, 'Male', 64000),
('Sadia Rafiq', 'sadia.rafiq@example.com', 'Artist', 'Design', 27, 'Female', 51000),
('Rizwan Ahmed', 'rizwan.ahmed@example.com', 'Inspector', 'Quality', 35, 'Male', 59000),
('Lubna Hasan', 'lubna.hasan@example.com', 'Strategist', 'Planning', 32, 'Female', 72000),
('Farhan Iqbal', 'farhan.iqbal@example.com', 'Analyst', 'Business', 29, 'Male', 57000),
('Nashit Ali', 'nashit.ali@example.com', 'Developer', 'IT', 28, 'Male', 60000);

-- Insrt data


-- Select data
SELECT * FROM employees;

-- ====================================== TOP & PERCENT =============================

-- Top
SELECT top 5 * FROM employees;
SELECT top 10 * FROM employees;
SELECT top 10 name,designation FROM employees;

-- Percent

SELECT top 50 percent * FROM employees;

SELECT top 25 percent * FROM employees;


-- ====================================== ORDER BY => ASC | DESC =============================

SELECT * FROM employees;
SELECT * FROM employees ORDER BY salary;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY name ASC;


-- ====================================== DISTINCT =============================

SELECT department from employees;
SELECT DISTINCT department from employees;


-- ====================================== AGGREGATE FUNCTIONS =============================

-- COUNT =>Work With All Type of Columns
-- MAX => Only Work With Integer Columns
-- MIN => Only Work With Integer Columns
-- SUM => Only Work With Integer Columns
-- AVG => Only Work With Integer Columns


-- Count

SELECT COUNT(*) FROM employees;
SELECT COUNT(name) FROM employees;
SELECT COUNT(*) FROM employees WHERE department='IT';

-- MAX

SELECT MAX(age) FROM employees;
SELECT MAX(salary) FROM employees;

-- MIN

SELECT MIN(age) FROM employees;
SELECT MIN(salary) FROM employees;

-- SUM

SELECT SUM(salary) FROM employees;

-- AVG

SELECT AVG(salary) FROM employees;


-- ====================================== GROUP BY =============================

select COUNT(*),department from employees GROUP BY department;
select COUNT(*),designation from employees GROUP BY designation;
select COUNT(*),designation,department from employees GROUP BY designation,department;


-- ====================================== HAVING =============================

select COUNT(*),department from employees GROUP BY department HAVING COUNT(*) >=2;

select COUNT(*),name,salary from employees GROUP BY name,salary HAVING MAX(salary) > 60000;

-- ====================================== ALIAS =============================

select COUNT(*) as 'Total Employees',department from employees GROUP BY department HAVING COUNT(*) >=2;
