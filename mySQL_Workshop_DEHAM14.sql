-- get list from departments
SELECT * FROM departments;


-- retrieve department id and name
SELECT  dept_no,
        dept_name 
FROM    departments;


-- retrieve the department id and name where the department id is d005
SELECT  dept_no,
        dept_name
FROM    departments 
WHERE   dept_no = 'd005';


-- retrieve the department id and name where the department name is Sales
SELECT  dept_no 'Department Number', 
        dept_name 'Department Name' 
FROM    departments 
WHERE   dept_name = 'Customer Service';


-- retrieve the department id and name where the department name is either Sales or Development
SELECT  dept_no 'Department Number',
        dept_name 'Department Name'
FROM    departments
WHERE   dept_name = 'Sales' OR dept_name = 'Development';


-- retrieve top ten records from the employees table
SELECT * FROM employees 
LIMIT 10;


-- how many employees are working in the departments
SELECT  dept_no, count(*) 'Number of Employees'
FROM    dept_emp de
GROUP BY    dept_no


-- get the cout of employees from employees table
SELECT  count(*) 'Number of Employees'
FROM    employees;


-- retrieve top 5 employee records
SELECT * FROM employees
LIMIT 5;


-- select top 5 employees and display first name, last name and hire date
SELECT  first_name,
        last_name,
        hire_date
FROM    employees
LIMIT 5;


-- get first_name, last_name and concatenate them using concat function using the data from employees table
SELECT  first_name,
        last_name,
        CONCAT(first_name, ' ', last_name) 'Full Name'
FROM    employees
LIMIT 5;


-- get the first_name in upper case and last_name in lower case
SELECT  UPPER(first_name) 'First Name',
        LOWER(last_name) 'Last Name'
FROM    employees
LIMIT 5;


-- get sample 10 records from salaries table
SELECT * FROM salaries
LIMIT 10;


-- get the average of the salaries also show maximum and minimum
SELECT  AVG(salary) 'Average Salary',
        MAX(salary) 'Maximum Salary',
        MIN(salary) 'Minimum Salary'
FROM    salaries;


-- get thte number of records from titles table
SELECT count(*) 'Number of Titles' 
FROM titles;


-- get 5 samples from titles table
SELECT * FROM titles
LIMIT 5;


-- get 25 samples from titles table without dublicates
SELECT DISTINCT title
FROM titles
LIMIT 25;


-- get the number of records from titles table where the title is engineer
SELECT count(*) 'Number of Engineers'
FROM titles
WHERE title = 'Engineer';


-- list of some other sql functions
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


-- get the current date and time
SELECT NOW() 'Current Date and Time';


-- get the current date, time and time which is 50 years from now()
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 50 YEAR) '50 Years from Now';


-- get first_name and last_name from employees table and the salarie from the salaries table
-- where the first_name and last_name are the same
SELECT  e.first_name,
        e.last_name,
        s.salary
FROM    employees e
        INNER JOIN salaries s
            ON e.emp_no = s.emp_no
WHERE   e.first_name = e.last_name
LIMIT 10;


