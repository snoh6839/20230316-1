-- 실습
-- 1. employee의 emp_no, last_name, first_name from employees  그리고  title from titles을 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name), t.title
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no;

-- 2. employee의 emp_no, gender from employees  그리고  현재 salary from salaries을 출력해주세요
SELECT e.emp_no, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- 3. 10010 employee의 last_name, first_name from employees, 그리고 salary 이력  from salaries을 출력해주세요
SELECT concat(e.last_name, ' ' ,e.first_name), s.salary, s.from_date, s.to_date
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 10010;

-- 4. dept_emp의 dept_no와 departments의 dept_no를 연결해 dept_name을 employee의 emp_no, last_name, first_name from employees 와 함께 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name), d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

-- 5. 현재 salary from salaries 의 상위 10위까지 employee의  last_name, first_name from employees와 월급을 출력해 주세요.

-- SELECT concat(employees.last_name, ' ' ,employees.first_name), salaries.salary
-- FROM employees
-- INNER JOIN (
--   SELECT emp_no, salary, RANK() OVER (ORDER BY salary DESC) as salary_rank
--   FROM salaries
--   WHERE to_date = '9999-01-01'
-- ) salaries ON employees.emp_no = salaries.emp_no
-- WHERE salaries.salary_rank <= 10;

SELECT concat(e.last_name, ' ' ,e.first_name), s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 10;

-- 6. dept_manager테이블의 emp_no를employees와 연결해 first_name을 구하고 dept_manager에서  각 dept_no의 to_date가 가장 큰 사람의 first_name과 to_date를 출력해 주세요
SELECT concat(e.last_name, ' ' ,e.first_name), e.hire_date, d.dept_name, dm.from_date
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no AND dm.to_date = '9999-01-01'
INNER JOIN departments d ON dm.dept_no = d.dept_no;


-- 7. 현재 title이 staff인 employee의 (from titles) 현재 평균 salary (from salaries)을 emp_no와 함께 출력해 주세요
SELECT s.emp_no, t.title, AVG(s.salary) AS avg_salary
FROM salaries s
INNER JOIN titles t ON s.emp_no = t.emp_no
WHERE t.title = 'Staff'
GROUP BY s.emp_no;

-- 8. dept_manager의 모든 emp_no와 employees 테이블의 emp_no가 일치하는 모든 employee의  emp_no, last_name, first_name, hire_date, dept_no를 출력해주세요 dept_no는 dept_manager테이블에 있습니다.
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name), e.hire_date, dm.dept_no
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no;

-- 9. 현재 각 title (from titles)별 AVG(salary) from salaries 가 60,000이상인 title의  title과 AVG(salary) 를 정수로 내림차순 출력해주세요.
SELECT t.title, FLOOR(AVG(s.salary)) AS avg_salary
FROM titles t
INNER JOIN salaries s ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING avg_salary >= 60000
ORDER BY avg_salary DESC;

-- 10. gender가 f 인 employoee의 (from employees) title (from titles)별 employoee 수를 title과 함께 출력해 주세요 
SELECT t.title, COUNT(*) AS employee_count
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE e.gender = 'F'
GROUP BY t.title;

