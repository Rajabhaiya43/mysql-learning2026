-- CTEs


WITH CTE_Example AS
(
SELECT gender,
AVG(salary),
MAX(salary),
MIN(salary),
COUNT(salary)
FROM 
employee_demographics AS DEM
JOIN
employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;


WITH CTE_Example ( GENDER, AVG_SALARY, MAX_SALARY, MIN_SALARY, COUNT_SALARY)AS
(
SELECT gender,
AVG(salary),
MAX(salary),
MIN(salary),
COUNT(salary)
FROM 
employee_demographics AS DEM
JOIN
employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id
GROUP BY gender
)
SELECT AVG(AVG_SALARY)
FROM CTE_Example
;


-- temp table 
CREATE TEMPORARY TABLE temp_table
( first_name VARCHAR(50),
last_name VARCHAR(50),
fav_movie VARCHAR(100));

SELECT *
FROM temp_table;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM salary_over_50k;
