-- Create the database first.

CREATE DATABASE employees;

\c employees; -- PostgreSQL

-- 按照实验报告要求编写SQL语句

-- 3
-- 用SQL创建关系表
CREATE TABLE employees(
	id	SERIAL NOT NULL PRIMARY KEY,
	emp_no	INT	NOT NULL,
	birth_date	DATE,
	first_name	VARCHAR(30),
	last_name	VARCHAR(30),
	gender	CHAR(1),
	hire_date	DATE
);

CREATE TABLE titles(
	id	SERIAL NOT NULL PRIMARY KEY,
	emp_no	INT NOT NULL,
	title	VARCHAR(50),
	from_date	DATE,
	to_date		DATE
);

CREATE TABLE salaries(
	id	SERIAL NOT NULL PRIMARY KEY ,
	emp_no	INT NOT NULL,
	salary	INT,
	from_date	DATE,
	to_date		DATE
);

CREATE TABLE departments(
	id	SERIAL NOT NULL PRIMARY KEY ,
	dept_no	VARCHAR(5),
	dept_name VARCHAR(50)
);

CREATE TABLE dept_emp(
	id SERIAL NOT NULL PRIMARY KEY ,
	emp_no INT,
	dept_no VARCHAR(5),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager(
	id SERIAL NOT NULL PRIMARY KEY ,
	dept_no varchar(5),
	manger_no INT,
	from_date DATE,
	to_date DATE
);

-- 测试创建的空表
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM titles;
SELECT * FROM salaries;

-- 4
COPY employees(emp_no, birth_date, first_name, last_name, gender, hire_date) FROM 'D:\tmp\data_employees.txt' (FORMAT 'text',DELIMITER ',');
COPY titles(emp_no, title, from_date, to_date) FROM 'D:\tmp\data_titles.txt' (FORMAT 'text',DELIMITER ',');
COPY salaries(emp_no, salary, from_date, to_date) FROM 'D:\tmp\data_salaries.txt' (FORMAT 'text',DELIMITER ',');
COPY departments(dept_no, dept_name) FROM 'D:\tmp\data_departments.txt' (FORMAT 'text',DELIMITER ',');
COPY dept_emp(emp_no, dept_no, from_date, to_date) FROM 'D:\tmp\data_dept_emp.txt' (FORMAT 'text',DELIMITER ',');
COPY dept_manager(dept_no, manger_no, from_date, to_date) FROM 'D:\tmp\data_dept_manager.txt' (FORMAT 'text',DELIMITER ',');

-- 测试导入数据之后的表
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(*) FROM dept_manager;
SELECT COUNT(*) FROM titles;
SELECT COUNT(*) FROM salaries;

-- 5.1
SELECT * FROM employees LIMIT 10;

-- 5.2
SELECT emp_no,birth_date, gender, hire_date FROM employees WHERE first_name = 'Peternela' AND last_name = 'Anick';

-- 5.3
SELECT emp_no,birth_date, first_name, last_name FROM employees WHERE birth_date >= '1961-07-15' AND birth_date <= '1961-07-20';

-- 5.4
SELECT * FROM employees WHERE first_name LIKE 'Peter%' OR last_name LIKE 'Peter%';

-- 5.5
SELECT salary as max_salary FROM salaries ORDER BY salary desc limit 1;

-- 5.6


-- 5.7


-- 5.8


-- 5.9


-- 5.10

		
-- 5.11


-- 5.12


-- 5.13


-- 5.14


-- 5.15


-- 5.16


-- 5.17


-- 5.18

