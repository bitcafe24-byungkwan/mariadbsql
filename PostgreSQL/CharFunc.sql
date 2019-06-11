-- 문자형 함수
select upper('SeouL');

select lower('SeouL');
select substring('Happy Day', 3, 2);
  SELECT concat( first_name, ' ', last_name ) AS 이름,
         hire_date AS 입사일
    FROM employees
   WHERE to_char(hire_date, 'yyyy') = '1989';

select lpad('123456', 10, '-'), rpad('123456', 10, '-');

SELECT emp_no, LPAD(cast(salary as char), 10, '*')      
  FROM salaries     
 WHERE to_char(from_date,'yyyy-mm-dd') like '2001-%'       
   AND salary < 70000;

select concat('---', LTRIM(' hello '), '---'),
       concat('---', RTRIM(' hello '), '---'),
       concat('---', TRIM(' hello '), '---'),
       concat('---', TRIM(both 'x' from 'xxxxhelloxxxxx'), '---');
       