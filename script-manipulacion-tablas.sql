select sysdate from dual;
-- drop table x;
create table x (
a number (10,3) default 7634.734
, b varchar (40)
, c date
);

-- drop table x2
create table x2 (
a number (10,3) default seq_pruebas.nextval check (a > 0) 
, b varchar (40) default 60 not null
, c date check (c >= '01-jan-2015')
, d number (4) check (d in (26, 83, 94, 7634))
);

insert into x2 (a, c, d) values (7845, '01-jan-2020', 94);
insert into x2 (c, d) values ('01-jan-2020', 94);
select * from x2;

insert into x values (781234, 'hello world', '01-jan-2015');
insert into x (b, c) values ('viva saprissa', '13-sep-2015');
update x set a = 4378;
select * from x;
rollback;
commit;

delete x;



create sequence seq_pruebas start with 40 increment by 3;

--select seq_pruebas.nextval as helloworld from dual;
select seq_pruebas.currval as helloworld from dual;

alter sequence seq_pruebas increment by -4;



select sysdate from dual;
-- drop table x4;
create table x4 (
b varchar (40)  
, a number (10,3)
, c date
, constraint pk_x3 primary key (b)
);

insert into x4 (a, c, b) values (895, sysdate, 10);