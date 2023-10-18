SELECT e.last_name, e.hire_date, &user_col
FROM EMPLOYEES e, EMPLOYEES m
WHERE e.manager_id = m.employee_id AND EXTRACT(YEAR FROM m.hire_date) = 2005
ORDER BY &user_col

SELECT first_name || ' ' || last_name as full_name, salary, phone_number 
FROM employees
WHERE last_name LIKE '__e%' AND first_name LIKE '%&inp%'
ORDER BY full_name DESC, salary ASC;

SELECT first_name, last_name, ROUND(months_between(CURRENT_DATE, hire_date)) AS months,
CASE 
    WHEN ROUND(months_between(CURRENT_DATE, hire_date))<150 THEN salary*0.1
    WHEN 150<=ROUND(months_between(CURRENT_DATE, hire_date)) AND ROUND(months_between(CURRENT_DATE, hire_date)) < 200 THEN salary * 0.2
    ELSE salary * 0.3
END AS wartosc_dodatku
FROM EMPLOYEES
ORDER BY months DESC; 

SELECT * FROM
(SELECT d.department_id, d.department_name, (SELECT SUM(e.salary) from employees e WHERE d.department_id = e.department_id) as sum_salary,
FROM DEPARTMENTS d)
WHERE sum_salary IS NOT NULL;

Select department_id, suma, srednia from
(SELECT department_id, SUM(salary) as suma, round(AVG(salary)) as srednia, MIN(salary) as minimum
FROM employees 
where department_id  IS NOT NULL
GROUP BY department_id)
where minimum > 5000 ;

SELECT e.last_name, d.department_id, d.department_name, e.job_id
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

SELECT e.first_name, e.last_name, e2.first_name || ' ' || e2.last_name as wspolpracownik
FROM employees e
JOIN employees e2
ON e.department_id = e2.department_id
WHERE e.first_name = 'Jennifer' AND e.employee_id <> e2.employee_id ;

SELECT b.department_name,
       count(a.department_id)
FROM departments b
LEFT OUTER JOIN employees a ON a.department_id=b.department_id
GROUP BY b.department_name
HAVING count(a.department_id) = 0;

SELECT e.first_name, e.last_name, e.job_id, d.department_name, e.salary, j.grade
FROM job_grades j, employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary BETWEEN j.min_salary AND j.max_salary;

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(e2.salary) FROM employees e2)
ORDER BY e.salary DESC;

SELECT DISTINCT e.first_name, e.last_name
FROM employees e
JOIN employees e2
ON e.department_id = e2.department_id
WHERE e.last_name LIKE '%u%' AND e.employee_id <> e2.employee_id 