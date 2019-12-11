--------------------------------------
--Build database
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR 
);


CREATE TABLE employees (
	emp_no VARCHAR PRIMARY KEY,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_data VARCHAR
);

CREATE TABLE dept_emp (
	emp_no VARCHAR NOT NULL REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no),
	from_date VARCHAR,
	to_date VARCHAR
);
-- SELECT * FROM departments;

CREATE TABLE dept_manager(

	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	emp_no VARCHAR NOT NULL REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no),
	from_date VARCHAR,
	to_date VARCHAR
);
-- DROP TABLE dept_manager;
-- SELECT * FROM dept_manager;

CREATE TABLE salaries (
	emp_no VARCHAR PRIMARY KEY NOT NULL REFERENCES employees(emp_no),
	salary INTEGER,
	from_date VARCHAR,
	to_date VARCHAR
);

CREATE TABLE titles (
	
	emp_no VARCHAR REFERENCES employees(emp_no),
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR

);


-- ALTER TABLE titles
-- ADD COLUMN emp_no VARCHAR REFERENCES employees(emp_no);
-- SELECT * FROM titles;
-- DROP TABLE titles;


-- select  titles.title, employees.first_name
-- from employees
-- left join titles on employees.emp_no = titles.emp_no ;

-------------------------------------------------------------------
--Question 1
SELECT employees.emp_no, first_name, last_name, gender, salary
FROM employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- SELECT count(*) FROM employees;
-- SELECT count(*) FROM salaries;
-- SELECT count(*) FROM titles;

-- SELECT * FROM employees;
-----------------------------------
--Question 2
SELECT * 
FROM employees
WHERE hire_data LIKE '%1986%'
;


-- SELECT * FROM dept_manager;
-- SELECT * FROM departments;

-------------------------------------------------
--Question3
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, first_name, last_name,
	dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
;


-------------------------------------------------------
--Question 4
SELECT e.emp_no, last_name, first_name, dept_name 
FROM departments AS d
INNER JOIN dept_emp AS de
	ON de.dept_no = d.dept_no
INNER JOIN employees AS e
	ON e.emp_no = de.emp_no;



--------------------------------------------------------------
--Question 5
SELECT * FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
	;


-------------------------------------------
--Question 6
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name 
FROM dept_emp AS d_e
INNER JOIN employees AS e
	ON d_e.emp_no = e.emp_no
	
INNER JOIN departments AS d
	ON d_e.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales';

-------------------------------------------------
--Question 7

SELECT e.emp_no, e.last_name, e.first_name,d.dept_name 
FROM dept_emp AS d_e
INNER JOIN employees AS e
	ON d_e.emp_no = e.emp_no
	
INNER JOIN departments AS d
	ON d_e.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-------------------------------------------------
--Question 8
SELECT last_name,
	count(last_name) AS name_frequency
FROM employees AS e
GROUP BY last_name
ORDER BY name_frequency DESC




------------------
SELECT t.title,s.salary
FROM "salaries" AS s
INNER JOIN "titles" AS t
ON t.emp_no = s.emp_no;


