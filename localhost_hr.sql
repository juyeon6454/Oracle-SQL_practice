SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS d ;

select employee_id, first_name, last_name from employees;

SELECT e.FIRST_NAME , e.PHONE_NUMBER , e.HIRE_DATE , e.SALARY FROM EMPLOYEES e ;

--사원의 이름(first_name)과 성(last_name), 급여, 전화번호, 이메일, 입사일을 출력하세요
SELECT e.first_name "이름" , e.LAST_NAME "성" , e.SALARY"연봉" , e.PHONE_NUMBER"전화번호" , e.EMAIL"이메일" , e.HIRE_DATE "입사일"
FROM EMPLOYEES e ;
-- 원하는 칼럼 이름 설정 

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

select CONCAT('가나다라','아자차카') , '가나다라' || '아자차카' FROM DUAL;

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


--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
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

-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
SELECT DEPARTMENT_ID, SALARY,FIRST_NAME FROM EMPLOYEES
ORDER BY DEPARTMENT_ID asc;

-- 급여가 5000 이상인 직원의 이름, 급여를 급여가 큰직원부터 출력하세요
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 5000
ORDER BY SALARY DESC;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호, 급여, 이름을 출력하세요
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

--입사한지 얼만큼 흘렀는지 개월수로 보여줌
select months_between(sysdate, hire_date) 
from employees
where department_id = 110;

select first_name, to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id =110;

select sysdate, 
to_char(sysdate, 'YYYY"년"-MM"월"-DD"일" HH24:MI:SS') as "Date" from dual;


select commission_pct, nvl(commission_pct, 0)
from employees;

select commission_pct, nvl2(commission_pct, 100, 0)
from employees;

-- 문제 1. 
--전체직원의 다음 정보를 조회하세요. 정렬은 입사일(hire_date)의 올림차순(ASC)으로 \
--가장 선임부터 출력이 되도록 하세요. 이름(first_name last_name),  월급(salary), \
--전화번호(phone_number), 입사일(hire_date) 순서이고 “이름”, “월급”, “전화번호”, 
-- “입사일” 로 컬럼이름을 대체(column alias)해 보세요.

SELECT FIRST_NAME || ' '  || LAST_NAME "이름", SALARY "월급", PHONE_NUMBER"전화번호", HIRE_DATE"입사일" FROM employees
ORDER BY HIRE_DATE ASC;

-- 문제2.
-- 업무(job_id)와 월급(salary)을 월급의 내림차순(DESC)로 정렬하세요.
SELECT JOB_ID, SALARY FROM EMPLOYEES
ORDER BY SALARY DESC ;

-- 문제3.
-- 담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 
-- 커미션 비율, 월급 을 출력하세요.

SELECT e.FIRST_NAME, e.MANAGER_ID, e.COMMISSION_PCT ,  e.SALARY 
FROM EMPLOYEES e
WHERE e.MANAGER_ID IS NOT NULL
AND e.COMMISSION_PCT IS NULL
AND e.SALARY>3000;

-- 문제4.
-- 최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을 
-- 최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.    

SELECT j.JOB_TITLE , j.MAX_SALARY
FROM JOBS J
WHERE j.MAX_SALARY >= 10000
ORDER BY 2 desc;

-- 문제5.(15명)
-- 월급이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트 를  
-- 월급순(내림차순) 출력하세오. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오       

SELECT e.FIRST_NAME , e.SALARY , NVL(e.COMMISSION_PCT, 0)
FROM EMPLOYEES e
WHERE e.SALARY >= 10000
AND e.SALARY < 14000
ORDER BY e.SALARY DESC;

-- 문제6.
-- 부서번호가 10, 90, 100 인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오
-- 입사일은 1977-12 와 같이 표시하시오

SELECT FIRST_NAME, SALARY, to_char(HIRE_DATE, 'YYYY-MM') ,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (10,90,100);
-- =DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 90 DEPARTMENT_ID = 100;

-- 문제7.
-- 이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오

SELECT FIRST_NAME, SALARY FROM employees 
WHERE FIRST_NAME = s;

-- 문제8.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
ORDER BY LENGTH(DEPARTMENT_NAME) DESC;

-- 문제9.
-- 정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
-- 오름차순(ASC)으로 정렬해 보세오.

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

-- 문제10.
-- 입사일이 2003/12/31 일 이전 (31일 포함) 입사한 직원의 이름, 월급, 전화 번호, 입사일을 출력하세요
-- 전화번호는 545-343-3433 과 같은 형태로 출력하시오.

SELECT FIRST_NAME, SALARY, REPLACE(PHONE_NUMBER,'.','-'), HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE <= '2003/12/31' ;

SELECT PHONE_NUMBER FROM EMPLOYEES;

