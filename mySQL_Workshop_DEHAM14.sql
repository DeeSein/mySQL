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


-- get titels and last names from the top 5 employees with the highest salaries
SELECT  e.first_name,
        e.last_name,
        s.salary
FROM    employees e
        INNER JOIN salaries s
            ON e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 5;


-- get the schema of employees table
DESCRIBE employees;


-- get the schema of titels table
DESCRIBE titles;


INSERT INTO titles (emp_no, title, from_date)
VALUES (
    10001,
    'AI Specialist',
    '2023-06-26'
);


INSERT INTO titles (emp_no, title, from_date)
VALUES (
    10002,
    'AI Specialist II',
    '2023-06-26'
);


-- create a stored procedure to insert data into the titles table
DELIMITER $$
CREATE PROCEDURE insert_title(
    IN p_emp_no INT,
    IN p_title VARCHAR(50),
    IN p_from_date DATE
)
BEGIN
    insert into titles (emp_no, title, from_date)     VALUES (p_emp_no, p_title, p_from_date);
    END;


-- using the above stored procedure to insert data into the titles table
CALL insert_title(10003, 'AI Specialist 3', '2023-06-26');
CALL insert_title(10004, 'AI Specialist 4', '2023-06-26');
CALL insert_title(10005, 'AI Specialist 5', '2023-06-26');
CALL insert_title(10006, 'AI Specialist 6', '2023-06-26');
CALL insert_title(10007, 'AI Specialist 7', '2023-06-26');
CALL insert_title(10008, 'AI Specialist 8', '2023-06-26');
CALL insert_title(10009, 'AI Specialist 9', '2023-06-26');
CALL insert_title(10010, 'AI Specialist 10', '2023-06-26');
CALL insert_title(10011, 'AI Specialist 11', '2023-06-26');


-- get the list of titles from the titles table with titles like AI
SELECT * FROM titles
WHERE title LIKE '%AI%';


-- get the list of titles from the titles table with titles not like AI
SELECT * FROM titles
WHERE title NOT LIKE '%AI%'
LIMIT 10;


-- get titles from titles table without dublicates but without the title AI
SELECT DISTINCT title FROM titles
WHERE title NOT LIKE '%AI%';


select salary from salaries where emp_no = 10001;

-- select the first name and last name from the employees table where the first name is equal to the last name
SELECT  first_name, 
        last_name 
FROM    employees 


-- sort the names alphabeticaly from the employees table
SELECT  first_name,
        last_name
FROM    employees
ORDER BY first_name, last_name
LIMIT 10;


-- sort the names reverse alphabeticaly from the employees table
SELECT  first_name,
        last_name
FROM    employees
ORDER BY first_name DESC, last_name DESC
LIMIT 10;


-- show the titles aswell
SELECT  e.first_name,
        e.last_name,
        s.salary,
        t.title
FROM    employees e
        INNER JOIN salaries s
            ON e.emp_no = s.emp_no
        INNER JOIN titles t
            ON e.emp_no = t.emp_no
ORDER BY s.salary DESC
LIMIT 10;


-- get list of departments
SELECT * FROM departments;


-- get list of marketing in departments
SELECT * FROM departments 
WHERE dept_name = 'Marketing';


-- select marketing from departments table by dept_no
SELECT * FROM departments
WHERE dept_no = 'd001';


-- get list with the following departments Marketing, Finance and Production
SELECT * FROM departments
WHERE dept_name IN ('Marketing', 'Finance', 'Production');


-- get list without the following departments Marketing, Finance and Production
SELECT * FROM departments
WHERE dept_name NOT IN ('Marketing', 'Finance', 'Production');


-- get the above with AND Function
SELECT * FROM departments
WHERE (dept_name = 'Marketing')
AND (dept_name = 'Finance');


-- get the above with OR Function
SELECT * FROM departments
WHERE (dept_name = 'Marketing')
OR (dept_name = 'Finance');


-- retrieve salary records with salary lesser than average salary
SELECT * FROM salaries
WHERE salary < (
    SELECT AVG(salary) FROM salaries
);


-- cout the number of salary that is lesser than the average salary
SELECT COUNT(*) FROM salaries
WHERE salary < (
    SELECT AVG(salary) FROM salaries
);


-- retrieve salary records with salary more than average salary and order by salary descending
SELECT * FROM salaries
WHERE salary > (
    SELECT AVG(salary) FROM salaries
)
ORDER BY salary DESC
LIMIT 10;


-- get the count of salary records where salary is between 40000 and 60000
select * from salaries
where salary BETWEEN 40000 and 60000;


-- get the count of salary records where salary is not between 40000 and 60000
select * from salaries
where salary NOT BETWEEN 40000 and 60000;


-- get the record with the salary equal to 158220
SELECT * FROM salaries
WHERE salary = 158220;

select * from employees 
where emp_no = 43624;


-- get the record with the salary equal to 158220 with the first_name and last_name
SELECT e.first_name, e.last_name, s.salary FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.salary = 158220;


-- get the recors with emp_no 43624
SELECT * FROM employees
WHERE emp_no = 43624;


-- get thte record with emp_no 43624 from salaries
SELECT * FROM salaries
WHERE emp_no = 43624;


-- generate a report with employee number, first name, last name and salary
SELECT  e.emp_no, 
        e.first_name,
        e.last_name,
        s.salary 
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
LIMIT 10;


-- generate a report with employee number equals number 43624, first name, last name and salary
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 43624;


-- generate a report with employee number equals number 43624, first name, last name and salary, from date and to date
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        s.salary,
        s.from_date,
        s.to_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 43624;

INSERT INTO employees (
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
  )
VALUES (
    555011,
    '1886-05-15',
    'Max',
    'Mustermann',
    'D',
    '2024-06-19'
  );

select * from employees
where emp_no = 555011;


-- generate a report with employee 555011, first name and salary using inner join
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        s.salary,
        s.from_date,
        s.to_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 555011;


-- generate a report with employee 555011,42356,10001, first name and salary using left join
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        s.salary,
        s.from_date,
        s.to_date
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no IN (555011,42356,10001);


-- ANSI SQL

DESCRIBE salaries;

SELECT * FROM employees
WHERE emp_no IN (555011, 42356, 10001);


-- set up a tempory table from employees where emp_nr in 555011, 42356, 10001
WITH temp_table AS (
    SELECT * FROM employees
    WHERE emp_no IN (555011, 42356, 10001)
)
SELECT * FROM temp_table;


WITH temp_sal_table AS (
    SELECT * FROM salaries
    WHERE emp_no IN (555011, 42356, 10001)
)
SELECT * FROM temp_sal_table;


-- join temp_table with temp_sal_table using right join
select e.emp_no, e.birth_date, e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM temp_table e
RIGHT JOIN temp_sal_table s ON e.emp_no = s.emp_no;


-- get the list of departments sorted by dept_no
SELECT * FROM departments
ORDER BY dept_no
LIMIT 10;


-- get the list of departments sorted by dept_no in descending order
SELECT * FROM departments
ORDER BY dept_no DESC
LIMIT 10;


select * from departments
where dept_no in ('d001', 'd002', 'd003');


select dept_no from departments
where dept_name in ('Marketing', 'Finance', 'Human Resources')
ORDER BY dept_no;


select * from dept_emp
where dept_no in ('d001', 'd002', 'd003')
LIMIT 10;


-- inner query 
select * from dept_emp
where dept_no in (
    select dept_no
    from departments
    where dept_name in ('Marketing', 'Finance', 'Human Resources'))
LIMIT 10;


-- get the number of employees in each department
SELECT  COUNT(DISTINCT emp_no) 'Number of Employees'
FROM    employees


-- get the number of employees in Marketing with sub queary from employees and dept_no 'd001'
select * from employees
where emp_no in
    (select emp_no
    from dept_emp
    where dept_no =
        (select dept_no
        from departments
        where dept_name = 'Marketing'));


-- get the employees who are part of marketing using joins
SELECT * FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing';


-- get the number of employees in each department
SELECT  dept_no,
        COUNT(DISTINCT emp_no) 'Number of Employees'
FROM    dept_emp
GROUP BY dept_no


SELECT  dept_no,
        COUNT(DISTINCT emp_no) 'Number of Employees'
FROM    dept_emp
GROUP BY dept_no
HAVING count(DISTINCT emp_no) > 50000


SELECT  dept_no,
        COUNT(DISTINCT emp_no) 'Number of Employees'
FROM    dept_emp
where dept_no in ('d004', 'd002', 'd007')
GROUP BY dept_no
HAVING count(DISTINCT emp_no) > 50000


-- get the number of employees in each department and sort it by dept_no descending order
SELECT  dept_no,
        COUNT(DISTINCT emp_no) 'Number of Employees'
FROM    dept_emp
GROUP BY dept_no
ORDER BY dept_no DESC
LIMIT 10;


-- wild card search
-- % or _

select * from employees 
LIMIT 10;


SELECT * FROM employees
WHERE first_name = 'Georgi';


SELECT * FROM employees
WHERE first_name = 'Georgi'
and last_name = 'Facello';


SELECT * FROM employees
WHERE first_name = 'Georgi'
and last_name LIKE 'B%';


select emp.*,de.dept_no from employees emp
JOIN dept_emp de
on emp.emp_no = de.emp_no
where emp.first_name='Georgi'
and emp.last_name like 'B%';


select emp.*,de.dept_no,d.dept_name from employees emp
JOIN dept_emp de
on emp.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where emp.first_name='Georgi'
and emp.last_name like 'B%';


select emp.first_name,emp.last_name,de.dept_no,d.dept_name from employees emp
JOIN dept_emp de
on emp.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where emp.first_name='Georgi'
and emp.last_name like 'B%';


select emp.first_name,emp.last_name,de.dept_no,d.dept_name from employees emp
JOIN dept_emp de
on emp.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where emp.first_name='Georgi'
and emp.last_name like 'B%'
and d.dept_name not like '%human%';


select emp.first_name,emp.last_name,de.dept_no,d.dept_name from employees emp
JOIN dept_emp de
on emp.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where emp.first_name='Georgi'
and emp.last_name like 'B%'
and d.dept_name = 'Sales';


select  upper(emp.first_name),
        upper(emp.last_name),
        CONCAT(first_name,' ',last_name) as 'Full Name',
        de.dept_no as 'Department Number',
        d.dept_name 'Department Name'
from employees emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
where emp.first_name='Georgi'
    and emp.last_name like 'B%'
    and d.dept_name = 'Sales';


select  upper(emp.first_name),
        upper(emp.last_name),
        CONCAT(first_name,' ',last_name) as 'Full Name',
        de.dept_no as 'Department Number',
        d.dept_name 'Department Name',
        SUBSTRING(first_name,1,4)
from employees emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
where emp.first_name='Georgi'
    and emp.last_name like 'B%'
    and d.dept_name = 'Sales';


select  upper(emp.first_name),
        upper(emp.last_name),
        CONCAT(first_name,' ',last_name) as 'Full Name',
        length(last_name),
        de.dept_no as 'Department Number',
        d.dept_name 'Department Name',
        SUBSTRING(first_name,1,4)
from employees emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
where emp.first_name='Georgi'
    and d.dept_name = 'Sales';