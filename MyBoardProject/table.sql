create table mb_tbl(
id varchar2(10) primary key,
name varchar2(10) not null,
email varchar2(40) not null,
pw varchar2(11) not null,
birth date not null,
tel number(10) not null
)

DROP TABLE mb_tbl

SELECT * FROM MB_TBL
