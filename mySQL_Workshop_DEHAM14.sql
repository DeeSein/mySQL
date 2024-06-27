-- get list from departments
SELECT * FROM departments;


-- retrieve department id and name
SELECT dept_no, dept_name FROM departments;


-- retrieve the department id and name where the department id is d005
SELECT dept_no, dept_name FROM departments WHERE dept_no = 'd005';


-- retrieve the department id and name where the department name is Sales
SELECT  dept_no 'Department Number', 
        dept_name 'Department Name' 
FROM departments 
WHERE dept_name = 'Customer Service';


-- retrieve the department id and name where the department name is either Sales or Development
SELECT  dept_no 'Department Number',
        dept_name 'Department Name'
FROM departments
WHERE dept_name = 'Sales' OR dept_name = 'Development';


-- retrieve top ten records from the employees table
SELECT * FROM employees 
LIMIT 10;


-- how many employees are working in the departments
SELECT dept_no, count(*) 'Number of Employees'
FROM dept_emp de
GROUP BY dept_no


-- get the cout of employees from employees table
SELECT count(*) 'Number of Employees'
FROM employees;


-- retrieve top 5 employee records
SELECT * FROM employees
LIMIT 5;


-- select top 5 employees and display first name, last name and hire date
SELECT  first_name,
        last_name,
        hire_date
FROM employees
LIMIT 5;


