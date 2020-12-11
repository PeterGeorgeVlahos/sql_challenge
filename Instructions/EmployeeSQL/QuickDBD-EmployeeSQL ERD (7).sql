-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/eRgkp6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- 1 employee number, last name, first name,
-- sex, and salary.
CREATE TABLE "employee_salaries" (
    "emp_no" INT   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "combined_manager_depart" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "junction_dept_managers_name" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL
);

-- Department number, department name,
-- the manager's employee number, last name,
-- first name.
CREATE TABLE "junction_depart_employees" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "depart_employees" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL
);

ALTER TABLE "employee_salaries" ADD CONSTRAINT "fk_employee_salaries_emp_no_last_name_first_name_sex" FOREIGN KEY("emp_no", "last_name", "first_name", "sex")
REFERENCES "employees" ("emp_no", "last_name", "first_name", "sex");

ALTER TABLE "employee_salaries" ADD CONSTRAINT "fk_employee_salaries_salary" FOREIGN KEY("salary")
REFERENCES "salaries" ("salary");

ALTER TABLE "combined_manager_depart" ADD CONSTRAINT "fk_combined_manager_depart_dept_no_dept_name" FOREIGN KEY("dept_no", "dept_name")
REFERENCES "departments" ("dept_no", "dept_name");

ALTER TABLE "combined_manager_depart" ADD CONSTRAINT "fk_combined_manager_depart_emp_no_last_name_first_name" FOREIGN KEY("emp_no", "last_name", "first_name")
REFERENCES "junction_dept_managers_name" ("emp_no", "last_name", "first_name");

ALTER TABLE "junction_dept_managers_name" ADD CONSTRAINT "fk_junction_dept_managers_name_dept_no_emp_no" FOREIGN KEY("dept_no", "emp_no")
REFERENCES "dept_manager" ("dept_no", "emp_no");

ALTER TABLE "junction_dept_managers_name" ADD CONSTRAINT "fk_junction_dept_managers_name_last_name_first_name" FOREIGN KEY("last_name", "first_name")
REFERENCES "employees" ("last_name", "first_name");

ALTER TABLE "junction_depart_employees" ADD CONSTRAINT "fk_junction_depart_employees_dept_no_emp_no" FOREIGN KEY("dept_no", "emp_no")
REFERENCES "dept_emp" ("dept_no", "emp_no");

ALTER TABLE "junction_depart_employees" ADD CONSTRAINT "fk_junction_depart_employees_dept_name" FOREIGN KEY("dept_name")
REFERENCES "departments" ("dept_name");

ALTER TABLE "depart_employees" ADD CONSTRAINT "fk_depart_employees_dept_no_dept_name_emp_no" FOREIGN KEY("dept_no", "dept_name", "emp_no")
REFERENCES "junction_depart_employees" ("dept_no", "dept_name", "emp_no");

ALTER TABLE "depart_employees" ADD CONSTRAINT "fk_depart_employees_last_name_first_name" FOREIGN KEY("last_name", "first_name")
REFERENCES "employees" ("last_name", "first_name");

