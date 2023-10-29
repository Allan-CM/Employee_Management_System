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


-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    ds.dept_name,
	d.dept_no,
	d.emp_no,
    e.last_name,
    e.first_name
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments ds ON ds.dept_no = d.dept_no
WHERE e.emp_title_id = 'm0001';

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	ds.dept_name,
	d.dept_no,
	d.emp_no,
    e.last_name,
    e.first_name
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments ds ON ds.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    first_name, 
	last_name,
	sex
FROM
    employees
WHERE
    first_name = 'Hercules' AND last_name LIKE 'B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	ds.dept_name,
	d.emp_no,
    e.last_name,
    e.first_name
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments ds ON ds.dept_no = d.dept_no
WHERE ds.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	ds.dept_name,
	d.emp_no,
    e.last_name,
    e.first_name,
	d.dept_no
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments ds ON ds.dept_no = d.dept_no
WHERE ds.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(last_name) AS Frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    Frequency DESC;