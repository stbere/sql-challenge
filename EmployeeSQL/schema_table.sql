-- If error and need to restart, remove "--" and drop tables;
-- DROP TABLE departments;
-- DROP TABLE employees;
-- DROP TABLE dept_emp;
-- DROP TABLE dept_manager;
-- DROP TABLE salaries;
-- DROP TABLE titles;

-- 1.) departments.csv schema
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

-- 2.) employees.csv schema
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

-- 3.) dept_emp schema
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

-- 4.) dept_manager schema
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

-- 5.) salaries schema
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

-- 6.) titles schema
-- Create the tables for departments.csv
CREATE TABLE titles(title_id VARCHAR NOT NULL,
				   title VARCHAR NOT NULL);

-- Import would not work due to 'columns' error, using 'copy' method instead
COPY titles FROM 'c:/data/data/titles.csv' 
WITH CSV HEADER;

SELECT * FROM titles;
