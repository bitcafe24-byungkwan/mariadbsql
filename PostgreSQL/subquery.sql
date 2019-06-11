-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 
-- 출력해보세요. 
select a.emp_no, a.first_name
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = (select b.dept_no
					 from employees a, dept_emp b
					where a.emp_no = b.emp_no
					  and b.to_date = '9999-01-01'
                      and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');

                     
-- ex2-2) TOP-K
SELECT 
    b.title, AVG(a.salary) AS avg_salary
FROM
    salaries a,
    titles b
WHERE
    a.emp_no = b.emp_no
        AND a.to_date = '9999-01-01'
        AND b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY avg_salary asc
   LIMIT 1
  OFFSET 0; 

 
 -- 예제:현재 급여가 50000 이상인 직원 이름 출력
-- sol1) 조인해결
select a.first_name,  b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.salary > 50000;

-- sol2) 서브쿼리 해결
select a.first_name,  b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) =any (select emp_no, salary
									from salaries
								   where to_date = '9999-01-01'
									 and salary > 50000);  

select a.first_name,  b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) in (select emp_no, salary
									from salaries
								   where to_date = '9999-01-01'
									 and salary > 50000);