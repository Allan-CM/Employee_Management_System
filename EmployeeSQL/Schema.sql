-- Create a new table
CREATE TABLE departments (
  dept_no VARCHAR(30) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles(
 title_id VARCHAR(30) PRIMARY KEY,
 title VARCHAR(30) NOT NULL
);

ALTER DATABASE "Homework" SET datestyle TO "ISO, MDY";D

CREATE TABLE employees( 
  emp_no INTEGER NOT NULL PRIMARY KEY,
  emp_title_id VARCHAR(30) NOT NULL,
  birth_date Date, 
  first_name VARCHAR(30) NOT NULL, 
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date Date,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
  emp_no INTEGER,
  dept_no VARCHAR(30) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no INTEGER NOT NULL, 
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE salaries( 
  emp_no INTEGER NOT NULL PRIMARY KEY,
  salary INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

