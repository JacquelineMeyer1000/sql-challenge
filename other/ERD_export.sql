-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_no" varchar   NOT NULL,
    "department_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_no"
     )
);

CREATE TABLE "dept_emp" (
    "employee_no" INT   NOT NULL,
    "department_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "employee_no" INT   NOT NULL,
    "department_no" varchar   NOT NULL
);

CREATE TABLE "employees" (
    "employee_no" INT   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "salaries" (
    "employee_no" INT   NOT NULL,
    "salary" money   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_department_no" FOREIGN KEY("department_no")
REFERENCES "departments" ("department_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_department_no" FOREIGN KEY("department_no")
REFERENCES "departments" ("department_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

