-- 실습
-- 1. employee의 emp_no, last_name, first_name from employees  그리고  title from titles을 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, t.title
FROM employees e
	INNER JOIN titles t
		ON e.emp_no = t.emp_no;

-- emp_no, CONCAT 함수로 직원의 성(last name)과 이름(first name)을 띄어쓰기로 연결하여 하나의 문자열로 합쳐주고,
-- 직책(title) 을 선택해서
-- "employees"테이블에서 데이터를 가져와서
-- INNER JOIN 으로 "titles" 테이블 데이터와  emp_no 열이 일치하는 행을 결합해서
-- 해당 직책이 있는 직원만 결과 집합에 포함되도록 했습니다.

-- 2. employee의 emp_no, gender from employees  그리고  현재 salary from salaries을 출력해주세요
SELECT e.emp_no, e.gender, s.salary
FROM employees e
	INNER JOIN salaries s
		ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- emp_no, 성별(gender), 급여(salary) 를 선택하여
-- "employees"의 테이블에서 데이터를 가져와
-- INNER JOIN으로 emp_no 열이 "salaries" 테이블에서 일치하는 행을 결합했습니다.
-- 이를 통해 직원과 그들의 현재 급여 정보가 결과 집합에 포함됩니다.
-- WHERE 절은 s.to_date가 '9999-01-01'인 행만 선택해서 현재 유효한 급여 정보만 선택하도록 필터링했습니다.

-- 3. 10010 employee의 last_name, first_name from employees, 그리고 salary 이력  from salaries을 출력해주세요
SELECT concat(e.last_name, ' ' ,e.first_name) AS Full_name, s.salary, s.from_date, s.to_date
FROM employees e
	INNER JOIN salaries s
		ON e.emp_no = s.emp_no
WHERE e.emp_no = 10010;

-- CONCAT 함수로 직원의 성(last name)과 이름(first name)을 띄어쓰기로 연결하여 하나의 문자열로 합쳐주고,
-- 급여, 시작일, 마지막일을 선택하여 이력을 확인 할 수 있도록 했고
-- "employees"의 테이블에서 데이터를 가져와
-- INNER JOIN으로 emp_no 열이 "salaries" 테이블에서 일치하는 행을 결합했습니다.
-- WHERE 절은 emp_no 가 10010인 직원을 선택하여 한 사람의 이력만 나오도록 해줬습니다.

-- 4. dept_emp의 dept_no와 departments의 dept_no를 연결해 dept_name을 employee의 emp_no, last_name, first_name from employees 와 함께 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no;

-- 5. 현재 salary from salaries 의 상위 10위까지 employee의  last_name, first_name from employees와 월급을 출력해 주세요.
SELECT concat(employees.last_name, ' ' ,employees.first_name) AS Full_name, salaries.salary
FROM employees
	INNER JOIN (
	  SELECT emp_no, salary, RANK() OVER (ORDER BY salary DESC) as salary_rank
	  FROM salaries
	  WHERE to_date = '9999-01-01'
	) salaries
		ON employees.emp_no = salaries.emp_no
WHERE salaries.salary_rank <= 10;

-- 직원의 이름과 해당 직원의 현재 연봉을 선택하여
-- INNER JOIN 으로 emp_no 열이 일치하는 두 테이블의 행을 결합합니다.
-- 이를 통해 직원과 그들의 현재 연봉 정보가 결과에 포함됩니다.
-- 서브쿼리에는 to_date가 '9999-01-01'인 행에서
-- emp_no, salary, 그리고 해당 직원의 연봉순위(salary_rank)를 선택합니다.
-- RANK() 함수를 사용하여 salaries 테이블을 salary 값에 따라 내림차순으로 정렬한 후 각 행에 대한 순위를 부여합니다. 
-- WHERE 절은 salary_rank가 10 이하인 직원만 선택해 하위 10명의 연봉을 가진 직원만 결과 집합에 포함합니다.

-- SELECT concat(e.last_name, ' ' ,e.first_name), s.salary
-- FROM employees e
-- INNER JOIN salaries s ON e.emp_no = s.emp_no
-- WHERE s.to_date = '9999-01-01'
-- ORDER BY s.salary DESC
-- LIMIT 10;
-- 어제 리미트 방식이 빨라 써봤는데
-- 리미트 방식 rank 방식보다 .3초 느려서 코멘트 아웃처리했습니다.

-- 6. dept_manager테이블의 emp_no를employees와 연결해 first_name을 구하고 dept_manager에서  각 dept_no의 to_date가 가장 큰 사람의 first_name과 to_date를 출력해 주세요
SELECT concat(e.last_name, ' ' ,e.first_name) AS Full_name, e.hire_date, d.dept_name, dm.from_date
FROM employees e
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
		AND dm.to_date = '9999-01-01'
	INNER JOIN departments d
		ON dm.dept_no = d.dept_no;

--


-- 7. 현재 title이 staff인 employee의 (from titles) 현재 평균 salary (from salaries)을 emp_no와 함께 출력해 주세요
SELECT s.emp_no, t.title, AVG(s.salary) AS avg_salary
FROM salaries s
	INNER JOIN titles t
		ON s.emp_no = t.emp_no
WHERE t.title = 'Staff'
GROUP BY s.emp_no;

-- 현재 staff인 직원의  전체 평균
SELECT t.title, AVG(s.salary) AS avg_salary
FROM salaries s
	INNER JOIN titles t
		ON s.emp_no = t.emp_no
WHERE t.title = 'Staff'
	AND s.to_date = '9999-01-01'
GROUP BY t.title;

-- 8. dept_manager의 모든 emp_no와 employees 테이블의 emp_no가 일치하는 모든 employee의  emp_no, last_name, first_name, hire_date, dept_no를 출력해주세요 dept_no는 dept_manager테이블에 있습니다.
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, e.hire_date, dm.dept_no
FROM employees e
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no;

-- 9. 현재 각 title (from titles)별 AVG(salary) from salaries 가 60,000이상인 title의  title과 AVG(salary) 를 정수로 내림차순 출력해주세요.
SELECT t.title, FLOOR(AVG(s.salary)) AS avg_salary
FROM titles t
	INNER JOIN salaries s
		ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING avg_salary >= 60000
ORDER BY avg_salary DESC;

-- 현재salary 평균값으로 다시 구하기
SELECT t.title, FLOOR(AVG(s.salary)) AS avg_salary
FROM titles t
	INNER JOIN salaries s
		ON t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY t.title
HAVING avg_salary >= 60000
ORDER BY avg_salary DESC;

-- 10. gender가 f 인 employoee의 (from employees) title (from titles)별 employoee 수를 title과 함께 출력해 주세요 
SELECT t.title, COUNT(*) AS employee_count
FROM employees e
	INNER JOIN titles t
		ON e.emp_no = t.emp_no
WHERE e.gender = 'F'
GROUP BY t.title;

