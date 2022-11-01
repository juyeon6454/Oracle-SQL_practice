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

select count(*), count(commission_pct) from employees;

select count(*), sum(salary), avg(salary) from employees;

select count(*), sum(salary), avg(nvl(salary,0)) from employees;

select count(*), max(salary), min(salary) from employees;

select avg(e.salary) from employees e order by department_ID;

select avg(e.salary) from employees e GROUP by department_ID;
--어떤 부서의 평균인지 그룹으로 묶어서 직계함수와 사용하기 위함?

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

--문제 1. 
--직-원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 
--두 임금의 차이는 얼마인가요?  “최고임금 ? 최저임금”이란 타이틀로 함께 출력해 보세요.
select count(*), max(salary)"최고임금", min(salary)"최저임금" ,
max(salary) - min(salary) "최고임금 - 최저임금" from employees;


--문제2.
--마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일

select to_char(max(hire_date), 'yyyy"년" mm"월" dd"월"')
from employees;


--문제3.
--부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력하고 정렬순서는
--부서번호(department_id) 내림차순입니다.
SELECT e.DEPARTMENT_ID "부서", 
    avg(NVL(e.SALARY, 0)) "평균임금",
    MAX(e.SALARY) "최고임금",
    MIN(e.SALARY) "최저임금"
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID
ORDER BY e.DEPARTMENT_ID DESC;

--문제4.
--업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무(job_id)와 함께 출력하고 정렬순서는 업무(job_id) 내림차순입니다.
select job_id, avg(salary), max(salary), min(salary)
--round(avg(salary),2)) / avg(nvl(e.salary,0))
from employees
group by job_id
order by job_id desc;


--문제5.
--가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일
select to_char(min(hire_date), 'yyyy"년" mm"월" dd"월"')
from employees;

--문제6.
--평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 그리고 (평균임금 ? 최저임금)를 (평균임금 ? 최저임금)의 내림차순으로 정렬해서 출력하세요.
SELECT
    DEPARTMENT_ID "부서",
    ROUND(AVG(NVL(SALARY, 0)),2) "평균임금" ,
    MIN(SALARY) "최저임금",
    ROUND(AVG(NVL(SALARY, 0)) - MIN(SALARY),2) "평균임금 - 최저임금"
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
HAVING
     AVG(NVL(SALARY, 0)) - MIN(SALARY) < 2000
ORDER BY
     4 DESC ;

--문제7.
--업무(Job_id)별로 최고임금과 최저임금의 차이를 출력해보세요.
--차이를 확인할 수 있도록 내림차순으로 정렬하세요? 

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


--직원의 이름, 부서, 팀을 출력하세요
--팀은 부서코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요

select first_name, department_id, 
case when department_id between 10 and 50 then 'A-TEAM'
     when department_id between 60 and 100 then 'B-TEAM'
     when department_id between 110 and 150 then 'C-TEAM'
     else '팀없음'                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
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


--[예제]
--직원의 이름, 직급명칭을 출력하세요
--Join 할 테이블 ( Employees, Jobs )

SELECT e.FIRST_NAME, j.JOB_ID, j.JOB_TITLE
FROM EMPLOYEES e , JOBS j
WHERE e.JOB_I  = j.JOB_ID ;

SELECT first_name, em.department_id, department_name, de.department_id
from employees em, departments de
where em.department_id = de.department_id;

--[예제] 모든 직원이름, 부서이름, 업무명 을 출력하세요
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

--문제 1. 
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.

SELECT 
    e.EMPLOYEE_ID "사번", 
    e.FIRST_NAME "이름", 
    d.DEPARTMENT_NAME "부서명", 
    m.FIRST_NAME "매니저 이름"
FROM 
    EMPLOYEES e, 
    EMPLOYEES m , 
    DEPARTMENTS d
WHERE 
    e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    AND e.MANAGER_ID = m.EMPLOYEE_ID ;

--문제2.
--지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.
--//25개국

SELECT
    r.REGION_NAME "지역이름",
    c.COUNTRY_NAME "나라이름"
FROM 
    REGIONS r,
    countries c
WHERE 
    r.REGION_ID= c.REGION_ID
ORDER BY
    1 DESC,2 DESC;

--문제3.
--각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name),
-- 매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 
--그리고 지역구분(regions)의 이름(region_name)까지 전부 출력해 보세요.
--//11개
SELECT
    d.DEPARTMENT_ID "부서번호" ,
    d.DEPARTMENT_NAME "부서이름" ,
    e.FIRST_NAME "매니저의 이름" ,
    l.CITY "위치한 도시" ,
    c.COUNTRY_NAME "나라의 이름" ,
    r.REGION_NAME "지역구분 이름"
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
    
    
--문제4.
--‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력합니다.
--//2명
SELECT
    e.EMPLOYEE_ID ,
    e.FIRST_NAME || ' ' || e.LAST_NAME
FROM 
    EMPLOYEES e , JOB_HISTORY jh, JOBS j
WHERE
    e.EMPLOYEE_ID = jh.EMPLOYEE_ID
    AND jh.JOB_ID = j.JOB_ID
    AND j.JOB_TITLE = 'Public Accountant';

--문제5.
--직원들의 사번(employee_id), 이름(first_name), 성(last_name)과 부서 이름(department_name)을 조회하여 성(last_name)순서로 오름차순 정렬하세요
--//106 명  (+  부서가 없는 사람도 조회 되도록.. 107명)
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

--문제6.
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하세요 
--// 37 명

SELECT
    emp.EMPLOYEE_ID ,
    emp.LAST_NAME ,
    emp.HIRE_DATE ,
    mgr.HIRE_DATE "매니저 입사일"
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


-- 평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
SELECT FIRST_NAME || ' ' || LAST_NAME "이름", SALARY "급여",  EMPLOYEE_ID "사원번호"
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(NVL(SALARY,0)) FROM EMPLOYEES);


-- 각 부서별로 최고급여를 받는 사원을 출력하세요
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
    
    
--  각 부서별로 최고급여를 받는 사원을 출력하세요 ?(테이블에서 조인)

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


--문제1
-- 평균 급여보다 적은 급여를 받는 직원은 몇 명이나 있습니까? //56명

SELECT 
    FIRST_NAME,
    
    
--문제2
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id),성(last_name)과 
--급여(salary) 부서번호(department_id)를 조회하세요.
--단 조회 결과는 급여의 내림차순으로 정렬되어 나타나야합니다. //11명

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

--문제3
--각 업무(job) 별로 급여(salary)의 총합을 구하고자 합니다. 급여 총합이 가장 높은
-- 업무부터 업무명(job_titile)과 급여 총합을 조회하시오 //19 직급

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


--문제4
-- 자신의 부서 평균 급여보다 급여(salary)가 많은 직원의 직원번호(employee_id)
--성(last_name)과 급여(salary)을 조회하세요 //38명

SELECT
    e.EMPLOYEE_ID ,
    e.LAST_NAME ,
    e.SALARY ,
    s.SALARY "부서평균"
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

--[예제] 급여를 가장 많이 받는 3명의 직원의 이름을 출력하시오 (rownum)
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

--SQL 실습 문제 혼합

--문제1. 가장 늦게 입사한 직원의 이름(first_name last_name)과
--연봉(salary)과 근무하는 부서 이름(department_name)은?

SELECT 
    MAX(e.HIRE_DATE)
FROM 
    EMPLOYEES e ;

SELECT 
    e.FIRST_NAME || ' ' || e.LAST_NAME "이름" ,
    e.SALARY "연봉", 
    d.DEPARTMENT_NAME "부서 이름" , 
    e.HIRE_DATE
FROM
    EMPLOYEES e , 
    DEPARTMENTS d
WHERE
    e.HIRE_DATE = (SELECT MAX(e.HIRE_DATE) FROM EMPLOYEES e)
AND
    e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--문제2. 평균 급여(salary)가 가장 높은 부서 직원들의 직원번호(employee_id),
--이름(first_name), 성(last_name)과 업무(job_title), 급여(salary)을 조회하시오.

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
    --답 neena / lex/ steven
    
    


--문제3. 평균급여(salary)가 가장 높은 부서는?

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


--문제4. 평균급여(salary))가 가장 높은 지역(대륙)은?




--문제5. 평균급여(salary)가 가장 높은 업무는?


-- ex2.
-- 평균급여(salary)가 가장 높은 부서 
-- 직원들의 직원번호(employee_id), 이름(first_name), 성(last_name)과 
-- 업무(job_title), 급여(salary)를 조회하시오.
-- 1. 부서별 평균
SELECT e.DEPARTMENT_ID , avg(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ;
-- 2. 부서별 평균의 최대
SELECT max( avg(e.SALARY) ) 
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ;
-- 3. 부서별 평균이 최대인 부서
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

-- 검증 
SELECT * FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = 90;






