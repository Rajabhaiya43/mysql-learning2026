SELECT*
FROM employee_demographics;

SELECT*
FROM employee_salary;

-- INNER JOIN

SELECT*
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

SELECT ed.employee_id, birth_date, salary, age
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- OUTER JOIN

-- LEFT JOIN

SELECT*
FROM employee_demographics AS ed
LEFT JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- RIGHT JOIN

SELECT* 
FROM employee_demographics AS ed
RIGHT JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- SELF JOIN

SELECT ES1.employee_id AS EID_INT,
ES1.first_name AS EID_INT,
ES1.salary AS ESL_INT,
ES1.dept_id AS ESL_INT,
ES2.employee_id AS EID_FIN,
ES2.first_name AS EID_FIN,
ES2.salary AS ESL_FIN,
ES2.dept_id AS ESL_FIN
FROM employee_salary ES1
JOIN employee_salary ES2
ON ES1.employee_id + 2 = ES2.employee_id;

-- JOIN MULTIPLE TABLES TOGETHER

SELECT *
FROM parks_departments;

SELECT*
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id
INNER JOIN parks_departments AS pd
ON es.dept_id = pd.department_id;
