-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE dept_manager;

-- Create the tables for departments.csv
CREATE TABLE dept_manager(dept_no VARCHAR (30),
						 emp_no VARCHAR(30)
)

-- Add Serial Key (???)
ALTER TABLE dept_manager ADD COLUMN dept_no SERIAL PRIMARY KEY;

-- View Data Output & columns
SELECT * FROM dept_manager;