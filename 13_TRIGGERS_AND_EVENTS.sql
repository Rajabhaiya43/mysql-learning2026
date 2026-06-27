-- triggers 
SELECT*
FROM employee_demographics;

SELECT*
FROM employee_salary;


DELIMITER $$
CREATE TRIGGER New_Employee
AFTER  INSERT ON employee_demographics
FOR EACH ROW
BEGIN
     INSERT INTO employee_salary (employee_id, first_name, last_name)
     VALUE (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$ 
DELIMITER ;


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUE (15, 'Ananad', 'Kumar', 26, 'male', '2006-01-01');


UPDATE employee_salary
SET occupation = 'Sweeper',
    salary = 20000,
	dept_id = 7
WHERE employee_id = 15;
    
-- EVENT

DELIMITER $$

CREATE EVENT Retired_Old_PEOPLE
ON SCHEDULE EVERY 1 YEAR 
DO
BEGIN
     DELETE
     FROM employee_demographics
     WHERE age > 60;
     END
     $$ DELIMITER ;
     
DELIMITER $$

CREATE EVENT LOW_SALARY
ON SCHEDULE EVERY 1 YEAR 
DO
BEGIN
     UPDATE employee_salary
     SET salary = salary+ 10000
     WHERE salary < 30000;
     END
     $$ DELIMITER ;
     
DELIMITER $$

CREATE EVENT High_SALARY_Fired
ON SCHEDULE EVERY 1 YEAR 
DO
BEGIN
     DELETE
     FROM employee_salary
     WHERE salary > 89000;
     END
     $$ DELIMITER ;
