select * from departments;

select concat(last_name,' ', first_name) as "이름",
		gender as "성별",
        hire_date as "입사일" 
        from employees
order by 입사일 asc;

select concat(first_name, ' ', last_name) as "이름",
       gender as "성별",
       hire_date as "입사일"
  from employees
 where hire_date <= '1988-12-31'
   and gender = 'F';
   
  select emp_no, dept_no
  from dept_emp
 where dept_no in ('d005', 'd009'); 