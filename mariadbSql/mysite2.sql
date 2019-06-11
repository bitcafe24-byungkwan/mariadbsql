-- getList
select no, name from author;


-- insert
insert into author values(null,'스테파니메이어');
insert into author values(null,'조정래');

desc book;
insert into book values(null,'트와일라잇','대여가능',2);
insert into book values(null,'뉴문','대여가능',2);
insert into book values(null,'이클립스','대여가능',2);
insert into book values(null,'브레이킹던','대여가능',2);

select a.no, a.title, b.name, a.status from book a
join author b on a.author_no = b.no
order by a.no;

-- update
update book
 set status = '대여가능'
 where no=1;
 
 desc guestbook;
  select * from guestbook;

 desc user;
 select no, name, contents, date_format(reg_date, '%Y-%m-%d %H:%i:%s') from guestbook
 order by reg_date desc;
 
 insert into user
 values(null,'안대혁','a@b.c','1234','male',now());
 
 select * from user
 where password like '%';
 delete from board where no < 100;
 
 show tables;
 desc board;
 insert into board
		values(null,title ,contents ,0,now(),(select ifnull(max(b1.group_no),0)+1 from board b1),1,0,2);			

select * from board;
update board set status = 'DELETED' where no = 10;

select a.no, a.title, a.contents, a.hit, a.depth,a.group_no as groupNo, a.order_no as orderNo, date_format(a.reg_date, '%Y-%m-%d %H:%i:%s') as regDate,b.name as userName 
			from board a
            join user b on a.user_no = b.no
order by a.group_no desc, a.order_no asc;

desc site;
insert into site values(null, 'Mysite', '안녕하세요. 안대혁의 mysite에 오신 것을 환영합니다.','/images/profile/2019421113336531.jpg''2019421113336531.jpg','이 사이트는 웹 프로그램밍 실습과제 예제 사이트입니다.
메뉴는 사이트 소개, 방명록, 게시판이 있구요. Python 수업 + 데이터베이스 수업 + 웹프로그래밍 수업 배운 거 있는거 없는 거 다 합쳐서 만들어 놓은 사이트 입니다.');

select * from site;
select * from user;
insert into user values(1, '관리자','admin@mysite.com','1234','male','USER',now());
alter table user add column role enum('USER','ADMIN') NOT NULL after gender;
update user set role = 'ADMIN' where no=1;
update site set profile = '/images/profile/2019421113336531.jpg' where no = 1; 