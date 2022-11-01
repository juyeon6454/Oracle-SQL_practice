-- PL/SQL
set serveroutput on;

DECLARE
v_empno employees.employee_id%TYPE;
v_name employees.first_name%TYPE;
v_sal employees.salary%TYPE;
BEGIN
	SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
	INTO v_empno,		v_name, 		v_sal
	FROM EMPLOYEES
	WHERE employee_id = '&empno';
	dbms_output.put_line(v_empno||' '||v_name||' '||v_sal);
END;
/

SELECT employee_id, FIRST_name, salary, hire_date
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '&empno';

------------------------------------------------

SET VERIFY OFF;
SET SERVEROUTPUT ON;

DECLARE
v_no1 NUMBER := &no1 ;
v_no2 NUMBER := &no2 ;
v_sum NUMBER ;
BEGIN
v_sum := v_no1 + v_no2 ;
DBMS_OUTPUT.PUT_LINE('첫번째 수: '||v_no1||', 두번째 수 : '||v_no2||' , 합은 : '||v_sum||' 입니다');
END ;
/

--------------------------------------------------

--인자들이 있을 떄는 괄호써줘야함
CREATE OR REPLACE PROCEDURE HR.UPDATE_SALARY (v_empno IN NUMBER)
IS
BEGIN
	UPDATE employees
	SET salary = salary * 1.1
	WHERE employee_id= v_empno;
	COMMIT;
END UPDATE_SALARY;
/

EXECUTE UPDATE_SALARY(110);

SELECT * FROM employees WHERE EMPLOYEE_ID = 110;


CREATE OR REPLACE FUNCTION HR.FC_UPDATE_SALARY(V_EMPNO IN NUMBER)
RETURN NUMBER
AS	
	PRAGMA AUTONOMOUS_TRANSACTION;
	V_SALARY EMPLOYEES.SALARY%TYPE;
BEGIN
	UPDATE EMPLOYEES 
	SET SALARY = SALARY * 1.1
	WHERE EMPLOYEE_ID = V_EMPNO;
	COMMIT;
	SELECT SALARY 
	INTO V_SALARY
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = V_EMPNO;
	RETURN V_SALARY;
END;

create or replace PROCEDURE PRINT_EMP( v_input employees.EMPLOYEE_ID%TYPE )
IS
	v_row   employees%ROWTYPE;
BEGIN
	SELECT employee_id,  first_name, salary, department_id
	INTO    v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = v_input;

	dbms_output.put_line
	( v_row.employee_id||' '||v_row.first_name||' '||v_row.salary||' '||v_row.department_id);
	
END PRINT_EMP;
/

execute PRINT_EMP(114);

/
CREATE OR REPLACE procedure HR.rowtype_test
(p_empno in employees.employee_id%TYPE )
is
    v_emp employees%ROWTYPE;
begin 
    dbms_output.enable;

    select employee_id, first_name, hire_date
    into   v_emp.employee_id, v_emp.first_name,v_emp.hire_date
    FROM   employees
    where  employee_id = p_empno;

    DBMS_OUTPUT.PUT_LINE('EMP NO : '||v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('EMP NAME : '||v_emp.first_name);
    DBMS_OUTPUT.PUT_LINE('EMP HIRE : '||v_emp.hire_date);

end;

/

CREATE OR REPLACE PROCEDURE HR.TABLE_TEST
(v_deptno IN employees.DEPARTMENT_ID %TYPE)
IS
	-- 테이블의 선언
	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
	TYPE sal_table      IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;

	-- 테이블타입으로 변수 선언
	empno_tab empno_table ; 
	ename_tab ename_table ; 
	sal_tab   sal_table;
	i BINARY_INTEGER := 0;
BEGIN   
	DBMS_OUTPUT.ENABLE;

	-- FOR 루프 사용
                 -- 여기서 emp_list는 ( BINARY_INTEGER형 변수로) 1씩 증가
	FOR emp_list IN ( SELECT employee_id, first_name, salary
		        FROM employees 
		      WHERE department_id = v_deptno ) LOOP
	      i := i + 1;
	      -- 테이블 변수에 검색된 결과를 넣는다
		empno_tab(i) := emp_list.employee_id ;
		ename_tab(i) := emp_list.first_name ;
		sal_tab(i) := emp_list.salary ;
	END LOOP;
	
	-- 1부터 i까지 FOR 문을 실행
	FOR cnt IN 1..i LOOP
		-- TABLE변수에 넣은 값을 뿌려줌
		DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));
	END LOOP; 
END TABLE_TEST;
/
EXECUTE TABLE_TEST(100); 

----------------------function
CREATE OR REPLACE PROCEDURE HR.TABLE_TEST
(v_deptno IN employees.DEPARTMENT_ID %TYPE)
IS
	-- 테이블의 선언
	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
	TYPE sal_table      IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;

	-- 테이블타입으로 변수 선언
	empno_tab empno_table ; 
	ename_tab ename_table ; 
	sal_tab   sal_table;
	i BINARY_INTEGER := 0;
BEGIN   
	DBMS_OUTPUT.ENABLE;

	-- FOR 루프 사용
                 -- 여기서 emp_list는 ( BINARY_INTEGER형 변수로) 1씩 증가
	FOR emp_list IN ( SELECT employee_id, first_name, salary
		        FROM employees 
		      WHERE department_id = v_deptno ) LOOP
	      i := i + 1;
	      -- 테이블 변수에 검색된 결과를 넣는다
		empno_tab(i) := emp_list.employee_id ;
		ename_tab(i) := emp_list.first_name ;
		sal_tab(i) := emp_list.salary ;
	END LOOP;
	
	-- 1부터 i까지 FOR 문을 실행
	FOR cnt IN 1..i LOOP
		-- TABLE변수에 넣은 값을 뿌려줌
		DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));
	END LOOP; 
END TABLE_TEST;
/
EXECUTE TABLE_TEST(100); 

-----------PL/SQL : INSERT----------------------------------------------

CREATE OR REPLACE PROCEDURE Insert_Test
(v_empno IN employees.employee_id%TYPE,
 v_ename IN employees.last_name%TYPE,
 v_email IN employees.email%TYPE,
 v_job   IN employees.job_id%TYPE,
 v_deptno IN employees.department_id%TYPE )
 
 IS
 BEGIN
    DBMS_OUTPUT.ENABLE;
    
    INSERT_OUTPUT.ENABLE;
    
    INSERT INTO employees
    (employee_id, last_name, email, job_id, hire_date, department_id)
    VALUES(v_empno, v_ename, v_email, v_job, sysdate, v_deptno);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE( 'EMP NO : ' || v_empno );
    DMBS_OUTPUT.PUT_LINE( 'EMP NAME : ' || v_ename );
    DMBS_OUTPUT.PUT_LINE( 'EMP EMAIL : ' || v_email );
    DMBS_OUTPUT.PUT_LINE( 'EMP JOB : ' || v_job );
    DMBS_OUTPUT.PUT_LINE( 'EMP DEPT : ' || v_deptno );
    DMBS_OUTPUT.PUT_LINE( 'EMP DATA INSERT SUCCESS! ');
END;
/    
------PL/SQL : INSERT----

CREATE OR REPLACE PROCEDURE UPDATE_TEST
(v_empno IN employees.employee_id%TYPE,
 v_sal IN employees.salary%TYPE)
 IS
    v_emp employees%ROWTYPE;
BEGIN DBMS_OUTPUT.ENABLE;
    UPDATE employees
    SET salary = v_sal
    WHERE employee_id = v_empno ;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Date Update Success ');
    
    SELECT employee_id, last_name, salary
    INTO v_emp.employee_id, v_emp.last_name, v_emp.salary
    FROM employees
    WHERE employee_id = v_empno ;
    DBMS_OUTPUT.PUT_LINE( ' **** Confirm Update Data ***' );
    DMBS_OUTPUT.PUT_LINE( 'EMP NO : ' || v_emp.employee_id );
    DMBS_OUTPUT.PUT_LINE( 'EMP NAME : ' || v_emp.last_name );
    DMBS_OUTPUT.PUT_LINE( 'EMP SALARY : ' || v_emp.salary);
END;

/

CREATE OR REPLACE PROCEDURE UPDATE_TEST
(v_empno IN employees.EMPLOYEE_ID%TYPE,
 v_sal   IN employees.SALARY%TYPE )
IS
	v_emp employees%rowtype;
BEGIN
	dbms_output.enable;
	UPDATE EMPLOYEES 
	SET    SALARY = v_sal
	WHERE  EMPLOYEE_ID = v_empno;
	COMMIT;
	dbms_output.put_line('Data Update Success');
	
	SELECT EMPLOYEE_ID , LAST_NAME , SALARY 
	INTO   v_emp.EMPLOYEE_ID, v_emp.LAST_NAME, v_emp.SALARY 
	FROM   EMPLOYEES
	WHERE  EMPLOYEE_ID = v_empno;
	
	dbms_output.put_line(' **** Confirm Update Data **** ');
	dbms_output.put_line('사번 : '|| v_emp.EMPLOYEE_ID);
	dbms_output.put_line('이름 : '|| v_emp.LAST_NAME);
	dbms_output.put_line('급여 : '|| v_emp.SALARY);
    dbms_output.put_line('=-----------------------------=');
END UPDATE_TEST;
/

execute UPDATE_TEST(100,2000);
