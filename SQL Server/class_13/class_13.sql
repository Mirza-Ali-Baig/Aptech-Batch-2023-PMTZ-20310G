--  Class 13
-- !!!!!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!!!
--  Transaction
-- try/catch



-- !!!!!!!!!!!!!!!!!!!!!! Bank Management System !!!!!!!!!!!!!!!!!!!!!!


CREATE DATABASE pmtz_202310g_class_13;
use pmtz_202310g_class_13;


-- !!!!!!!!!!!!!!!!!!!!!! Customers Table !!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Customers(
    id varchar(40) PRIMARY KEY DEFAULT NEWID(),
    name varchar(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address varchar(255) NOT NULL,
    phone_number varchar(20) NOT NULL,
)

-- !!!!!!!!!!!!!!!!!!!!!! Insert in  Customers Table !!!!!!!!!!!!!!!!!!!!!!
INSERT INTO Customers (name, email, address, phone_number)
VALUES 
('Ali Khan', 'ali.khan@email.com', 'House 123, Street 4, Islamabad', '+92 300 1234567'),
('Fatima Ahmed', 'fatima.ahmed@email.com', 'Flat 45, Block B, Clifton, Karachi', '+92 321 2345678'),
('Muhammad Usman', 'm.usman@email.com', '789 Allama Iqbal Road, Lahore', '+92 333 3456789'),
('Ayesha Malik', 'ayesha.malik@email.com', 'Plot 56, Sector F-10, Islamabad', '+92 345 4567890'),
('Zain Abbas', 'zain.abbas@email.com', 'House 22, Street 7, DHA Phase 5, Karachi', '+92 301 5678901'),
('Sara Raza', 'sara.raza@email.com', '123 Jinnah Avenue, Faisalabad', '+92 312 6789012'),
('Omar Farooq', 'omar.farooq@email.com', 'Flat 12, Askari Complex, Rawalpindi', '+92 332 7890123'),
('Nadia Hussain', 'nadia.hussain@email.com', '456 Shahrah-e-Faisal, Karachi', '+92 313 8901234'),
('Imran Siddiqui', 'imran.siddiqui@email.com', 'House 78, Model Town, Lahore', '+92 334 9012345'),
('Sana Mir', 'sana.mir@email.com', 'Apartment 34, Gulberg III, Lahore', '+92 315 0123456');


-- !!!!!!!!!!!!!!!!!!!!!! Accounts Table !!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Accounts(
    id varchar(40) PRIMARY KEY DEFAULT NEWID(),
    customer_id varchar(40) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    type VARCHAR(255) NOT NULL DEFAULT 'Current',
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
)

-- !!!!!!!!!!!!!!!!!!!!!! Insert In Accounts Table !!!!!!!!!!!!!!!!!!!!!!
INSERT INTO Accounts (customer_id, balance, type)
VALUES 
((SELECT TOP 1 id FROM Customers WHERE name = 'Ali Khan'), 5000.00, 'Savings'),
((SELECT TOP 1 id FROM Customers WHERE name = 'Fatima Ahmed'), 7500.50, 'Current'),
((SELECT TOP 1 id FROM Customers WHERE name = 'Muhammad Usman'), 10000.75, 'Savings'),
((SELECT TOP 1 id FROM Customers WHERE name = 'Ayesha Malik'), 3000.25, 'Current'),
((SELECT TOP 1 id FROM Customers WHERE name = 'Zain Abbas'), 15000.00, 'Savings');


-- !!!!!!!!!!!!!!!!!!!!!! Transactions Table !!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Transactions(
    id VARCHAR(40) PRIMARY KEY DEFAULT NEWID(),
    account_id varchar(40) NOT NULL,
    type VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(id)
);



-- !!!!!!!!!!!!!!!!!!!!!! Select All Data in Customers Table !!!!!!!!!!!!!!!!!!!!!!
SELECT * from Customers;
-- !!!!!!!!!!!!!!!!!!!!!! Select All Data in Accounts Table !!!!!!!!!!!!!!!!!!!!!!
SELECT * from Accounts;

-- !!!!!!!!!!!!!!!!!!!!!! Select All Data in Accounts,Customers and Transactions  Table !!!!!!!!!!!!!!!!!!!!!!
SELECT * from Transactions order by timestamp;
SELECT T.type,T.amount ,T.timestamp ,A.balance,C.name,C.id,C.email from Transactions T join Accounts A on T.account_id=A.id join Customers C on A.customer_id=C.id order by T.timestamp;




-- !!!!!!!!!!!!!!!!!!!!!! Select All Data in Accounts and Customers Table !!!!!!!!!!!!!!!!!!!!!!
SELECT A.id,A.balance,A.type,C.name from Accounts A join Customers C on A.customer_id=C.id WHERE A.id='23C58580-1517-4A61-9DC6-A704A70303E0';



-- !!!!!!!!!!!!!!!!!!!!!! Create a Function to get Account Info !!!!!!!!!!!!!!!!!!!!!!
GO
Create Function GetAccountDetails( @accountID VARCHAR(40))
RETURNS table
as
RETURN (SELECT A.id,A.balance,A.type,C.name from Accounts A join Customers C on A.customer_id=C.id WHERE A.id=@accountID)
GO


SELECT * from dbo.GetAccountDetails('23C58580-1517-4A61-9DC6-A704A70303E0')


-- !!!!!!!!!!!!!!!!!!!!!! Create a Function to get Account Balance !!!!!!!!!!!!!!!!!!!!!!
GO
Create Function GetBalance(@accountID VARCHAR(40))
RETURNS DECIMAL(10,2)
as
BEGIN
    RETURN  (SELECT balance from Accounts WHERE id=@accountID)
END
GO


SELECT dbo.GetBalance('23C58580-1517-4A61-9DC6-A704A70303E0')




-- !!!!!!!!!!!!!!!!!!!!!! Create a Procedure to Deposit Ammount !!!!!!!!!!!!!!!!!!!!!!
GO

ALTER Procedure Deposit(@accountID VARCHAR(40),@amount DECIMAL(10,2))
as
BEGIN
    begin transaction;
    begin try

            IF @amount <=0
            begin
                print 'Deposit Amount Must be Grater then Zero !!'
				return;
            END

            DECLARE @balance DECIMAL(10,2);
            SELECT @balance =dbo.GetBalance(@accountID);

            update Accounts set balance =@balance + @amount WHERE id = @accountID;

            INSERT into Transactions(account_id,type,amount) VALUES (@accountID,'Deposit',@amount);

            commit transaction;

            print 'Deposit Successful';
    END try
    
    begin catch
    
    if @@TRANCOUNT > 0 
    begin
        print 'Somthing Went Wrong to Deposit Ammount';
        rollback transaction;
    end
    end catch
END

-- !!!!!!!!!!!!!!!!!!!!!! Call a Procedure to Deposit Ammount !!!!!!!!!!!!!!!!!!!!!!
EXEC Deposit '0D7FBEA3-F5AE-44BD-A2FB-44D7DAFAE852',5000;






--  Task : Create a Procedure to Withdrow Ammount !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


GO
ALTER PROCEDURE Withdrow(@accountId varchar(40),@amount INT)
AS
BEGIN
    BEGIN TRY
    BEGIN TRANSACTION
        IF @amount <=0
        BEGIN
            print 'Withdrow Amount Must be Grater then Zero !!'
            return;
        END
            DECLARE @balance DECIMAL(10,2);
            SELECT @balance =dbo.GetBalance(@accountID);

            IF @balance  < @amount
            BEGIN
                print 'Insufficient Balance!!'
                RETURN;
            END

            update Accounts set balance =@balance - @amount WHERE id = @accountID;

            INSERT into Transactions(account_id,type,amount) VALUES (@accountID,'Withdrow',@amount);

            commit transaction;

            print 'Withdrow Successful';
    END try
    BEGIN CATCH
    
    if @@TRANCOUNT > 0 
    begin
        print 'Somthing Went Wrong to Withdrow Ammount';
        rollback transaction;
    END
    END CATCH
END

go

SELECT * FROM Accounts;
-- 35774216-BC72-40B5-9F29-0DEE88294522

EXEC Withdrow "35774216-BC72-40B5-9F29-0DEE88294522",5000;


GO
CREATE PROCEDURE Transfer(@senderAccountID VARCHAR(40),@reciverAccountID varchar(40),@amount INT)
AS
BEGIN
    BEGIN TRANSACTION
        BEGIN TRY
            IF @amount <=0
            BEGIN
                print 'Transfer Amount Must be Grater then Zero !!'
                return;
            END
            DECLARE @senderBlanace DECIMAL(10,2),@reciverBlanace DECIMAL(10,2);

            SELECT @senderBlanace= DBO.GetBalance(@senderAccountID);

            IF @senderBlanace < @amount
            BEGIN
                print 'Insufficient Balance!!'
                RETURN;
            END
            UPDATE Accounts SET balance=@senderBlanace - @amount WHERE id=@senderAccountID;

            SELECT @reciverBlanace= dbo.GetBalance(@reciverAccountID);

            UPDATE Accounts SET balance=@reciverBlanace + @amount WHERE id=@reciverAccountID;

            INSERT INTO Transactions(account_id,type,amount) VALUES (@senderAccountID,'Transfer',@amount);
            INSERT INTO Transactions(account_id,type,amount) VALUES (@reciverAccountID,'Recived',@amount);

            COMMIT TRANSACTION;
            print 'Transfer Successful';
        END TRY
        BEGIN CATCH
        IF @@TRANCOUNT > 0 
            BEGIN
                print 'Somthing Went Wrong to Transfer Ammount';
                rollback transaction;
            END
        END CATCH 
END

GO

-- Sender id =0D7FBEA3-F5AE-44BD-A2FB-44D7DAFAE852
-- Reciver id =8577D86E-5E5D-4753-B120-8181FF87A5F3

EXECUTE Transfer '0D7FBEA3-F5AE-44BD-A2FB-44D7DAFAE852','8577D86E-5E5D-4753-B120-8181FF87A5F3', 1000;

SELECT * from Transactions ORDER BY timestamp DESC;

SELECT C.name,C.email,A.type,T.amount,T.type from Transactions T JOIN Accounts A on T.account_id = a.id JOIN Customers C on A.customer_id=C.id WHERE a.id='0D7FBEA3-F5AE-44BD-A2FB-44D7DAFAE852'; 