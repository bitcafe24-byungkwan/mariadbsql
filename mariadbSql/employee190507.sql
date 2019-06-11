#ex1: 각 사원별로 평균연봉 출력
select emp_no, AVG(salary)
from salaries
group by emp_no;

#ex2 : 각 현재 Manager 직책 사원에 대한  평균 연봉은?
select emp_no, title from titles where title = 'Manager';

#ex3 : 사원별 몇 번의 직책 변경이 있었는지 조회
select emp_no, count(title) from titles
group by emp_no;

#ex4 : 각 사원별로 평균연봉 출력하되 50,000불 이상인 직원만 출력
SELECT emp_no, AVG(salary)    
    FROM salaries   
GROUP BY emp_no having AVG(salary) > 50000;

#ex5 : 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select title, count(*) as num from titles where to_date > '2019-05-07'
group by title having num >=100;

#ex6 : 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
SELECT 
    c.dept_no, d.dept_name, AVG(a.salary)
FROM
    salaries a,
    titles b,
    dept_emp c,
    departments d
WHERE
    a.emp_no = b.emp_no
        AND b.emp_no = c.emp_no
        AND c.dept_no = d.dept_no
        AND a.to_date > NOW()
        AND b.to_date > NOW()
        AND b.title = 'Engineer'
GROUP BY c.dept_no;

#ex7 : 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요 단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
#        대해서 내림차순(DESC)로 정렬하세요.   
SELECT 
    title, sum(salary)
FROM
    titles a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND a.to_date > NOW()
        AND b.to_date > NOW()
        group by title having sum(salary) > 2000000000
        order by sum(salary) desc;
        
# employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요.
select a.first_name, b.title, a.gender from employees a, titles b where a.emp_no = b.emp_no and a.gender = 'F';

#ex10 : ANSI/ISO SQL 1999// employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요. 
#join on
select a.first_name, b.title, a.gender from employees a
join titles b on a.emp_no = b.emp_no where a.gender = 'F';
#natural join
select a.first_name, b.title, a.gender from employees a
join titles b where a.gender = 'F';
#join using
select a.first_name, b.title, a.gender from employees a
join titles b using (emp_no) where a.gender = 'F';

#실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를 사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
SELECT 
    a.first_name, b.dept_no, c.dept_name
FROM
    employees a
        LEFT JOIN
    dept_emp b ON a.emp_no = b.emp_no
        JOIN
    departments c ON b.dept_no = c.dept_no
WHERE
    b.to_date > NOW() AND b.dept_no IS NULL;

#실습문제 2:  현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요. 사번, 전체이름, 연봉 이런 형태로 출력하세요.
SELECT 
    a.first_name, b.dept_no, c.dept_name
FROM
    employees a
        LEFT JOIN
    dept_emp b ON a.emp_no = b.emp_no
        JOIN
    departments c ON b.dept_no = c.dept_no
WHERE
    b.to_date > NOW() AND b.dept_no IS NULL;