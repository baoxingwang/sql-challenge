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
