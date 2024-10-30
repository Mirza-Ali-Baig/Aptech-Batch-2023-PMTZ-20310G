-- ******************************* Class 08 *******************************

CREATE DATABASE pmtz_202310g_class_08;
use pmtz_202310g_class_08;



-- Topics --------------------------------
-- Variables
-- Stored Procedure --------------------------------
-- with parameters
-- Output perameters

-- ******************************* What is a Varibale? *******************************
-- a variable is a container of data that we need to strore

DECLARE @name VARCHAR(30);
DECLARE @age INT;

-- ******************************* How to set Variable Value? *******************************

-- Using SET

-- set @name='Ali';
-- set @age=20;

-- Using SELECT

SELECT @name='Ali', @age=20;


-- ******************************* How To Print? *******************************

-- Using SELECT
SELECT @name;
SELECT @name as 'Name';

SELECT @name,@age;
SELECT @name as 'Name',@age as 'Age';

-- Using PRINT

PRINT @name;



-- ******************************* How to Create a Stored Prcedure? *******************************

CREATE TABLE Employees(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) Not NULL,
    Age INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Designation VARCHAR(50) NOT NULL,
)

insert into Employees(Name,Age,Salary,Designation) values ('Ahmed',20,40000,'React Dev');

SELECT * FROM Employees;

GO

CREATE PROCEDURE insertEmployee
as
 BEGIN
    insert into Employees(Name,Age,Salary,Designation) values ('Ahmed',20,40000,'React Dev');
 end;


-- ******************************* How to Call Stored Prcedure? *******************************

EXEC insertEmployee;

EXECUTE insertEmployee;


-- ******************************* How to Modify Stored Prcedure? *******************************

GO
ALTER PROCEDURE insertEmployee
    @name VARCHAR(50),
    @age INT,
    @salary DECIMAL(10,2),
    @designation VARCHAR(50)
as
 BEGIN
    insert into Employees(Name,Age,Salary,Designation) values (@name,@age,@salary,@designation);
 end;

 
-- ******************************* How to Call Stored Prcedure With Perameters? *******************************

EXEC insertEmployee 'Kashif',23,50000,'Angular Dev'; -- Postional Argument

EXEC insertEmployee @age=25,@name='Basit',@salary=55000,@designation='Full Dev'; -- Named Argument

GO
CREATE PROCEDURE updateEmployee
    @EmployeeID INT,
    @name VARCHAR(50),
    @age INT,
    @salary DECIMAL(10,2),
    @designation VARCHAR(50)
    as
BEGIN
    update Employees SET Name=@name,Age=@age,Salary=@salary,Designation=@designation WHERE EmployeeID=@EmployeeID
end;


EXEC updateEmployee 2,'Faraz',26,70000,'NEXT Dev';



-- ******************************* How to Create Stored Prcedure With Output Perameters? *******************************
GO
CREATE PROCEDURE GetEmployeeDesignation
@id INT,
@designation VARCHAR(50) OUTPUT

AS
BEGIN
    SELECT @designation=Designation FROM Employees WHERE EmployeeID=@id;
END;

DECLARE @employeeDesignation VARCHAR(50);

EXEC GetEmployeeDesignation 4, @employeeDesignation OUTPUT;

SELECT @employeeDesignation;
SELECT @employeeDesignation AS 'Employee Designation';



-- ******************************* Student Task ******************************* 
--  Create a Delete Procedure 

--  Total Marks = 100

--	ASHAR MALIK	= 0
-- 	FAROOQUE MASOOD =	
--  IQRA . = 	
-- 	MUHAMMAD HASAN JAVED = 0	
-- 	MUHAMMAD IBRAHIM JAMIL = 	
-- 	SOHNI . =
 
 
