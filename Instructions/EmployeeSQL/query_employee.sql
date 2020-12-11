--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--Perform inner join on Employees and Salaries
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e, salaries as s
WHERE  e.emp_no=s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
--see data
SELECT * FROM employees;

--Perform query where year = 1986 or between (1985-12-31 and 1987-01-01)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1985-12-31' and '1987-01-01';

--3. List the manager of each department with the following information: 
--   department number, department name, the manager's employee number, last name, 
--   first name.

select d.dept_no, de.dept_name, d.emp_no, e.last_name, e.first_name
From  dept_manager AS d
Left JOIN departments AS de 
ON de.dept_no = d.dept_no
Left JOIN employees AS e
on d.emp_no=e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, 
--   first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
From  dept_manager AS d
Left JOIN departments AS de 
ON de.dept_no = d.dept_no
Left JOIN employees AS e
on d.emp_no=e.emp_no;

-- 5. List first name, last name, and sex for employees whose 
--    first name is "Hercules" and last names begin with "B."

Select * from employees;

Select first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

 
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
From  dept_manager AS d
Left JOIN departments AS de 
ON de.dept_no = d.dept_no
Left JOIN employees AS e
on d.emp_no=e.emp_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
From  dept_manager AS d
Left JOIN departments AS de 
ON de.dept_no = d.dept_no
Left JOIN employees AS e
on d.emp_no=e.emp_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name 
FROM employees
GROUP BY last_name;








