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

CREATE TABLE bd_tbl(
   id varchar2(10) NOT null,
   num NUMBER(4) PRIMARY KEY,
   title VARCHAR2(100) NOT NULL,
   content VARCHAR2(2000) NOT NULL,
   writeday DATE DEFAULT SYSDATE,
   readcnt NUMBER(6) DEFAULT 0,
   repRoot NUMBER(4),
   repStep NUMBER(4),
   repIndent NUMBER(2),
   constraint fk_bd_tbl_id foreign key(id) references mb_tbl(id)
)

SELECT * FROM BD_TBL

SELECT COUNT(num) FROM bd_tbl




