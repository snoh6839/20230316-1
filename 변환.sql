-- SELECT if( 1 < 2 , '참', '거짓');

-- SELECT emp_no, if( emp_no = 10001 , first_name, birth_date )
-- FROM employees;

-- SELECT IFNULL(NULL,'aa');
-- SELECT IFNULL('123','aa');

-- SELECT CAST(1234 AS CHAR(4));

-- SELECT
-- 		emp_no,
-- 		gender, 
-- 		CASE gender
-- 			when 'm' then '남자'
-- 			when 'f' then '여자'
-- 			ELSE ''
-- 		end
-- FROM employees LIMIT 10;

-- SELECT
-- 		emp_no,
-- 		title, 
-- 		CASE title
-- 			when 'senior engineer' then '관리자'
-- 			ELSE '팀원'
-- 		end AS k_title
-- FROM titles;		
