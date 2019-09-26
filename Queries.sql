# SQL Homework - Employee Database: A Mystery in Two Parts


-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender,  s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;


-- employees hired in 1987

SELECT emp_no, last_name, first_name, gender, hire_date 
FROM employees
WHERE hire_date BETWEEN'1987-01-01' AND'1987-12-31';

-- OR

SELECT emp_no, last_name, first_name, gender, hire_date 
FROM employees
WHERE extract (year from hire_date)='1987';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, s.from_date, s.to_date
FROM  departments as d
INNER JOIN dept_manager as dm
ON d.dept_no=dm.dept_no
INNER JOIN employees as e
ON dm.emp_no=e.emp_no
INNER JOIN salaries as s
ON e.emp_no=s.emp_no
ORDER BY d.dept_no;

-- List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp de
ON de.emp_no=e.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
ORDER BY e.last_name;

-- List all employees whose first name is "Duangkaew" and last names begin with "P."

SELECT * FROM employees
WHERE first_name='Duangkaew' and left(last_name,1)='P';

-- List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales'
ORDER BY e.last_name;

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development'
ORDER BY e.last_name;


-- In ascending order, list the frequency count of employee last names, i.e., how many employees share 
-- each last name.

SELECT last_name,COUNT(*) as count 
FROM employees 
GROUP BY last_name 
ORDER BY count;

-- Boss' comments:
-- Follwoing SQL query showed something special about emp# 499942; i.e. April Foolsday

SELECT* FROM employees WHERE emp_no = 499942; 
