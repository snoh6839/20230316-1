-- join

-- SELECT e.emp_no, e.first_name, d.dept_no
-- FROM employees e
-- 	INNER JOIN dept_emp d
-- 		ON e.emp_no = d.emp_no
-- LIMIT 10;

-- INSERT INTO departments
-- VALUES ('d010', 'outer-join');
-- 
-- COMMIT;
-- 
-- SELECT*
-- FROM departments

-- SELECT d.dept_no, d.dept_name, m.emp_no
-- FROM departments d
-- 	LEFT OUTER JOIN dept_manager m
-- 		ON d.dept_no = m.dept_no;
-- WHERE 

-- SELECT d.dept_no, d.dept_name, m.emp_no
-- FROM departments d 
-- 	RIGHT OUTER JOIN dept_manager m 
-- 		ON d.dept_no = m.dept_no; 
-- WHERE

-- SELECT d.dept_no, d.dept_name, m.emp_no
-- FROM departments d  
-- 	FULL OUTER JOIN dept_manager m  
-- 		ON d.dept_no = m.dept_no;
-- WHERE
-- 마리아 db 지원 안함
-- 적용법
-- SELECT d.dept_no, d.dept_name, m.emp_no
-- FROM departments d
-- LEFT JOIN dept_manager m ON d.dept_no = m.dept_no
-- UNION
-- SELECT d.dept_no, d.dept_name, m.emp_no
-- FROM departments d
-- RIGHT JOIN dept_manager m ON d.dept_no = m.dept_no
-- WHERE d.dept_no IS NULL;