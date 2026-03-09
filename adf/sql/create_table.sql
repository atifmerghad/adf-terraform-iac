-- Run this in your Azure SQL Database before the pipeline
CREATE TABLE dbo.employees_with_department (
    employee_id INT,
    employee_name NVARCHAR(255),
    department_id INT,
    department_name NVARCHAR(255)
);
