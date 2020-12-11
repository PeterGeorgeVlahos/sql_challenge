-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/eRgkp6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

---drop table before creating
Drop Table departments;

CREATE TABLE departments (
    dept_no VARCHAR(255)  NOT NULL ,
    dept_name VARCHAR(255)  NOT NULL ,
    CONSTRAINT PK_departments PRIMARY KEY(
        dept_no
    )
);
---Import form CVS file & see table
Select * from departments;

---

Drop Table dept_emp; 

CREATE TABLE dept_emp (
    emp_no INT  NOT NULL ,
    dept_no VARCHAR(255)  NOT NULL 
);

Select * from dept_emp;

---

CREATE TABLE dept_manager (
    dept_no VARCHAR(255)  NOT NULL ,
    emp_no INT  NOT NULL ,
    CONSTRAINT PK_dept_manager PRIMARY KEY (
        emp_no 
    )
);

Select * from dept_manager; 

----

CREATE TABLE employees (
    emp_no INT  NOT NULL ,
    emp_title_id VARCHAR(255)  NOT NULL ,
    birth_date DATE  NOT NULL ,
    first_name VARCHAR(255)  NOT NULL ,
    last_name VARCHAR(255)  NOT NULL ,
    sex VARCHAR(1)  NOT NULL ,
    hire_date DATE  NOT NULL ,
    CONSTRAINT PK_employees PRIMARY KEY  (
        emp_no 
    )
);

select * from employees;

---

CREATE TABLE salaries (
    emp_no INT  NOT NULL ,
    salary INT  NOT NULL ,
    CONSTRAINT PK_salaries PRIMARY KEY  (
        emp_no 
    )
);

select * from salaries;

---

CREATE TABLE titles (
    title_id VARCHAR(255)  NOT NULL ,
    title VARCHAR(255)  NOT NULL ,
    CONSTRAINT PK_titles PRIMARY KEY  (
        title_id 
    )
);

Select * from titles; 

COMMIT TRANSACTION QUICKDBD