CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(100)
);
CREATE TABLE Location (
    location_id INT,
    location VARCHAR(30)
);
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);
ALTER TABLE Departments
ADD PRIMARY KEY (department_id);
ALTER TABLE Location
ADD PRIMARY KEY (location_id);
ALTER TABLE Employees
ADD PRIMARY KEY (employee_id);
DESC Departments;
DESC Location;
DESC Employees;
ALTER TABLE Employees
ADD email VARCHAR(100);
ALTER TABLE Employees
MODIFY designation VARCHAR(200);
ALTER TABLE Employees
DROP COLUMN age;
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
RENAME TABLE Departments TO Departments_Info;
TRUNCATE TABLE Employees;
SELECT * FROM Employees;
DROP TABLE Employees;
DROP DATABASE employee;
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
DESC Departments;
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);
DESC Locations;
RENAME TABLE Location TO Locations;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('M', 'F')),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
DESC Employees;
SELECT * FROM Employees ;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT DATABASE();
SHOW TABLES;

-- ASSIGNMENT 2
SELECT DISTINCT salary
FROM Employees;

SELECT
    age AS Employee_Age,
    salary AS Employee_Salary
FROM Employees;

SELECT *
FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';

SELECT *
FROM Employees
WHERE designation IS NULL;

SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;

UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT *
FROM Employees
WHERE hire_date >= '2018-01-01'
  AND hire_date < '2019-01-01'
ORDER BY hire_date ASC
LIMIT 5;

SELECT SUM(salary) AS Total_Salary
FROM Employees
WHERE department_id = 7;

SELECT MIN(age) AS Minimum_Age
FROM Employees;

SELECT location_id, MAX(salary) AS Maximum_Salary
FROM Employees
GROUP BY location_id;

SELECT designation, AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT e.employee_name, e.designation, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

SELECT l.location, e.employee_name
FROM Employees e
RIGHT JOIN Locations l
ON e.location_id = l.location_id;