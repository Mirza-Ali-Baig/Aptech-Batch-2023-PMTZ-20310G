-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!! Class 14 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Triggers in SQL
-- !!!! Types of Triggers
-- !!!! After Triggers
-- !!!! Insted Of Trigger

-- !!!! DML Triggers
-- !!!! DDL Triggers


CREATE DATABASE pmtz_202310g_class_14;

use pmtz_202310g_class_14;


CREATE TABLE employees(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
)

SELECT * FROM employees;

INSERT INTO employees
( -- columns to insert data into
 [name], [salary], [department]
)
VALUES
( -- first row: values for the columns in the list above
 'Basit',65000.00 , 'Marketing'
);


GO

CREATE TABLE employeesAudit(
    id INT PRIMARY KEY IDENTITY(1,1),
    employeeId INT,
    operation VARCHAR(50),
    timestamp DATETIME DEFAULT GETDATE()
)
SELECT * FROM employeesAudit;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!! Create a Trigger to Store New Employee Details in Audit Table !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GO
CREATE TRIGGER TR_New_Employee
ON employees 
AFTER INSERT
AS
BEGIN
    PRINT 'New Employee Details Added'
END

GO
ALTER TRIGGER TR_New_Employee
ON employees 
AFTER INSERT
AS
BEGIN
    SELECT TOP 1 * FROM employees ORDER BY id DESC;
END

GO

ALTER TRIGGER TR_New_Employee
ON employees 
AFTER INSERT
AS
BEGIN
    DECLARE @empID INT;
    DECLARE @dep VARCHAR(100);
    SELECT @empID=id, @dep=department FROM inserted;

    INSERT INTO employeesAudit
    (employeeId, operation)
    VALUES
    (@empID, 'new Employee In Our Team in '+ @dep + ' Department');
END
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!! Create a Trigger That run whenever the salary Update In Employees and Save In Audit Table !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

GO
ALTER TRIGGER TR_Salary_Check
ON employees
AFTER UPDATE
AS
BEGIN
    DECLARE @empID INT;
    DECLARE @oldSalary DECIMAL(10,2);
    DECLARE @newSalary DECIMAL(10,2);

    IF UPDATE(salary)
    BEGIN
        SELECT @oldSalary=salary FROM deleted;
        SELECT @empID=id, @newSalary=salary FROM inserted;
        
        INSERT INTO employeesAudit
        (employeeId, operation)
        VALUES
        (@empID, 'Employee Salary Has been Update to Old Salary :
         '+ CAST(@oldSalary as VARCHAR(20))+' & new salary : ' + CAST(@newSalary as VARCHAR(20)));

    END

END

UPDATE employees SET name='Yasir' WHERE id=3

UPDATE employees SET salary=45000.00 WHERE id=3

ALTER TABLE employeesAudit ALTER COLUMN operation VARCHAR(255) NOT NULL

GO
CREATE TRIGGER TR_Department_Check
ON employees
AFTER UPDATE
AS
BEGIN
    DECLARE @empID INT;
    DECLARE @oldDep VARCHAR(50);
    DECLARE @newDep VARCHAR(50);

    IF UPDATE(department)
    BEGIN
        SELECT @oldDep=department FROM deleted;
        SELECT @empID=id, @newDep=department FROM inserted;
        
        INSERT INTO employeesAudit
        (employeeId, operation)
        VALUES
        (@empID, 'Employee Department Change Old Department : '+@oldDep+' And New Department : '+ @newDep);

    END

END

UPDATE employees SET department='Finance' WHERE id=3


SELECT E.id, E.name, EA.operation, CAST(EA.[timestamp] as varchar(30))
 FROM employeesAudit EA JOIN employees E on EA.employeeId=E.id
 WHERE e.id=3;