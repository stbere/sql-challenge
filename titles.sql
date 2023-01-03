-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE titles;

-- Create the tables for departments.csv
CREATE TABLE titles(title_id VARCHAR (30),
						 title VARCHAR(30)
);

-- Add Serial Key (???)
ALTER TABLE titles ADD COLUMN title_id SERIAL PRIMARY KEY;

-- View Data Output & columns
SELECT * FROM titles;