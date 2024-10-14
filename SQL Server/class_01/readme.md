# SQL Course - Introduction to SQL

## Introduction to SQL

SQL (Structured Query Language) is a standard programming language used for managing and manipulating relational databases. It allows users to perform a variety of tasks including data retrieval, insertion, updating, and deletion. SQL is essential for database administrators, developers, and anyone involved with data management.

### What is SQL?

SQL is a domain-specific language designed for working with relational databases. It provides a set of commands that enable users to interact with the database, making it possible to create, modify, and query data efficiently.

### Why Use SQL?

1. **Data Management**: SQL simplifies data management by providing a systematic way to access and manipulate data.
2. **Data Integrity**: SQL supports data integrity through constraints, ensuring that the data stored in the database remains accurate and consistent.
3. **Ease of Use**: SQL's syntax is relatively easy to learn and understand, making it accessible for beginners and experienced developers alike.
4. **Powerful Queries**: SQL allows for complex queries to retrieve specific data from large datasets, making data analysis straightforward.
5. **Cross-Platform**: SQL is supported by various relational database management systems (RDBMS), including MySQL, PostgreSQL, Microsoft SQL Server, and Oracle.

## SQL Commands Example

### Create a Database

To create a new database, use the following command:

```sql
CREATE DATABASE pmtz_202310g_class_01;
```

### Create a Table

To create a table within the database, use the `CREATE TABLE` statement:

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(30),
    email VARCHAR(30),
    age INT,
    gender VARCHAR(6),
    subject VARCHAR(10)
);
```

### Insert Data into the Table

#### Single Value Insertion

To insert a single student's record:

```sql
INSERT INTO students (id, name, email, age, gender, subject) 
VALUES (1, 'Basit', 'basit@gmail.com', 20, 'Male', 'English');
```

#### Multiple Values Insertion

To insert multiple student records at once:

```sql
INSERT INTO students (id, name, email, age, gender, subject) VALUES
    (2, 'Khan', 'khan@gmail.com', 22, 'Male', 'Urdu'),
    (3, 'Fatima', 'fatima@gmail.com', 18, 'Female', 'Physics'),
    (4, 'Kashif', 'kashif@gmail.com', 24, 'Male', 'English');
```

### Select Command

To retrieve data from the table, you can use the `SELECT` statement.

#### All Columns

To select all columns:

```sql
SELECT * FROM students;
```

#### Specific Columns

To select specific columns:

```sql
SELECT name, email FROM students;
```

### Update Data

#### Update a Single Value

To update a specific student's age:

```sql
UPDATE students
SET age = 23 
WHERE name = 'Khan';
```

#### Update Multiple Values

To update multiple fields for a student:

```sql
UPDATE students
SET age = 23, subject = 'Chemistry' 
WHERE name = 'Khan';

UPDATE students
SET age = 20, subject = 'English' 
WHERE id = 1 OR id = 3;
```

### Delete Students

To delete records based on a condition:

```sql
DELETE FROM students 
WHERE gender = 'Female';
```

### Truncate Table

To remove all records from a table without logging individual row deletions:

```sql
TRUNCATE TABLE students;
```

### Drop Table

To delete the table completely:

```sql
DROP TABLE students;
```

### Drop Database

To delete the entire database:

```sql
DROP DATABASE pmtz_202310g_class_01;
```

## Conclusion

SQL is a powerful tool for managing and manipulating relational databases. Understanding SQL commands allows you to effectively create databases, manage data, and perform complex queries. Mastering SQL is essential for anyone looking to work in data analysis, software development, or database administration. As you continue to practice and apply these concepts, you will become proficient in SQL and data management.