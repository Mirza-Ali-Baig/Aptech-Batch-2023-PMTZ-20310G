# **SQL Course Class 04**


## **Overview** 📝  
In this class, students will explore advanced SQL techniques, focusing on **aggregate functions, grouping, filtering, sorting, and identity columns**. These concepts are essential for efficient data management and reporting.

---

## **Topics Covered** 🛠️  
- **IDENTITY Columns:** Auto-incrementing primary keys.  
- **TOP & PERCENT:** Retrieve a limited number or percentage of rows.  
- **ORDER BY:** Sort query results in ascending or descending order.  
- **DISTINCT:** Eliminate duplicate values from result sets.  
- **AGGREGATE Functions:** Perform calculations on data (COUNT, MAX, MIN, SUM, AVG).  
- **GROUP BY & HAVING:** Group data and filter aggregated results.  
- **ALIAS:** Rename columns or calculations for better readability.

---

## **SQL Script for Class 04**

### **1. Database Creation & Selection**
```sql
CREATE DATABASE pmtz_202310g_class_04;
USE pmtz_202310g_class_04;
```

---

### **2. Table with IDENTITY Column**  
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    designation VARCHAR(15) NOT NULL,
    department VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(6) NOT NULL,
    salary INT
);
```

---

### **3. Insert Sample Data**
```sql
INSERT INTO employees (name, email, designation, department, age, gender, salary) VALUES
('Ali Khan', 'ali.khan@example.com', 'Manager', 'Sales', 35, 'Male', 70000),
('Fatima Ali', 'fatima.ali@example.com', 'Engineer', 'IT', 28, 'Female', 60000),
('Ahmed Raza', 'ahmed.raza@example.com', 'Analyst', 'Finance', 32, 'Male', 50000),
('Ayesha Malik', 'ayesha.malik@example.com', 'Developer', 'IT', 30, 'Female', 65000),
('Usman Tariq', 'usman.tariq@example.com', 'Consultant', 'HR', 29, 'Male', 55000);
-- (More rows available in full script)
```

---

### **4. Data Retrieval Examples**
```sql
SELECT * FROM employees;
```

---

### **5. TOP & PERCENT Queries**
```sql
-- Retrieve top 5 employees
SELECT TOP 5 * FROM employees;

-- Retrieve top 10% employees
SELECT TOP 10 PERCENT * FROM employees;
```

---

### **6. ORDER BY Sorting**
```sql
-- Order by salary (ascending)
SELECT * FROM employees ORDER BY salary;

-- Order by salary (descending)
SELECT * FROM employees ORDER BY salary DESC;

-- Order by name (ascending)
SELECT * FROM employees ORDER BY name ASC;
```

---

### **7. DISTINCT Query**
```sql
-- Retrieve distinct departments
SELECT DISTINCT department FROM employees;
```

---

### **8. Aggregate Functions**
```sql
-- COUNT examples
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM employees WHERE department = 'IT';

-- MAX and MIN examples
SELECT MAX(age) FROM employees;
SELECT MIN(salary) FROM employees;

-- SUM and AVG examples
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
```

---

### **9. GROUP BY Queries**
```sql
-- Group employees by department
SELECT COUNT(*), department FROM employees GROUP BY department;

-- Group by both designation and department
SELECT COUNT(*), designation, department FROM employees GROUP BY designation, department;
```

---

### **10. HAVING Clause**
```sql
-- Filter groups with more than 2 employees
SELECT COUNT(*), department 
FROM employees 
GROUP BY department 
HAVING COUNT(*) >= 2;

-- Filter by salary with HAVING
SELECT COUNT(*), name, salary 
FROM employees 
GROUP BY name, salary 
HAVING MAX(salary) > 60000;
```

---

### **11. ALIAS for Readability**
```sql
-- Use alias to rename columns in result
SELECT COUNT(*) AS 'Total Employees', department 
FROM employees 
GROUP BY department 
HAVING COUNT(*) >= 2;
```

---

## **Project Structure & Key Learnings** 📚  

- **Database:** `pmtz_202310g_class_04`
- **Table:** `employees`
- **Key Learnings:**
  1. **Identity Columns:** Automate primary key assignment.
  2. **Aggregate Functions:** Perform group calculations (COUNT, SUM, etc.).
  3. **TOP & PERCENT:** Retrieve limited rows efficiently.
  4. **GROUP BY and HAVING:** Aggregate and filter group results.

---

## **Conclusion** ✅  
This class covers essential SQL operations for managing and analyzing data. Students will learn how to use aggregate functions, group data effectively, and retrieve targeted results with **TOP/PERCENT**. These skills are crucial for **reporting and business intelligence tasks**.