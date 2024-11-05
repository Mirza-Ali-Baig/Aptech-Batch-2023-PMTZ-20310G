-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Class 10 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- NEWID

SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';
SELECT NEWID() AS 'NEWID';

CREATE DATABASE pmtz_202310g_class_10;
USE pmtz_202310g_class_10;


CREATE TABLE Students(
    StudentID VARCHAR(60) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18 AND Age <= 100),
    Gender VARCHAR(30),
    DOB DATETIME
)

INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, DOB)
VALUES
    (NEWID(), 'Muhammad', 'Ali', 20, 'Male', '1998-01-01'),
    (NEWID(), 'Ayesha', 'Khan', 22, 'Female', '1999-02-01'),
    (NEWID(), 'Zain', 'Malik', 25, 'Male', '1995-03-01'),
    (NEWID(), 'Sana', 'Khan', 23, 'Female', '1997-04-01'),
    (NEWID(), 'Hamza', 'Ahmed', 21, 'Male', '1999-05-01'),
    (NEWID(), 'Maryam', 'Khan', 24, 'Female', '1996-06-01'),
    (NEWID(), 'Zubair', 'Khan', 26, 'Male', '1994-07-01'),
    (NEWID(), 'Amina', 'Khan', 22, 'Female', '1998-08-01'),
    (NEWID(), 'Muhammad', 'Khan', 20, 'Male', '1997-09-01'),
    (NEWID(), 'Sarah', 'Khan', 23, 'Female', '1995-10-01');

    SELECT * FROM Students
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Functions In SQL Server !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- System Functions
--  Aggregate Functions !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- COUNT()
-- SUM()
-- AVG()
-- MAX()
-- MIN()

-- String Functions

-- LEN

SELECT LEN(StudentID) from Students;

-- CONCAT

SELECT CONCAT(FirstName,LastName) as 'Full Name' from Students;

SELECT CONCAT(FirstName,' ',LastName) as 'Full Name' from Students;
SELECT CONCAT(FirstName,'-',LastName) as 'Full Name' from Students;

SELECT RAND() as 'Random';


-- Date Functions
SELECT CAST(DOB as varchar(30)) from  Students

--      ALi        

-- Custom Functions 

-- Scaler Functions
-- Inline Table Functions
-- Multiline Table Functions


--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  Scaler Functions !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--  Create Function
CREATE FUNCTION FN_ADD()
RETURNS INT
AS
BEGIN
 RETURN 10+5;
END


-- drop FUNCTION FN_ADD


SELECT dbo.FN_ADD();
SELECT dbo.FN_ADD();
SELECT dbo.FN_ADD();
SELECT dbo.FN_ADD();


-- Modify Function
GO
ALTER FUNCTION FN_ADD(@num1 INT,@num2 INT)
RETURNS INT
AS
BEGIN
 RETURN @num1+@num2;
END

GO
SELECT dbo.FN_ADD(20,40);

-- IF(){

-- }

-- FUNCTION(){

-- }