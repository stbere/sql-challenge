-- Importing CSV data using the commands below (may need to modify varchars)

-- If error and need to restart, drop table;
DROP TABLE titles;

-- Create the tables for departments.csv
CREATE TABLE titles();

-- Add Serial Key (???)
ALTER TABLE titles ADD COLUMN title_id SERIAL PRIMARY KEY;
ALTER TABLE titles ADD COLUMN title NOT NULL

-- View Data Output & columns
SELECT * FROM titles;