SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS d ;

select employee_id, first_name, last_name from employees;

SELECT e.FIRST_NAME , e.PHONE_NUMBER , e.HIRE_DATE , e.SALARY FROM EMPLOYEES e ;

--����� �̸�(first_name)�� ��(last_name), �޿�, ��ȭ��ȣ, �̸���, �Ի����� ����ϼ���
SELECT e.first_name "�̸�" , e.LAST_NAME "��" , e.SALARY"����" , e.PHONE_NUMBER"��ȭ��ȣ" , e.EMAIL"�̸���" , e.HIRE_DATE "�Ի���"
FROM EMPLOYEES e ;
-- ���ϴ� Į�� �̸� ���� 

select first_name, last_name from employees;

select first_name || last_name "name"
from employees;

select first_name ||' hire date is ' || hire_date
from employees;

select first_name, salary, salary*12, (salary+300)*12
from employees;

SELECT e.FIRST_NAME * 12
FROM EMPLOYEES e ;

--select first_name || "-" || last_name as "name" from employees;

select CONCAT('�����ٶ�','������ī') , '�����ٶ�' || '������ī' FROM DUAL;

SELECT concat( CONCAT(e.FIRST_NAME , '-'), e.LAST_NAME) ,
e.SALARY , e.SALARY * 12, (e.SALARY * 12) +5000, e.PHONE_NUMBER
FROM EMPLOYEES e ;

select first_name from employees where department_id = 10;

select first_name, salary from employees where salary >= 15000 ;

SELECT *
FROM EMPLOYEES e
WHERE e.HIRE_DATE >= '07/01/01';

SELECT TO_CHAR(e.HIRE_DATE, 'yy/mm/dd')
FROM EMPLOYEES e ;

SELECT e.SALARY * 12
FROM EMPLOYEES e
WHERE e.FIRST_NAME = 'LEX';

select first_name, salary from employees where salary >= 14000 and salary <= 17000;

select * FROM EMPLOYEES e WHERE e.HIRE_DATE >= '04/01/01' AND e.HIRE_DATE <= '05/12/31';

select first_name, last_name, salary from employees where first_name in ('Neena', 'Nex', 'Jhon');

select first_name, last_name, salary
from employees
where first_name like 'L__';


--���Ŵ����� ���� Ŀ�̼Ǻ����� ���� ������ �̸��� ����ϼ���
SELECT * FROM EMPLOYEES e ;
SELECT * FROM EMPLOYEES e WHERE e.MANAGER_ID IS NULL
AND e.COMMISSION_PCT IS NULL;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 9000
ORDER BY SALARY DESC;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
ORDER BY SALARY ASC;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 9000
ORDER BY SALARY ASC, DESC;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
ORDER BY SALARY ASC;

-- �μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ����ϼ���
SELECT DEPARTMENT_ID, SALARY,FIRST_NAME FROM EMPLOYEES
ORDER BY DEPARTMENT_ID asc;

-- �޿��� 5000 �̻��� ������ �̸�, �޿��� �޿��� ū�������� ����ϼ���
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 5000
ORDER BY SALARY DESC;

--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ�� ������ �޿��� ���� ������� �μ���ȣ, �޿�, �̸��� ����ϼ���
SELECT DEPARTMENT_ID, SALARY, FIRST_NAME FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

SELECT EMAIL, INITCAP(EMAIL), DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3), SUBSTR(FIRST_NAME, -3, 2) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

select first_name, 
lpad(first_name,10,'*'), 
rpad(first_name,10,'*')
from employees;

select first_name, 
replace(first_name, 'a', '*') 
from employees
where department_id =100;

select first_name, 
replace(first_name, 'a', '*'), 
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

select round(123.346, 2) "r2",
round(123.456, 0) "r0",
round(123.456, -1) "r-1"
from dual;

select trunc(123.346, 2) "r2",
trunc(123.456, 0) "r0",
trunc(123.456, -1) "r-1"
from dual;

select sysdate
from dual;

select sysdate
from employees;

--�Ի����� ��ŭ �귶���� �������� ������
select months_between(sysdate, hire_date) 
from employees
where department_id = 110;

select first_name, to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id =110;

select sysdate, 
to_char(sysdate, 'YYYY"��"-MM"��"-DD"��" HH24:MI:SS') as "Date" from dual;


select commission_pct, nvl(commission_pct, 0)
from employees;

select commission_pct, nvl2(commission_pct, 100, 0)
from employees;

-- ���� 1. 
--��ü������ ���� ������ ��ȸ�ϼ���. ������ �Ի���(hire_date)�� �ø�����(ASC)���� \
--���� ���Ӻ��� ����� �ǵ��� �ϼ���. �̸�(first_name last_name),  ����(salary), \
--��ȭ��ȣ(phone_number), �Ի���(hire_date) �����̰� ���̸���, �����ޡ�, ����ȭ��ȣ��, 
-- ���Ի��ϡ� �� �÷��̸��� ��ü(column alias)�� ������.

SELECT FIRST_NAME || ' '  || LAST_NAME "�̸�", SALARY "����", PHONE_NUMBER"��ȭ��ȣ", HIRE_DATE"�Ի���" FROM employees
ORDER BY HIRE_DATE ASC;

-- ����2.
-- ����(job_id)�� ����(salary)�� ������ ��������(DESC)�� �����ϼ���.
SELECT JOB_ID, SALARY FROM EMPLOYEES
ORDER BY SALARY DESC ;

-- ����3.
-- ��� �Ŵ����� �����Ǿ������� Ŀ�̼Ǻ����� ����, ������ 3000�ʰ��� ������ �̸�, �Ŵ������̵�, 
-- Ŀ�̼� ����, ���� �� ����ϼ���.

SELECT e.FIRST_NAME, e.MANAGER_ID, e.COMMISSION_PCT ,  e.SALARY 
FROM EMPLOYEES e
WHERE e.MANAGER_ID IS NOT NULL
AND e.COMMISSION_PCT IS NULL
AND e.SALARY>3000;

-- ����4.
-- �ְ����(max_salary)�� 10000 �̻��� ������ �̸�(job_title)�� �ְ����(max_salary)�� 
-- �ְ������(max_salary) ��������(DESC)�� �����Ͽ� ����ϼ���.    

SELECT j.JOB_TITLE , j.MAX_SALARY
FROM JOBS J
WHERE j.MAX_SALARY >= 10000
ORDER BY 2 desc;

-- ����5.(15��)
-- ������ 14000 �̸� 10000 �̻��� ������ �̸�(first_name), ����, Ŀ�̼��ۼ�Ʈ ��  
-- ���޼�(��������) ����ϼ���. �� Ŀ�̼��ۼ�Ʈ �� null �̸� 0 ���� ��Ÿ���ÿ�       

SELECT e.FIRST_NAME , e.SALARY , NVL(e.COMMISSION_PCT, 0)
FROM EMPLOYEES e
WHERE e.SALARY >= 10000
AND e.SALARY < 14000
ORDER BY e.SALARY DESC;

-- ����6.
-- �μ���ȣ�� 10, 90, 100 �� ������ �̸�, ����, �Ի���, �μ���ȣ�� ��Ÿ���ÿ�
-- �Ի����� 1977-12 �� ���� ǥ���Ͻÿ�

SELECT FIRST_NAME, SALARY, to_char(HIRE_DATE, 'YYYY-MM') ,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (10,90,100);
-- =DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 90 DEPARTMENT_ID = 100;

-- ����7.
-- �̸�(first_name)�� S �Ǵ� s �� ���� ������ �̸�, ������ ��Ÿ���ÿ�

SELECT FIRST_NAME, SALARY FROM employees 
WHERE FIRST_NAME = s;

-- ����8.
-- ��ü �μ��� ����Ϸ��� �մϴ�. ������ �μ��̸��� �� ������� ����� ������.

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
ORDER BY LENGTH(DEPARTMENT_NAME) DESC;

-- ����9.
-- ��Ȯ���� ������, ���簡 ���� ������ ����Ǵ� ������� �����̸��� �빮�ڷ� ����ϰ�
-- ��������(ASC)���� ������ ������.

SELECT DISTINCT d.LOCATION_ID 
FROM DEPARTMENTS d ;

SELECT DISTINCT l.COUNTRY_ID 
FROM LOCATIONS l 
WHERE l.LOCATION_ID IN (1800,
2400,
1400,
2500,
1700,
2700,
1500);

SELECT UPPER(c.COUNTRY_NAME)  
FROM COUNTRIES c 
WHERE c.COUNTRY_ID IN ('US',
'CA',
'DE',
'UK')
ORDER BY 1; 

-- ����10.
-- �Ի����� 2003/12/31 �� ���� (31�� ����) �Ի��� ������ �̸�, ����, ��ȭ ��ȣ, �Ի����� ����ϼ���
-- ��ȭ��ȣ�� 545-343-3433 �� ���� ���·� ����Ͻÿ�.

SELECT FIRST_NAME, SALARY, REPLACE(PHONE_NUMBER,'.','-'), HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE <= '2003/12/31' ;

SELECT PHONE_NUMBER FROM EMPLOYEES;

