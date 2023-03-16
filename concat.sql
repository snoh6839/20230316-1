-- SELECT CONCAT('성: ', last_name, ' 이름: ',first_name)
-- FROM employees
-- WHERE emp_no = 500000;

-- SELECT CONCAT_WS('/',2023,03,16);

-- SELECT FORMAT (123456, 2);
-- 소수점 자리수 추가해줌

-- SELECT LEFT ('abcdefg', 3);
-- 왼쪽부터, 숫자만큼 잘라줌
-- SELECT right ('abcdefg', 3);
-- 오른쪽부터, 숫자만큼 잘라줌

-- SELECT UPPER('AbCDeF');
-- SELECT lower('AbCDeF');

-- SELECT LPAD('1',6,'0');
-- SELECT LPAD('956',6,'0');
-- SELECT RPAD('956',6,'0');

-- SELECT TRIM('    a   cb    ');
-- SELECT LTRIM('    a   cb    ');
-- SELECT RTRIM('    a   cb    ');
-- SELECT TRIM(LEADING 'abc' FROM 'abcdefabc'); 
-- SELECT TRIM(TRAILING 'abc' FROM 'abcdefabc');

-- SELECT SUBSTRING('abcdfeg', 2, 4);
-- SELECT SUBSTRING_INDEX('ab-cda-fe-g', '-', 2);

-- CEILING(1.1)
-- FLOOR(1.9)
-- ROUND(1.5)
-- ROUND(1.4)
-- TRUNCATE(2, 1.11)
