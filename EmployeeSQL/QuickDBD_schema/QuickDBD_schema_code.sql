
departments
--
dept_no varcher pk FK >- dept_manager.dept_no
dept_name varcher

dept_emp
--
emp_no int
dept_no varcher FK >- departments.dept_no
from_date date
to_date date

dept_manager
--
dept_no varcher FK >- dept_emp.dept_no
emp_no int FK >- employees.emp_no
from_date date
to_date date

employees
--
emp_no int pk FK >- dept_emp.emp_no
birth_date date
first_name varcher
last_name varcher
gender varcher
hire_date date

salaries
--
emp_no int FK >- dept_manager.emp_no
salary int
from_date date
to_date date

titles
--
emp_no int FK >- dept_manager.emp_no
title varcher
from_date date
to_date date



