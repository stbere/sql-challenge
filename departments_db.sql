-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE departments;

-- Create the tables for departments.csv
CREATE TABLE departments(dept_no VARCHAR(30),
						 dept_name VARCHAR(30)
)

-- Add Serial Key
ALTER TABLE departments ADD COLUMN dept_no SERIAL PRIMARY KEY;

-- View Data Output & columns
SELECT * FROM departments;