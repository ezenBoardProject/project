create table mb_tbl3(
id varchar2(10) primary key,
name varchar2(10) not null,
email varchar2(40) not null,
pw varchar2(11) not null,
birth date not null,
tel number(20) not null
)

SELECT * FROM mb_tbl3

DELETE FROM mb_tbl3