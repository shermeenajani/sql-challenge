-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JyVAPm
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(255)   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

Select * from dept_emp

CREATE TABLE departments (
    dept_no varchar(255)   NOT NULL,
    dept_name varchar(255)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

select * from departments

CREATE TABLE dept_manager (
    dept_no varchar(255)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

select * from dept_manager

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(255)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex varchar(255)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

select * from employees

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

select * from salaries

CREATE TABLE titles (
    title_id varchar(255)   NOT NULL,
    title varchar(255)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

select * from titles

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

--ALTER TABLE departments ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
--REFERENCES dept_manager (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);
