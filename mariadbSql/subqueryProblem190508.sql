-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*) from employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date > now()
and b.salary > (select avg(salary) from salaries where to_date > now());

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.first_name, c.dept_no, b.salary as max_salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
and (c.dept_no, b.salary) = any (select c.dept_no, max(b.salary) as max_salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
group by c.dept_no);

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 

select a.emp_no, a.first_name, c.salary, d.avg_salary from employees a, dept_emp b, salaries c,
(select c.dept_no, avg(b.salary) as avg_salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
group by c.dept_no) d
where a.emp_no = b.emp_no and b.emp_no = c.emp_no and
b.to_date> now() and c.to_date>now()
and b.dept_no = d.dept_no and c.salary > d.avg_salary;


-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select b.emp_no, b.first_name, a.first_name,d.dept_name from employees a,(
select a.emp_no, a.first_name, c.emp_no as manager_no from employees a, dept_emp b, (select dept_no,emp_no from dept_manager
where to_date > now()) c
where a.emp_no = b.emp_no and b.to_date > now()
and b.dept_no = c.dept_no) b, dept_emp c, departments d
where c.to_date > now() and b.emp_no = c.emp_no and c.dept_no = d.dept_no
and a.emp_no = b.manager_no;

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.emp_no, c.first_name, d.title, e.salary, b.dept_no from dept_emp a,
(select c.dept_no, avg(b.salary) as avg_salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
group by c.dept_no
order by avg_salary desc limit 1) b, employees c, titles d, salaries e
where a.dept_no = b.dept_no and a.to_date>now()
and c.emp_no = a.emp_no and a.emp_no= d.emp_no and d.to_date >now() and e.to_date>now()
and e.emp_no = a.emp_no
order by e.salary desc;



-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

select c.dept_no
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
group by c.dept_no
order by avg(b.salary) desc limit 1;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select c.title
from employees a, salaries b, titles c
where a.emp_no = b.emp_no and b.emp_no = c.emp_no
and c.to_date > now() and b.to_date > now()
group by c.title
order by avg(b.salary) desc limit 1;


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select c.dept_name, a.first_name, d.salary,c.first_name, c.salary as 'manager salary' from employees a, dept_emp b
,(select d.dept_name, a.dept_no,c.first_name,b.salary from dept_manager a, salaries b,employees c, departments d
 where a.to_date>now() and b.to_date >now() 
 and a.emp_no = b.emp_no and a.emp_no = c.emp_no and d.dept_no = a.dept_no) c, salaries d
where a.emp_no = b.emp_no and b.to_date > now() and c.dept_no = b.dept_no
and d.emp_no = a.emp_no and d.to_date > now() and d.salary > c.salary;