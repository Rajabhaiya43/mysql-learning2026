#WHERE Clause
SELECT *
FROM employee_salary
WHERE salary > 70000
;

SELECT *
FROM employee_demographics
WHERE first_name = 'leslie'
;

SELECT *
FROM employee_salary
WHERE salary > 30000 AND dept_id = 3
;

# logical - operator

SELECT *
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
;

SELECT *
FROM employee_demographics
WHERE age > 40 OR birth_date > '1988-01-01'
;

SELECT *
FROM employee_demographics
WHERE age > 40 OR NOT birth_date > '1988-01-01'
;

#isolated - condition

SELECT *
FROM employee_demographics
WHERE (first_name =  'Leslie' AND age = 44) OR birth_date > '1990-01-01'
;

# Like _  Statement

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'an%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%n%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '___y'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a_%'
  ab isko upload krbn ahioa git h8b par
