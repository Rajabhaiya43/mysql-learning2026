-- stored procedure 

CREATE PROCEDURE ONLY_FEMALE()
SELECT*
FROM employee_demographics
WHERE gender = 'female';

CALL ONLY_FEMALE();


DELIMITER $$
CREATE PROCEDURE MALE_with_50k_SALARY()
BEGIN
SELECT*
FROM employee_demographics
WHERE gender != 'female';
SELECT*
FROM employee_demographics
WHERE salary >= 50000;
END 
$$ DELIMITER ;

CALL MALE_with_50k_SALARY();


DELIMITER $$
CREATE PROCEDURE FILTER_SALARY_via_NAME(e_id INT)
BEGIN
SELECT first_name,salary
FROM employee_salary
WHERE employee_id = e_id;
END
$$ DELIMITER ;

CALL FILTER_SALARY_via_NAME(07);

