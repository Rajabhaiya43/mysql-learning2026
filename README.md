# 01 - SELECT Statement

## Topics Covered

- SELECT *
- Selecting Specific Columns
- DISTINCT
- Database Querying

## Database Used

parks_and_recreation

## Example Queries

```sql
SELECT *
FROM employee_demographics;

SELECT first_name
FROM employee_demographics;

SELECT DISTINCT gender
FROM employee_demographics;
```
## 02 - WHERE Clause

Topics Covered:
- Comparison Operators (=, >)
- AND Operator
- OR Operator
- NOT Operator
- Parentheses in Conditions
- LIKE Operator
- Wildcards (% and _)

Examples:
```sql
SELECT *
FROM employee_salary
WHERE salary > 70000;
```
## 03 - GROUP BY & ORDER BY

Topics Covered:

- GROUP BY
- AVG()
- COUNT()
- MIN()
- MAX()
- ORDER BY
- ASC Sorting
- DESC Sorting
- Multiple Column Sorting

Database Used: parks_and_recreation

Example Queries:

Examples:

```sql
SELECT gender, AVG(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;
```
## 04 - HAVING, LIMIT & ALIASING

Topics Covered:

- HAVING Clause
- LIMIT
- OFFSET using LIMIT
- Column Aliasing (AS)
- Filtering Aggregated Data

Database Used: parks_and_recreation

Examples:
```sql
SELECT *
FROM employee_salary
LIMIT 3, 5;
```

```sql
SELECT occupation, AVG(salary) AS AVG_slr
FROM employee_salary
GROUP BY occupation
HAVING AVG_slr > 80000;
```
