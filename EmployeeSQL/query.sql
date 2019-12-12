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