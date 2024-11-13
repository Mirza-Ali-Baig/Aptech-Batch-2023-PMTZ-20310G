# 🏦 Class 13: Bank Management System with Transactions

## 📚 Topics Covered
1. 🛠️ **Transactions in SQL**
2. 🎯 **Error Handling with `TRY/CATCH`**

## 📝 Class Summary
In this session, we built a basic **Bank Management System** using SQL. The project focused on managing customers, accounts, and transactions within a database, incorporating transactional integrity and error handling. We implemented **stored procedures** for handling deposits, withdrawals, and transfers between accounts, showcasing the importance of transaction management and error handling in SQL.

---

## 💻 Project Breakdown

### Database and Table Setup
1. **Create Database**: `pmtz_202310g_class_13`
   ```sql
   CREATE DATABASE pmtz_202310g_class_13;
   USE pmtz_202310g_class_13;
   ```

2. **Customers Table**: Stores customer information.
   ```sql
   CREATE TABLE Customers(
       id VARCHAR(40) PRIMARY KEY DEFAULT NEWID(),
       name VARCHAR(255) NOT NULL,
       email VARCHAR(255) NOT NULL,
       address VARCHAR(255) NOT NULL,
       phone_number VARCHAR(20) NOT NULL
   );
   ```

3. **Accounts Table**: Stores account information with foreign key `customer_id`.
   ```sql
   CREATE TABLE Accounts(
       id VARCHAR(40) PRIMARY KEY DEFAULT NEWID(),
       customer_id VARCHAR(40) NOT NULL,
       balance DECIMAL(10, 2) NOT NULL,
       type VARCHAR(255) NOT NULL DEFAULT 'Current',
       FOREIGN KEY (customer_id) REFERENCES Customers(id)
   );
   ```

4. **Transactions Table**: Records transactions, referencing `account_id`.
   ```sql
   CREATE TABLE Transactions(
       id VARCHAR(40) PRIMARY KEY DEFAULT NEWID(),
       account_id VARCHAR(40) NOT NULL,
       type VARCHAR(255) NOT NULL,
       amount DECIMAL(10, 2) NOT NULL,
       timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (account_id) REFERENCES Accounts(id)
   );
   ```

---

## 📈 Data Insertion

1. **Insert Customer Records**: Sample customers added to `Customers` table.
2. **Insert Account Records**: Accounts linked to customers using `customer_id`.
3. **Transaction Entries**: Transaction entries are automatically added during deposit, withdrawal, or transfer operations.

---

## 🔧 Functions and Procedures

### Functions
1. **Get Account Details**: Retrieve account details by `accountID`.
   ```sql
   CREATE FUNCTION GetAccountDetails(@accountID VARCHAR(40))
   RETURNS TABLE
   AS RETURN (
       SELECT A.id, A.balance, A.type, C.name
       FROM Accounts A
       JOIN Customers C ON A.customer_id = C.id
       WHERE A.id = @accountID
   );
   ```

2. **Get Account Balance**: Retrieve account balance for a specific `accountID`.
   ```sql
   CREATE FUNCTION GetBalance(@accountID VARCHAR(40))
   RETURNS DECIMAL(10,2)
   AS BEGIN
       RETURN (SELECT balance FROM Accounts WHERE id = @accountID);
   END;
   ```

### Procedures
1. **Deposit Procedure**: Deposits amount into an account and logs the transaction.
   ```sql
   ALTER PROCEDURE Deposit(@accountID VARCHAR(40), @amount DECIMAL(10,2))
   AS BEGIN
       BEGIN TRANSACTION;
       BEGIN TRY
           IF @amount <= 0
               PRINT 'Deposit Amount Must be Greater than Zero!';
           ELSE BEGIN
               DECLARE @balance DECIMAL(10,2);
               SELECT @balance = dbo.GetBalance(@accountID);

               UPDATE Accounts SET balance = @balance + @amount WHERE id = @accountID;
               INSERT INTO Transactions(account_id, type, amount) VALUES (@accountID, 'Deposit', @amount);

               COMMIT TRANSACTION;
               PRINT 'Deposit Successful';
           END
       END TRY
       BEGIN CATCH
           IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           PRINT 'Error in Deposit Transaction';
       END CATCH;
   END;
   ```

2. **Withdraw Procedure**: Withdraws amount from an account if funds are sufficient.
   ```sql
   ALTER PROCEDURE Withdraw(@accountID VARCHAR(40), @amount DECIMAL(10,2))
   AS BEGIN
       BEGIN TRANSACTION;
       BEGIN TRY
           IF @amount <= 0
               PRINT 'Withdraw Amount Must be Greater than Zero!';
           ELSE BEGIN
               DECLARE @balance DECIMAL(10,2);
               SELECT @balance = dbo.GetBalance(@accountID);

               IF @balance < @amount
                   PRINT 'Insufficient Balance!';
               ELSE BEGIN
                   UPDATE Accounts SET balance = @balance - @amount WHERE id = @accountID;
                   INSERT INTO Transactions(account_id, type, amount) VALUES (@accountID, 'Withdraw', @amount);

                   COMMIT TRANSACTION;
                   PRINT 'Withdraw Successful';
               END
           END
       END TRY
       BEGIN CATCH
           IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           PRINT 'Error in Withdraw Transaction';
       END CATCH;
   END;
   ```

3. **Transfer Procedure**: Transfers amount from sender’s account to receiver’s account.
   ```sql
   CREATE PROCEDURE Transfer(@senderAccountID VARCHAR(40), @receiverAccountID VARCHAR(40), @amount DECIMAL(10,2))
   AS BEGIN
       BEGIN TRANSACTION;
       BEGIN TRY
           IF @amount <= 0
               PRINT 'Transfer Amount Must be Greater than Zero!';
           ELSE BEGIN
               DECLARE @senderBalance DECIMAL(10,2), @receiverBalance DECIMAL(10,2);
               SELECT @senderBalance = dbo.GetBalance(@senderAccountID);

               IF @senderBalance < @amount
                   PRINT 'Insufficient Balance!';
               ELSE BEGIN
                   UPDATE Accounts SET balance = @senderBalance - @amount WHERE id = @senderAccountID;
                   UPDATE Accounts SET balance = @receiverBalance + @amount WHERE id = @receiverAccountID;

                   INSERT INTO Transactions(account_id, type, amount) VALUES (@senderAccountID, 'Transfer', @amount);
                   INSERT INTO Transactions(account_id, type, amount) VALUES (@receiverAccountID, 'Received', @amount);

                   COMMIT TRANSACTION;
                   PRINT 'Transfer Successful';
               END
           END
       END TRY
       BEGIN CATCH
           IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           PRINT 'Error in Transfer Transaction';
       END CATCH;
   END;
   ```

---

## 🔎 Data Retrieval Examples
Retrieve data to verify transactions, balances, and customer information:

- **View All Customers**:
  ```sql
  SELECT * FROM Customers;
  ```

- **View All Accounts**:
  ```sql
  SELECT * FROM Accounts;
  ```

- **View All Transactions**:
  ```sql
  SELECT * FROM Transactions ORDER BY timestamp DESC;
  ```

- **View Transactions by Customer**:
  ```sql
  SELECT C.name, C.email, A.type, T.amount, T.type
  FROM Transactions T
  JOIN Accounts A ON T.account_id = A.id
  JOIN Customers C ON A.customer_id = C.id
  WHERE A.id = '0D7FBEA3-F5AE-44BD-A2FB-44D7DAFAE852';
  ```

---

## 🎉 Conclusion
This session taught us how to implement a robust Bank Management System in SQL, emphasizing the importance of transactions and error handling. We also covered `TRY/CATCH` for managing errors gracefully, ensuring reliable and consistent data management.