-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HzSSmN
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [Emp_No] int  NOT NULL ,
    [Emp_Title_id] string  NOT NULL ,
    [Birth_Date] date  NOT NULL ,
    [First_Name] string  NOT NULL ,
    [Last_Name] string  NOT NULL ,
    [Sex] varchar  NOT NULL ,
    [Hire_Date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [Emp_No] ASC
    )
)

CREATE TABLE [Department Employee] (
    [Emp_No] int  NOT NULL ,
    [Dept_No] string  NULL ,
    CONSTRAINT [PK_Department Employee] PRIMARY KEY CLUSTERED (
        [Emp_No] ASC
    )
)

CREATE TABLE [Departments] (
    [Dept] int  NOT NULL ,
    [Dept_No] string  NULL ,
    [Dept_Name] varchar  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [Dept] ASC
    )
)

CREATE TABLE [Salaries] (
    [Emp_No] int  NOT NULL ,
    [Salary] money  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [Emp_No] ASC
    )
)

CREATE TABLE [Titles] (
    [Title_id] int  NOT NULL ,
    [Title] string  NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [Title_id] ASC
    )
)

CREATE TABLE [Department Manager] (
    [Dept_No] string  NULL ,
    [Emp_No] int  NOT NULL 
)

ALTER TABLE [Department Employee] WITH CHECK ADD CONSTRAINT [FK_Department Employee_Emp_No] FOREIGN KEY([Emp_No])
REFERENCES [Employees] ([Emp_No])

ALTER TABLE [Department Employee] CHECK CONSTRAINT [FK_Department Employee_Emp_No]

ALTER TABLE [Department Employee] WITH CHECK ADD CONSTRAINT [FK_Department Employee_Dept_No] FOREIGN KEY([Dept_No])
REFERENCES [Departments] ([Dept_No])

ALTER TABLE [Department Employee] CHECK CONSTRAINT [FK_Department Employee_Dept_No]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_Emp_No] FOREIGN KEY([Emp_No])
REFERENCES [Employees] ([Emp_No])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_Emp_No]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_Title_id] FOREIGN KEY([Title_id])
REFERENCES [Employees] ([Emp_Title_id])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_Title_id]

ALTER TABLE [Department Manager] WITH CHECK ADD CONSTRAINT [FK_Department Manager_Dept_No] FOREIGN KEY([Dept_No])
REFERENCES [Departments] ([Dept_No])

ALTER TABLE [Department Manager] CHECK CONSTRAINT [FK_Department Manager_Dept_No]

ALTER TABLE [Department Manager] WITH CHECK ADD CONSTRAINT [FK_Department Manager_Emp_No] FOREIGN KEY([Emp_No])
REFERENCES [Employees] ([Emp_No])

ALTER TABLE [Department Manager] CHECK CONSTRAINT [FK_Department Manager_Emp_No]

COMMIT TRANSACTION QUICKDBD