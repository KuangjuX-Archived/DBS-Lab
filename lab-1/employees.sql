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
SELECT dept_no, COUNT(dept_no) AS dept_emp_count FROM dept_emp GROUP BY dept_no;

-- 5.7
SELECT 
employees.emp_no, 
dept_emp.dept_no,
dept_emp.from_date
FROM employees, dept_emp
WHERE employees.first_name = 'Peternela' 
AND employees.last_name = 'Anick' 
AND employees.emp_no=dept_emp.emp_no;

-- 5.8
SELECT 
employees_1.emp_no,
employees_2.emp_no,
employees_1.first_name,
employees_1.last_name
FROM employees AS employees_1, employees AS employees_2 
WHERE employees_1.first_name = employees_2.first_name
AND employees_1.last_name = employees_2.last_name
AND employees_1.emp_no != employees_2.emp_no;


-- 5.9
SELECT emp_no FROM employees WHERE first_name = 'Margo' AND last_name = 'Anily'
UNION
SELECT emp_no FROM employees WHERE birth_date = '1959-10-30' AND hire_date = '1989-09-12';

-- 5.10
SELECT dept_name FROM departments
WHERE dept_no = (
	SELECT dept_no FROM dept_emp
	WHERE emp_no = (
		SELECT emp_no FROM employees
		WHERE first_name = 'Margo' AND last_name = 'Anily'
	)
);

		
-- 5.11
SELECT dept_name FROM 
(departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no)
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE employees.first_name = 'Margo' AND employees.last_name = 'Anily';


-- 5.12
SELECT emp_no, first_name, last_name FROM employees
WHERE NOT EXISTS(
	SELECT * FROM dept_emp
	WHERE NOT EXISTS(
		SELECT * FROM departments
		WHERE departments.dept_no = dept_emp.dept_no 
		AND employees.emp_no = dept_emp.emp_no
	)
);

-- 5.13
SELECT dept_emp.dept_no, MAX(departments.dept_name), COUNT(dept_emp.emp_no)
FROM dept_emp, departments
WHERE departments.dept_no = dept_emp.dept_no
GROUP BY dept_emp.dept_no HAVING COUNT(emp_no) > 50000;


-- 5.14
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES(10000, '1981-10-01', 'Jimmy', 'Lin', 'M', '2011-12-08');


-- 5.15
UPDATE employees SET first_name = 'Jim' WHERE emp_no = 10000;

-- 5.16
DELETE FROM employees WHERE emp_no = 10000;

-- 5.17
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES(10001, '1981-10-1', 'Jimmy', 'Lin', 'M', '2011-12-8');
由于我使用id作为主键，会执行成功；但如果使用emp_no作为主键则会先删除相应的行再插入新行。

-- 5.18
DELETE FROM employees WHERE emp_no = 10001;
删除新行