## 03 - GROUP BY & ORDER BY

### Topics Covered

#### GROUP BY
- AVG()
- COUNT()
- MIN()
- MAX()
- Data Aggregation

#### ORDER BY
- Ascending Sort (ASC)
- Descending Sort (DESC)
- Multiple Column Sorting

### Example Queries

```sql
SELECT gender, AVG(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, AVG(salary), COUNT(salary)
FROM employee_salary
GROUP BY occupation;

SELECT *
FROM employee_salary
ORDER BY dept_id;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age ASC;
```

### Concepts Learned

- Grouping records using GROUP BY
- Aggregate Functions
  - AVG()
  - COUNT()
  - MIN()
  - MAX()
- Sorting records using ORDER BY
- Multi-column sorting
- ASC and DESC sorting
