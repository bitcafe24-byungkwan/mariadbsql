select * from departments;

select concat(last_name,' ', first_name) as "�̸�",
		gender as "����",
        hire_date as "�Ի���" 
        from employees
order by �Ի��� asc;

select concat(first_name, ' ', last_name) as "�̸�",
       gender as "����",
       hire_date as "�Ի���"
  from employees
 where hire_date <= '1988-12-31'
   and gender = 'F';
   
  select emp_no, dept_no
  from dept_emp
 where dept_no in ('d005', 'd009'); 