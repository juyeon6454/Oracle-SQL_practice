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

select count(*), count(commission_pct) from employees;

select count(*), sum(salary), avg(salary) from employees;

select count(*), sum(salary), avg(nvl(salary,0)) from employees;

select count(*), max(salary), min(salary) from employees;

select avg(e.salary) from employees e order by department_ID;

select avg(e.salary) from employees e GROUP by department_ID;
--� �μ��� ������� �׷����� ��� �����Լ��� ����ϱ� ����?

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and department_id = 100;

--���� 1. 
--��-���߿� �ְ��ӱ�(salary)��  �����ӱ��� ���ְ��ӱ�, �������ӱݡ��������� Ÿ��Ʋ�� �Բ� ����� ������. 
--�� �ӱ��� ���̴� ���ΰ���?  ���ְ��ӱ� ? �����ӱݡ��̶� Ÿ��Ʋ�� �Բ� ����� ������.
select count(*), max(salary)"�ְ��ӱ�", min(salary)"�����ӱ�" ,
max(salary) - min(salary) "�ְ��ӱ� - �����ӱ�" from employees;


--����2.
--���������� ���Ի���� ���� ���� ���� �Դϱ�? ���� �������� ������ּ���.
--��) 2014�� 07�� 10��

select to_char(max(hire_date), 'yyyy"��" mm"��" dd"��"')
from employees;


--����3.
--�μ����� ����ӱ�, �ְ��ӱ�, �����ӱ��� �μ�(department_id)�� �Բ� ����ϰ� ���ļ�����
--�μ���ȣ(department_id) ���������Դϴ�.
SELECT e.DEPARTMENT_ID "�μ�", 
    avg(NVL(e.SALARY, 0)) "����ӱ�",
    MAX(e.SALARY) "�ְ��ӱ�",
    MIN(e.SALARY) "�����ӱ�"
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID
ORDER BY e.DEPARTMENT_ID DESC;

--����4.
--����(job_id)���� ����ӱ�, �ְ��ӱ�, �����ӱ��� ����(job_id)�� �Բ� ����ϰ� ���ļ����� ����(job_id) ���������Դϴ�.
select job_id, avg(salary), max(salary), min(salary)
--round(avg(salary),2)) / avg(nvl(e.salary,0))
from employees
group by job_id
order by job_id desc;


--����5.
--���� ���� �ټ��� ������ �Ի����� �����ΰ���? ���� �������� ������ּ���.
--��) 2014�� 07�� 10��
select to_char(min(hire_date), 'yyyy"��" mm"��" dd"��"')
from employees;

--����6.
--����ӱݰ� �����ӱ��� ���̰� 2000 �̸��� �μ�(department_id), ����ӱ�, �����ӱ� �׸��� (����ӱ� ? �����ӱ�)�� (����ӱ� ? �����ӱ�)�� ������������ �����ؼ� ����ϼ���.
SELECT
    DEPARTMENT_ID "�μ�",
    ROUND(AVG(NVL(SALARY, 0)),2) "����ӱ�" ,
    MIN(SALARY) "�����ӱ�",
    ROUND(AVG(NVL(SALARY, 0)) - MIN(SALARY),2) "����ӱ� - �����ӱ�"
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
HAVING
     AVG(NVL(SALARY, 0)) - MIN(SALARY) < 2000
ORDER BY
     4 DESC ;

--����7.
--����(Job_id)���� �ְ��ӱݰ� �����ӱ��� ���̸� ����غ�����.
--���̸� Ȯ���� �� �ֵ��� ������������ �����ϼ���? 

select job_id, max(salary) - min(salary)
from employees
group by job_id
order by max(salary) - min(salary) desc;



SELECT employee_id, 
        salary,
        job_id,
        CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
             WHEN job_id = 'AC_MGR' THEN salary + salary *0.2
             ELSE salary
        END salary
FROM employees;


--������ �̸�, �μ�, ���� ����ϼ���
--���� �μ��ڵ�� �����ϸ� �μ��ڵ尡 10~50 �̸� ��A-TEAM��
--60~100�̸� ��B-TEAM�� 110~150�̸� ��C-TEAM�� �������� ���������� ���� ����ϼ���

select first_name, department_id, 
case when department_id between 10 and 50 then 'A-TEAM'
     when department_id between 60 and 100 then 'B-TEAM'
     when department_id between 110 and 150 then 'C-TEAM'
     else '������'                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
end "team"
from employees;

-----------------------------join---------------------------------------

select count(*)
from employees, departments;

select first_name, department_name
from employees, departments;

select first_name, em.department_id, 
    department_name, de.department_id
from employees em, departments de
where em.department_id = de.department_id;


--[����]
--������ �̸�, ���޸�Ī�� ����ϼ���
--Join �� ���̺� ( Employees, Jobs )

SELECT e.FIRST_NAME, j.JOB_ID, j.JOB_TITLE
FROM EMPLOYEES e , JOBS j
WHERE e.JOB_I  = j.JOB_ID ;

SELECT first_name, em.department_id, department_name, de.department_id
from employees em, departments de
where em.department_id = de.department_id;

--[����] ��� �����̸�, �μ��̸�, ������ �� ����ϼ���
select *
FROM EMPLOYEES e , DEPARTMENTS d, JOBS j
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.JOB_ID = j.job_ID;
--AND e.FIRST_NAME LIKE '%S%';


--=====================================================================


SELECT el.first_name, e2.first_name
from employees el, employees e2
where el.manager_id = e2.employee_id
order by 1;

select e.department_id, e.first_name, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id ; 

--���� 1. 
--�� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), �μ���(department_name), �Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�ϼ���.

SELECT 
    e.EMPLOYEE_ID "���", 
    e.FIRST_NAME "�̸�", 
    d.DEPARTMENT_NAME "�μ���", 
    m.FIRST_NAME "�Ŵ��� �̸�"
FROM 
    EMPLOYEES e, 
    EMPLOYEES m , 
    DEPARTMENTS d
WHERE 
    e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    AND e.MANAGER_ID = m.EMPLOYEE_ID ;

--����2.
--����(regions)�� ���� ������� �����̸�(region_name), �����̸�(country_name)���� ����ϵ� �����̸�, �����̸� ������� ������������ �����ϼ���.
--//25����

SELECT
    r.REGION_NAME "�����̸�",
    c.COUNTRY_NAME "�����̸�"
FROM 
    REGIONS r,
    countries c
WHERE 
    r.REGION_ID= c.REGION_ID
ORDER BY
    1 DESC,2 DESC;

--����3.
--�� �μ�(department)�� ���ؼ� �μ���ȣ(department_id), �μ��̸�(department_name),
-- �Ŵ���(manager)�� �̸�(first_name), ��ġ(locations)�� ����(city), ����(countries)�� �̸�(countries_name) 
--�׸��� ��������(regions)�� �̸�(region_name)���� ���� ����� ������.
--//11��
SELECT
    d.DEPARTMENT_ID "�μ���ȣ" ,
    d.DEPARTMENT_NAME "�μ��̸�" ,
    e.FIRST_NAME "�Ŵ����� �̸�" ,
    l.CITY "��ġ�� ����" ,
    c.COUNTRY_NAME "������ �̸�" ,
    r.REGION_NAME "�������� �̸�"
FROM
    DEPARTMENTS d ,
    EMPLOYEES e,
    LOCATIONS l,
    COUNTRIES c,
    REGIONS r
WHERE
    d.MANAGER_ID = e.EMPLOYEE_ID
    AND d.LOCATION_ID = l.LOCATION_ID
    AND l.COUNTRY_ID = c.COUNTRY_ID
    AND c.REGION_ID = r.REGION_ID ;
    
    
--����4.
--��Public Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����ϼ���. (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ������� �ʽ��ϴ�.) �̸��� first_name�� last_name�� ���� ����մϴ�.
--//2��
SELECT
    e.EMPLOYEE_ID ,
    e.FIRST_NAME || ' ' || e.LAST_NAME
FROM 
    EMPLOYEES e , JOB_HISTORY jh, JOBS j
WHERE
    e.EMPLOYEE_ID = jh.EMPLOYEE_ID
    AND jh.JOB_ID = j.JOB_ID
    AND j.JOB_TITLE = 'Public Accountant';

--����5.
--�������� ���(employee_id), �̸�(first_name), ��(last_name)�� �μ� �̸�(department_name)�� ��ȸ�Ͽ� ��(last_name)������ �������� �����ϼ���
--//106 ��  (+  �μ��� ���� ����� ��ȸ �ǵ���.. 107��)
SELECT
    e.EMPLOYEE_ID,
    e.FIRST_NAME,
    e.LAST_NAME,
    d.DEPARTMENT_NAME
FROM 
    EMPLOYEES e ,
    DEPARTMENTS d 
WHERE 
    e.DEPARTMENT_ID = d.DEPARTMENT_ID(+) 
ORDER BY 3;

--����6.
--�ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� ���(employee_id), ��(last_name)�� ä����(hire_date)�� ��ȸ�ϼ��� 
--// 37 ��

SELECT
    emp.EMPLOYEE_ID ,
    emp.LAST_NAME ,
    emp.HIRE_DATE ,
    mgr.HIRE_DATE "�Ŵ��� �Ի���"
FROM EMPLOYEES emp, EMPLOYEES mgr
WHERE emp.MANAGER_ID = mgr.EMPLOYEE_ID
AND emp.HIRE_DATE < mgr.HIRE_DATE ;

--=======================================================================================

SELECT *
FROM EMPLOYEES e
WHERE e.SALARY = (SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME ='Den');

SELECT FIRST_NAME, SALARY, EMPLOYEE_ID
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);


-- ��� �޿����� ���� �޴� ����� �̸�, �޿��� ����ϼ���
SELECT FIRST_NAME || ' ' || LAST_NAME "�̸�", SALARY "�޿�",  EMPLOYEE_ID "�����ȣ"
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(NVL(SALARY,0)) FROM EMPLOYEES);


-- �� �μ����� �ְ�޿��� �޴� ����� ����ϼ���
SELECT 
    DEPARTMENT_ID, 
    EMPLOYEE_ID, 
    FIRST_NAME, 
    SALARY
FROM 
    EMPLOYEES
WHERE
    (DEPARTMENT_ID, SALARY) 
IN 
    (SELECT DEPARTMENT_ID, MAX(SALARY)
FROM 
    EMPLOYEES 
GROUP BY 
    DEPARTMENT_ID);
    
    
--  �� �μ����� �ְ�޿��� �޴� ����� ����ϼ��� ?(���̺��� ����)

select 
    e.department_id, 
    e.employee_id, 
    e.first_name, 
    e.salary
from 
    employees e, (select department_id, max(salary) salary 
    from employees
    group by department_id) s 
where 
    e.department_id = s.department_id
and 
    e.salary = s.salary; 


--����1
-- ��� �޿����� ���� �޿��� �޴� ������ �� ���̳� �ֽ��ϱ�? //56��

SELECT 
    FIRST_NAME,
    
    
--����2
--�� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id),��(last_name)�� 
--�޿�(salary) �μ���ȣ(department_id)�� ��ȸ�ϼ���.
--�� ��ȸ ����� �޿��� ������������ ���ĵǾ� ��Ÿ�����մϴ�. //11��

SELECT 
    e.EMPLOYEE_ID, 
    e.LAST_NAME,
    e.SALARY,
    d.DEPARTMENT_ID
FROM 
    EMLOYEES e,
    DEPARTMENT d
WHERE
    e.department_id = s.department_id;

--����3
--�� ����(job) ���� �޿�(salary)�� ������ ���ϰ��� �մϴ�. �޿� ������ ���� ����
-- �������� ������(job_titile)�� �޿� ������ ��ȸ�Ͻÿ� //19 ����

SELECT
    j.JOB_TITLE, 
    s.SALARY
FROM
    JOBS j ,
    (
    SELECT
        JOB_ID,
        sum(salary) SALARY
    FROM
        EMPLOYEES
    GROUP BY
        JOB_ID ) s
WHERE
    j.JOB_ID = s.job_id
ORDER BY    
    s.SALARY DESC ;
    
    --
    
SELECT e.JOB_ID , sum(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.JOB_ID ;

SELECT j.JOB_TITLE , js.sal
FROM JOBS j , (SELECT e.JOB_ID , sum(e.SALARY) sal
				FROM EMPLOYEES e 
				GROUP BY e.JOB_ID ) js
WHERE j.JOB_ID = js.JOB_ID
ORDER BY 2 desc;

SELECT j.JOB_TITLE, sum(e.SALARY)
FROM EMPLOYEES e , JOBS j 
WHERE e.JOB_ID  = j.JOB_ID 
GROUP BY j.JOB_TITLE  
ORDER BY 2 desc;


--����4
-- �ڽ��� �μ� ��� �޿����� �޿�(salary)�� ���� ������ ������ȣ(employee_id)
--��(last_name)�� �޿�(salary)�� ��ȸ�ϼ��� //38��

SELECT
    e.EMPLOYEE_ID ,
    e.LAST_NAME ,
    e.SALARY ,
    s.SALARY "�μ����"
FROM
    EMPLOYEES e ,
    (SELECT DEPARTMENT_ID , AVG(NVL(SALARY, 0)) SALARY
    FROM EMPLOYEES e
    GROUP BY DEPARTMENT_ID) s
WHERE
    e.DEPARTMENT_ID = s.DEPARTMENT_ID
AND
    e.SALARY > s.SALARY;

--//

SELECT DEPARTMENT_ID , avg(SALARY)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

SELECT e.EMPLOYEE_ID , e.LAST_NAME , e.SALARY 
FROM EMPLOYEES e , (SELECT DEPARTMENT_ID , avg(SALARY) sal
					FROM EMPLOYEES 
					GROUP BY DEPARTMENT_ID) da
WHERE e.DEPARTMENT_ID = da.DEPARTMENT_ID
AND   e.SALARY > da.sal;

--[����] �޿��� ���� ���� �޴� 3���� ������ �̸��� ����Ͻÿ� (rownum)
SELECT 
    RN,
    FIRST_NAME,
    SALARY
FROM(
    SELECT
        ROWNUM RN,
        FIRST_NAME,
        SALARY
    FROM(
        SELECT FIRST_NAME,
            SALARY
                FROM EMPLOYEES
                ORDER BY SALARY DESC
         ) 
     )
WHERE RN >= 11
AND RN <= 20 ;

--SQL �ǽ� ���� ȥ��

--����1. ���� �ʰ� �Ի��� ������ �̸�(first_name last_name)��
--����(salary)�� �ٹ��ϴ� �μ� �̸�(department_name)��?

SELECT 
    MAX(e.HIRE_DATE)
FROM 
    EMPLOYEES e ;

SELECT 
    e.FIRST_NAME || ' ' || e.LAST_NAME "�̸�" ,
    e.SALARY "����", 
    d.DEPARTMENT_NAME "�μ� �̸�" , 
    e.HIRE_DATE
FROM
    EMPLOYEES e , 
    DEPARTMENTS d
WHERE
    e.HIRE_DATE = (SELECT MAX(e.HIRE_DATE) FROM EMPLOYEES e)
AND
    e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--����2. ��� �޿�(salary)�� ���� ���� �μ� �������� ������ȣ(employee_id),
--�̸�(first_name), ��(last_name)�� ����(job_title), �޿�(salary)�� ��ȸ�Ͻÿ�.

SELECT 
    e.EMPLOYEE_ID ,
    e.FIRST_NAME ,
    e.LAST_NAME ,
    e.SALARY ,
    j.JOB_TITLE ,
    s.AVERAGE
FROM
    EMPLOYEES e ,
    JOBS j ,
    (SELECT DEPARTMENT_ID , AVG(NVL(SALARY, 0)) AVERAGE
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID) s
    --ORDER BY 2 DESC) s
WHERE 
    e.JOB_ID = j.JOB_ID
    AND
        e.DEPARTMENT_ID = s.DEPARTMENT_ID
    AND 
        s.AVERAGE = (SELECT MAX(avg_s)
            FROM (SELECT DEPARTMENT_ID , AVG(NVL(a.SALARY, 0)) avg_s
                FROM EMPLOYEES a
                GROUP BY DEPARTMENT_ID) s);
    --�� neena / lex/ steven
    
    


--����3. ��ձ޿�(salary)�� ���� ���� �μ���?

SELECT d.DEPARTMENT_NAME
FROM DEPARTMENTS d ,
    (
    SELECT
        e.DEPARTMENT_ID did,
        AVG(e.SALARY) avgsal
    FROM
        EMPLOYEES e,
        DEPARTMENTS d
    WHERE
        e.DEPARTMENT_ID = d.DEPARTMENT_ID
    GROUP BY
        e.DEPARTMENT_ID ) s
WHERE d.DEPARTMENT_ID = s.did
AND s.avgsal = (SELECT MAX(g.avgsal)
FROM EMPLOYEES e , (SELECT e.DEPARTMENT_ID ,
AVG(e.SALARY) avgsal
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY e.DEPARTMENT_ID) g )
GROUP BY d.DEPARTMENT_NAME ;


--����4. ��ձ޿�(salary))�� ���� ���� ����(���)��?




--����5. ��ձ޿�(salary)�� ���� ���� ������?


-- ex2.
-- ��ձ޿�(salary)�� ���� ���� �μ� 
-- �������� ������ȣ(employee_id), �̸�(first_name), ��(last_name)�� 
-- ����(job_title), �޿�(salary)�� ��ȸ�Ͻÿ�.
-- 1. �μ��� ���
SELECT e.DEPARTMENT_ID , avg(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ;
-- 2. �μ��� ����� �ִ�
SELECT max( avg(e.SALARY) ) 
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ;
-- 3. �μ��� ����� �ִ��� �μ�
SELECT e.DEPARTMENT_ID , avg(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 
HAVING avg(e.SALARY) = (SELECT max( avg(SALARY) ) 
						FROM EMPLOYEES 
						GROUP BY DEPARTMENT_ID);
-- 4. Join
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , j.JOB_TITLE , e.SALARY , e.DEPARTMENT_ID 
FROM EMPLOYEES e , 
     JOBS j ,
     (SELECT e.DEPARTMENT_ID , avg(e.SALARY)
		FROM EMPLOYEES e 
		GROUP BY e.DEPARTMENT_ID 
		HAVING avg(e.SALARY) = (SELECT max( avg(SALARY) ) 
								FROM EMPLOYEES 
								GROUP BY DEPARTMENT_ID)
	 ) ma_dept
WHERE e.JOB_ID = j.JOB_ID 
AND   e.DEPARTMENT_ID = ma_dept.DEPARTMENT_ID;

-- ���� 
SELECT * FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = 90;






