-- If error and need to restart, remove "--" and drop tables;
-- DROP TABLE departments;
-- DROP TABLE employees;
-- DROP TABLE dept_emp;
-- DROP TABLE dept_manager;
-- DROP TABLE salaries;
-- DROP TABLE titles;

---- DATA ENGINEERING ----

-- 1a.) departments.csv schema
-- Create the tables for departments.csv
CREATE TABLE departments(dept_no VARCHAR NOT NULL,
						 dept_name VARCHAR NOT NULL,
						 PRIMARY KEY (dept_no)
);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY departments FROM 'c:/data/data/departments.csv' 
WITH CSV HEADER;

-- View Data Output & columns
SELECT * FROM departments;

-----------------------------------------------------------

-- 2a.) employees.csv schema
-- Create the tables for employees.csv
CREATE TABLE employees(emp_no INT NOT NULL,
					   emp_title_id VARCHAR NOT NULL,
					   birth_date DATE,
					   first_name VARCHAR NOT NULL,
					   last_name VARCHAR NOT NULL,
					   sex VARCHAR NOT NULL,
					   hire_date DATE,
					   PRIMARY KEY (emp_no)
);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY employees FROM 'c:/data/data/employees.csv' 
WITH CSV HEADER;

SELECT * FROM employees

-----------------------------------------------------------

-- 3a.) dept_emp schema
-- Create the tables for dept_emp.csv
CREATE TABLE dept_emp(emp_no INT NOT NULL,
						 dept_no VARCHAR NOT NULL,
					  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
					  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY dept_emp FROM 'c:/data/data/dept_emp.csv' 
WITH CSV HEADER;

-- View Data Output & columns
SELECT * FROM dept_emp;

-----------------------------------------------------------

-- 4a.) dept_manager schema
-- Create the tables for dept_manager.csv
CREATE TABLE dept_manager(dept_no VARCHAR NOT NULL,
						 emp_no INT NOT NULL,
						  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
						  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY dept_manager FROM 'c:/data/data/dept_manager.csv' 
WITH CSV HEADER;

-- View Data Output & columns
SELECT * FROM dept_manager;

-----------------------------------------------------------

-- 5a.) salaries schema
-- Create the tables for salaries.csv
CREATE TABLE salaries(emp_no INT NOT NULL,
					  salary INT NOT NULL,
					  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY salaries FROM 'c:/data/data/salaries.csv' 
WITH CSV HEADER;

SELECT * FROM salaries

-----------------------------------------------------------

-- 6a.) titles schema
-- Create the tables for departments.csv
CREATE TABLE titles(title_id VARCHAR NOT NULL,
				   title VARCHAR NOT NULL);
				   

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY titles FROM 'c:/data/data/titles.csv' 
WITH CSV HEADER;

SELECT * FROM titles;

-----------------------------------------------

---- DATA MODELING ----

-- Check repository for Quick Database Diagram: 
-- https://github.com/stbere/sql-challenge/tree/main/EmployeeSQL/Entity_Relationship_Diagrams

-----------------------------------------------

---- DATA ANALYSIS ----

-- 1b.) List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- 2b.) List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3b.) List the manager of each department along with their department number, 
--      department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager m
JOIN departments d ON m.dept_no = d.dept_no
JOIN employees e ON m.emp_no = e.emp_no;

-- 4b.) List the department number for each employee along with that employee’s employee number, 
--      last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- 5b.) List first name, last name, and sex of each employee whose first name is Hercules and whose 
--      last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6b.) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7b.) List each employee in the Sales and Development departments, including their employee number, last name, 
--      first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8b.) List the frequency counts, in descending order, of all the employee last names 
--     (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;

--------------------------------------------------------------
