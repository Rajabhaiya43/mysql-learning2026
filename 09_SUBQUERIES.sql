SELECT*
FROM employee_demographics;

SELECT*
FROM employee_salary;


SELECT*
FROM employee_demographics
WHERE first_name IN
               (SELECT first_name
               FROM employee_salary
               WHERE salary > 75000);

SELECT first_name, age, birth_date
FROM employee_demographics
WHERE employee_id IN 
              ( SELECT employee_id
              FROM employee_salary
              WHERE dept_id = 1);
              
SELECT first_name, occupation, salary
FROM employee_salary
WHERE first_name IN 
             (SELECT first_name
             FROM employee_demographics
             WHERE age>50);
			
SELECT first_name, occupation, salary
,(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, birth_date,
(SELECT AVG(age)
FROM employee_demographics)
FROM employee_demographics;
