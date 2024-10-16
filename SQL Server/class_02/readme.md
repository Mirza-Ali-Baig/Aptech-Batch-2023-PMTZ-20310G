# SQL Course - Class 2

## Overview

In this class, we explored various SQL concepts, including constraints, conditions, and advanced filtering techniques. This document summarizes the key topics and examples demonstrated during the session.

## Key Concepts

### 1. Database Creation

Create a new database for this class:

```sql
CREATE DATABASE pmtz_202310g_class_02;
USE pmtz_202310g_class_02;
```

### 2. Constraints

Constraints ensure the integrity of the data within the database. Key constraints include:

- **NOT NULL**: Ensures that a column cannot have a NULL value.
- **UNIQUE**: Ensures all values in a column are different.
- **CHECK**: Ensures that all values in a column satisfy a specific condition.
- **DEFAULT**: Sets a default value for a column when no value is specified.
- **PRIMARY KEY**: Uniquely identifies each row in a table.
- **FOREIGN KEY**: Ensures referential integrity between two tables.

#### Example of Creating a Table with Constraints

```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price INT NOT NULL CHECK(price >= 5),
    quantity INT NOT NULL CHECK(quantity > 0) DEFAULT 1
);
```

### 3. Inserting Data

Insert sample data into the `products` table:

```sql
INSERT INTO products (id, title, price, quantity) VALUES
(1, 'Wireless Mouse', 25, 10),
(2, 'Bluetooth Headphones', 70, 5),
(3, 'USB-C Charging Cable', 15, 20),
-- (Additional records...)
(50, 'Kitchen Scale', 20, 15);
```

### 4. Select Command

Retrieve data from the `products` table:

```sql
SELECT * FROM products;
```

### 5. Relational Operators

Relational operators are used to filter records based on conditions:

- **=**: Equal
- **!=**: Not Equal
- **>**: Greater than
- **<**: Less than
- **>=**: Greater than or equal to
- **<=**: Less than or equal to

#### Examples of Using WHERE Clause

```sql
SELECT * FROM products WHERE quantity = 3;
SELECT * FROM products WHERE price != 30;
SELECT * FROM products WHERE price > 50;
SELECT * FROM products WHERE price < 80;
```

### 6. Logical Operators

Logical operators are used to combine multiple conditions:

- **AND**: All conditions must be true.
- **OR**: At least one condition must be true.
- **NOT**: Negates a condition.

#### Examples

```sql
SELECT * FROM products WHERE price > 10 AND quantity = 4;
SELECT * FROM products WHERE title = 'Phone Case' OR title = 'Streaming Microphone';
```

### 7. Advanced Filtering

#### IN Operator

Use the `IN` operator to filter records that match a list of values:

```sql
SELECT * FROM products WHERE title IN ('Phone Case', 'Streaming Microphone');
```

#### BETWEEN Operator

Use the `BETWEEN` operator to filter records within a range:

```sql
SELECT * FROM products WHERE price BETWEEN 10 AND 100;
```

#### LIKE Operator

The `LIKE` operator is used for pattern matching:

- `%`: Represents any number of characters.
- `_`: Represents a single character.

#### Examples

```sql
SELECT * FROM products WHERE title LIKE 'A%';  -- Titles starting with 'A'
SELECT * FROM products WHERE title LIKE '%r';  -- Titles ending with 'r'
SELECT * FROM products WHERE title LIKE 'f%r';  -- Titles starting with 'f' and ending with 'r'
```

### 8. Wildcard Searches

You can use wildcards to filter results based on patterns:

```sql
SELECT * FROM products WHERE title LIKE '__________';  -- Titles with exactly 10 characters
SELECT * FROM products WHERE title LIKE '____a%';  -- Titles with 4 characters followed by 'a'
```

## Conclusion

In this class, we covered fundamental SQL concepts including constraints, relational and logical operators, and advanced filtering techniques. Mastering these concepts is essential for effective data manipulation and analysis in SQL. Continue practicing these examples to enhance your skills!