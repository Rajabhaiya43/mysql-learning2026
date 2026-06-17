SELECT*
FROM employee_salary;

SELECT CONCAT(first_name,last_name) AS full_name, age, birth_date ,
CASE
 WHEN age < 18 THEN 'TEEN'
  WHEN age < 24 AND age > 18 THEN 'YOUNG'
  WHEN age < 50 AND age > 24 THEN 'OLD'
 WHEN age>50 THEN 'NEAR DEATH'
END AS age_catg
FROM employee_demographics
ORDER BY age;

SELECT CONCAT(first_name,last_name) AS full_name, salary, dept_id,
CASE
WHEN SALARY <= 60000 THEN SALARY * 1.10
WHEN SALARY <= 70000 THEN SALARY * 1.07
WHEN SALARY <= 75000 THEN SALARY * 1.05
WHEN SALARY > 75000 THEN SALARY * 1
END AS NEW_SALARY,
CASE
WHEN dept_id = 6 THEN SALARY * 0.1 
ELSE 0
END AS BOUNSE

FROM employee_salary;
