/*
Consider two tables, employees_2023 and employees_2024, with the same structure,
find the employees who were in employees_2023 but not in employees_2024.
*/

CREATE DATABASE SQLMinustutorial

---create the tables

CREATE TABLE employees_2023 (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(100),
	dept VARCHAR(50)
);

-----Create the second table
CREATE TABLE employees_2024 (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(100),
	dept VARCHAR(50)
);

Select * from employees_2023;
select * from employees_2024


----Populates the two tables 

INSERT INTO employees_2023 (emp_id, emp_name, dept)
VALUES (101, 'Alice', 'HR'),
       (102, 'Bob', 'IT'),
	   (103, 'Smith', 'Marketing');
---second table
INSERT INTO employees_2024(emp_id, emp_name, dept)
VALUES (102, 'Bob', 'IT'),
       (103, 'Smith', 'Marketing'),
	   (104, 'Wilson', 'Marketing');

SELECT emp_id, emp_name, dept
FROM employees_2023

EXCEPT
SELECT emp_id, emp_name, dept
FROM employees_2024;