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
VALUES (1, '�ڰ渮', '���� �۰� ' );

INSERT INTO author( author_id, author_name)
VALUES (2, '�̹���' );

UPDATE author
SET author_name = '���84' ,
    author_desc = '�����۰�'
WHERE author_id = 1 ;

UPDATE author
SET author_name = '��Ǯ',
    author_desc = '�α��۰�' 
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
values(seq_author_id.nextval, '�ڰ渮', '���� �۰� ');

INSERT INTO author
VALUES (seq_author_id.nextval, '�̹���', '�ﱹ�� �۰�');


-- ������ ���� ��µǵ��� ���̺��� �����ϰ� �����͸� �Է��ϼ���

 CREATE SEQUENCE author_id;
 CREATE SEQUENCE author_name;
 VALUES (seq_author_id.nextval, '�̹���', '�ﱹ�� �۰�');
 
INSERT INTO book
values (book_id.nextval, '�츮���� �ϱ׷��� ����', '�ٸ�', '1998-02-22');


select * from author;
select * from book;

SELECT COUNT(8) FROM ;
/

declare




