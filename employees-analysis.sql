-- 1. List employee number, last name, first name, sex and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- 2. List first name, last name and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List manager, dept number, dept name, employee number, last name and first name
SELECT t.title, d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM employees AS e
INNER JOIN titles AS t ON t.title_id = e.emp_title_id
INNER JOIN dept_manager as dm ON e.emp_no = dm.emp_no
INNER JOIN departments as d ON dm.dept_no = d.dept_no
WHERE t.title = 'Manager'

-- 4. List dept. number of each employee with employee number, last name, first name and dept. name
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON d.dept_no = de.dept_no;

-- 5. List first name, last name and sex of employees whose first name is Hercules and last name begins with B
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. Employees in sales department, their employee number, last name and first name
SELECT e.emp_no, e.last_name, e.first_name FROM employees AS e
INNER JOIN dept_manager as dm ON e.emp_no = dm.emp_no
INNER JOIN departments as d ON dm.dept_no = d.dept_no
WHERE dept_name = 'Sales'

-- 7. Employees in sales and development departments; employee number, last name, first name and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees AS e
INNER JOIN dept_manager as dm ON e.emp_no = dm.emp_no
INNER JOIN departments as d ON dm.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- 8. Employees that share last name (frequency counts, desc order, all employee last names)
SELECT last_name, COUNT(last_name) AS frequency FROM employees
GROUP BY last_name ORDER BY frequency DESC;