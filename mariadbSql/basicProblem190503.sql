#1
select concat(last_name,' ', first_name) as 'full name' from employees
where emp_no = 10944;

#2
select concat(last_name,' ', first_name) as '이름',
		gender as '성별',
        hire_date as '입사일' 
        from employees
order by 입사일 asc;

#3
select gender,count(*) from employees group by gender;

#4
select count(*) from salaries where now() between from_date and to_date;

#5
select count(*) from departments;

#6
select count(*) from dept_manager where now() between from_date and to_date;

#7
select dept_name from departments order by CHAR_LENGTH(dept_name) desc;

#8
select count(*) from salaries where now() between from_date and to_date and salary > 120000;

#9
select distinct title from titles order by CHAR_LENGTH(title) desc;

#10
select count(*) from titles where now() between from_date and to_date and title = 'Engineer';

#10
select * from titles where emp_no = 13250 order by to_date desc;