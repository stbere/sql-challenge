-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE salaries;

-- Create the tables for departments.csv
CREATE TABLE salaries(emp_no VARCHAR(10),
					  salary INT
);

-- Add Serial Key (???)
ALTER TABLE salaries ADD COLUMN dept_no SERIAL PRIMARY KEY;

-- View Data Output & columns
SELECT * FROM salaries;