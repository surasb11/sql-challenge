-- Create tables
DROP TABLE departments;
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);
SELECT * FROM departments;

DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

DROP TABLE employees;
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

DROP TABLE salaries;
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

DROP TABLE titles;
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

---List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


---List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information:
--department number, department name, 
--the manager's employee number, last name, first name, 
--and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_manager.from_date, 
dept_manager.to_date
From departments
Join dept_manager
ON departments.dept_no = dept_manager.dept_no
Join employees
ON dept_manager.emp_no = employees.emp_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select departments.dept_name, employees.first_name, employees.last_name
from departments
Join dept_emp
ON departments.dept_no = dept_emp.dept_no
JOin employees
ON dept_emp.emp_no = employees.emp_no;


--List all employees whose first name is 
--"Hercules" and last names begin with "B."
select employees.first_name, employees.last_name
from employees
where first_name = 'Hercules' and last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select departments.dept_name, employees.first_name, 
employees.last_name, employees.emp_no
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.
select departments.dept_name, employees.first_name, 
employees.last_name, employees.emp_no
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Facello"
FROM employees
GROUP BY last_name;



