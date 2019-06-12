create table member1(
	no int,
	email varchar(50) not null default '',
	password varchar(50) not null,
	name varchar(25),
	dept_name varchar(25),
	primary key(no)
	
);


--add new column
alter table member1 add juminbunho char(13) not null;
alter table member1 add join_date timestamp not null;

-- delete column
alter table member1 drop juminbunho;

-- change column type
alter table member1 alter column no type bigint using no::bigint;

--not null ����
alter table member1 alter column no set not null;
alter table member1 alter column dept_name set not null;

--not null ����
alter table member1 alter column dept_name drop not null;

--default ����
create sequence member1_seq;
alter table member1 alter column no set default nextval('member1_seq');

--column �̸� ����
alter table member1 rename column dept_name to department_name;
