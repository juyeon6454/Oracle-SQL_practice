create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

SELECT * FROM book;

AlTER TABLE book ADD(
    pubs varchar2(50)
);

ALTER TABLE book modify(
    title verchar2(100)
);

ALTER TABLE book drop(
    author
);

RENAME book TO article;

commit;

DROP TABLE author;
create table author(
    author_id number(10),
    author_name varchar2(100) NOT null,
    author_desc varchar2(500),
    PRIMARY key(author_id)
);

CREATE TABLE book (
book_id NUMBER(10),
title VARCHAR2(100) NOT NULL,
pubs VARCHAR2(100),
pub_date DATE,
author_id NUMBER(10),
PRIMARY KEY(book_id),
CONSTRAINT c_book_fk FOREIGN KEY (author_id)
REFERENCES author(author_id)
);

INSERT INTO author
VALUES (1, '박경리', '토지 작가 ' );

INSERT INTO author( author_id, author_name)
VALUES (2, '이문열' );

UPDATE author
SET author_name = '기안84' ,
    author_desc = '웹툰작가'
WHERE author_id = 1 ;

UPDATE author
SET author_name = '강풀',
    author_desc = '인기작가' 
WHERE author_id = 2 ;
select * from author;

DELETE
FROM AUTHOR a
WHERE a.AUTHOR_ID = 1;

DROP SEQUENCE seq_author_id;
CREATE SEQUENCE seq_author_id
INCREMENT BY 1
START WITH 1;

SELECT seq_author_id.nextval FROM dual;
SELECT seq_author_id.currval FROM dual;

INSERT INTO AUTHOR
values(seq_author_id.nextval, '박경리', '토지 작가 ');

INSERT INTO author
VALUES (seq_author_id.nextval, '이문열', '삼국지 작가');


-- 다음과 같이 출력되도록 테이블을 생성하고 데이터를 입력하세요

 CREATE SEQUENCE author_id;
 CREATE SEQUENCE author_name;
 VALUES (seq_author_id.nextval, '이문열', '삼국지 작가');
 
INSERT INTO book
values (book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22');


select * from author;
select * from book;

SELECT COUNT(8) FROM ;
/

declare




