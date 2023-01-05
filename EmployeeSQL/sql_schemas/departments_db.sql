-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE departments;

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