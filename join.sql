-- join

SELECT e.emp_no, e.first_name, d.dept_no
FROM employees e
	INNER JOIN dept_emp d
		ON e.emp_no = d.emp_no
LIMIT 10;