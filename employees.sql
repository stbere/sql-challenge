-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE employees;

-- Create the tables for departments.csv
CREATE TABLE employees(emp_no VARCHAR(30),
					   emp_title_id VARCHAR(30),
					   birth_date DATE,
					   first_name VARCHAR(30),
					   last_name VARCHAR(30),
					   sex VARCHAR(30) NOT NULL,
					   hire_date DATE
);

-- Add Serial Key (???)
ALTER TABLE employees ADD COLUMN emp_no SERIAL PRIMARY KEY;

-- View Data Output & columns
SELECT * FROM employees;