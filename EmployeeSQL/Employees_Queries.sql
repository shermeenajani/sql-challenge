-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
--https://www.postgresqltutorial.com/postgresql-date_part/
select first_name, last_name, hire_date
from employees
where date_part ('year',hire_date) ='1986'
order by last_name

-- 3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments
left join dept_manager
on departments.dept_no = dept_manager.dept_no
left join employees
on dept_manager.emp_no = employees.emp_no
order by dept_name, last_name

-- 4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
order by dept_name, last_name

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."
--https://www.postgresqltutorial.com/postgresql-like/
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and
last_name like 'B%'
order by last_name

-- 6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by last_name

-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name  = 'Sales' or departments.dept_name = 'Development'
order by dept_name, last_name

-- 8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
--https://dba.stackexchange.com/questions/193307/find-most-frequent-values-for-a-given-column
select last_name, count(last_name) as frequency_last_name
from employees
group by last_name
order by frequency_last_name desc;

