-- PL / SQL
-- Oracle's Procedual Language Extension to SQL
-- 오라클에서 SQL을 확장하여 사용하는 프로그래밍 언어
-- 이름과 같이 절차적 프로그래밍 언어이다.

-- PL / SQL의 기본구조

/*
 * DECLARE -> 선언부
 * 
 * IS
 * 
 * BEGIN -> 실행부
 * 	쿼리문을 작성할 수 있다.
 * END;
 * 
 * */

-- PL / SQL문을 사용하는 이유
-- 대용량 데이터를 연산해야 할 때, WAS등의 서버로 전송해서 
-- 처리하려면 네트워크에 부하가 많이 걸릴수 있다.
-- 이때 함수를 사용하여 데이터를 연산하고 가공한 후에 최종결과만 서버에 전송하면 부담을 많이 줄일 수 있다.
-- 쿼리문을 직접 노출하지 않는 만큼, SQL injection의 위험성이 줄어든다.
-- 블록 단위로 유연하게 사용할 수 있다.

-- 프로시저(procedure)
-- PL/SQL의 대표적인 부 프로그램에 프로시저가 있다.
-- 데이터베이스에 대한 일련의 작업을 정리한 절차를
-- RDBMS에 저장한 것으로 영구 저장 모듈이라고도 한다.
-- 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합

-- 장점
-- 하나의 요청으로 여러 SQL문을 실행할 수 있다.
-- 네트워크 소요 시간을 줄여 서능을 개선할 수 있다.
-- 기능 변경이 편하다.

-- 단점
-- 문자나 숫자 연산에 사용하면 오히려 C,JAVA보다 느려질 수 있다.
-- 유지보수가 어려움


-- 프로시저의 생성

/*
 * create or replace procedure 프로시저명(
 * 		매개변수 in 데이터타입 : = 값,
 * 		매개변수 in 컬럼%type 
 * )
 * is
 * 함수 내에서 사용할 변수, 상수 등을 선언
 * begin
 * 실행할 명령들
 * end;
 * 
 * call 프로시저명(값1,....); 
 * */



BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO');
END;


-- 간단한 프로시저 만들기
-- f(x) = 2x+1;

-- f : 함수의 이름
-- (x) : 매개변수
-- 2x + 1 : 리턴값
CREATE OR REPLACE PROCEDURE F(
	X IN NUMBER 
)
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE(2*X+1);
END;


-- 프로시저의 호출
CALL f(3);

-- 프로시저와 SQL
-- jobs테이블에 데이터를 insert해주는 프로시저 만들기

--jobs테이블에 어떤 컬럼이 있는지 확인

SELECT * FROM jobs;
-- job_id
-- job_title
-- min_salary
-- max_salary

CREATE OR REPLACE PROCEDURE  my_new_job_proc(
	p_job_id IN jobs.job_id%TYPE,
	p_job_title IN jobs.JOB_TITLE%TYPE,
	p_min_salary IN jobs.MIN_SALARY %TYPE,
	p_max_salary IN jobs.MAX_SALARY %TYPE
)
IS
	cnt NUMBER := 0;
BEGIN 
	-- jobs 로부터 카운트가 되었다면 cnt 변수에 대입
	SELECT count(job_id) INTO cnt FROM jobs WHERE job_id = p_job_id;
	-- 만약 조회된 행이 없다면 insert
	IF cnt = 0 then
	INSERT INTO jobs(job_id, job_title, min_salary,max_salary)
	values(p_job_id,p_job_title,p_min_salary,p_max_salary);
	DBMS_Output.put_line('all done about' || ' ' ||p_job_id);
	ELSE
	-- 전달 받은 값으로 테이블을 update하기
	UPDATE jobs
	SET job_title = p_job_title,
		min_salary = p_min_salary,
		max_salary = p_max_salary		
	WHERE job_id = p_job_id;
	DBMS_Output.put_line('update all done about' || ' ' || p_job_id);
	END IF;	
	END;
	
	
	
CALL my_new_job_proc('it','delveloper',14000,20000);

SELECT * FROM jobs;


-- 다시 프로시저를 실행했을 때 pk 제약조건으로 인해 
-- 실행이 안될 때, update가되게 만들어보자.

-- IF문
-- 1. if 조건 then 실행문;
-- 	  end if;

-- 2. if 조건 then 실행문;
-- 	  else 실행문;
--	  end if;

-- 3. if 조건 then 실행문;
--	  elslf 조건문 then 실행문;
-- 	  els 실행문;
--    end if;


DECLARE 
	score NUMBER :=80; -- =은 같다의 의미이기 때문에 :=를 써야 대입이 된다. 
	grade varchar2(5); -- 어떤 학점인지 정확히 알 수 없기 때문에 초기화를 할 수 없다.
BEGIN
	IF score >= 90 THEN grade :='A';
	ELSIF score >= 80 THEN grade :='B';
	ELSIF score >= 70 THEN grade :='C';
	ELSIF score >= 60 THEN grade :='D';
	ELSE grade :='F';
END IF;

DBMS_OUTPUT.put_line('당신의 점수 : '||score||'점'||chr(10)||'학점:'||grade);
END;


-- 제거하는 프로시저 만들기
-- job_id 데이터를 하나 전달해서 delete문이 작동하는 프로시저 만들기
-- 데이터 있으면 삭제하고, 'delete all done about 데이터';
-- 데이터가 없으면 'no exist 데이터';

CREATE OR REPLACE PROCEDURE my_new_delete(
	p_job_id IN jobs.JOB_ID %TYPE 

)
IS 
	cnt NUMBER :=0;
BEGIN
	SELECT count(job_id) INTO cnt FROM jobs WHERE job_id = p_job_id;
	IF cnt !=0 THEN
	DELETE FROM JOBS 
	WHERE job_id = p_job_id;
	DBMS_OUTPUT.put_line('delete all done about 데이터'||' '||p_job_id);
END IF;
END;

CALL  my_new_delete('it');

SELECT * FROM jobs;

-- sequence 시퀀스
-- 테이블에 값을 추가할 때 자동으로 순차적인 값이 들어가도록 설정해주는 객체
-- 예를 들어 회원가입을 할 때 사람들에게 순차적으로 중복되지 않는 값을 부여할 수 있다.
-- 게시판에 작성된 게시글 순서대로 순차적인 게시글 번호를 부여할 수 있다.

-- create sequence 시퀀스명;

-- 시퀀스의 다양한 옵션
-- increment by 1 -> 1씩 증가
-- start with 1 -> 1부터 카운팅
-- minavalue 1 -> 최소값
-- maxvalue 100 -> 최대값
-- cache 20 -> 미리 20개의 index공간을 확보 20명이 동시에 접속해서 글을써도 버벅이지 않게해줌
-- nocache -> 1개의 index 공간만 확보

-- 시퀀스를 이미 만들었다면 sql문을 통해 옵션을 설정할 수 있다.
-- alter sequence 시퀀스명 increment by 1 minvalue 1 maxvalue 100 nocache;

-- 시퀀스를 사용할 때 주의할점
-- cache 옵션을 사용하면 속도를 증가시키기 위해 시퀀스번호를 한번에 여러개씩 
-- 메모리에 올려놓고 작업을 하게 된다.
-- 이러한 경우 DB를 중지시키거나 전원이 off하는 경우 메모리에 있던 번호가 삭제되기 때문에
-- 1,2,3 순차적으로 나오다가 21부터 나올수 있다.

CREATE TABLE person(
	idx NUMBER PRIMARY key,
	name varchar2(200),
	age number
);

DROP TABLE person;

CREATE SEQUENCE person_seq;

-- 데이터 추가하기
-- 시쿼스명.nextval : 해당 시퀀스에서 다음 순번 값을 자동으로 가져온다.
INSERT INTO person values(person_seq.nextval,'홍길동',30);
INSERT INTO person values(person_seq.nextval,'홍감자',35);
INSERT INTO person values(person_seq.nextval,'홍구마',40);

SELECT * FROM person;
TRUNCATE TABLE person ;
 
-- select 절에서도 nextval을 사용할 수 있지만 값이 증가되기 때문에 주의해야함
SELECT person_seq.NEXTval FROM dual;

-- 시퀀스의 현재값 보기
-- 시퀀스명.currval
SELECT person_seq.currval FROM DUAL;

-- 시퀀스 값을 초기화 하는법
-- 제일좋은 방법은 삭제 했다가 다시 만들기
-- 하지만 대부분의 경우 권한이 없기 때문에 삭제할 수 없는 경우가 많다.

-- 1. 현재 시퀀스의 값을 확인한다.
SELECT person_seq.currval FROM dual;

-- 2. 현재 시퀀스 값만큼 increment를 뺀다.
ALTER SEQUENCE person_seq INCREMENT BY -1;

-- 3. nextval로 -3을 뺀다.
SELECT person_seq.nextval FROM dual;

-- 4. 시퀀스의 증가량을 1로 다시 바꾼다.
ALTER SEQUENCE person_seq INCREMENT BY 1;

-- 시퀀스 삭제
DROP SEQUENCE person_s



--/////////////////////////////////////////////////////////////////////////////// 여기부터 연습
TRUNCATE table person;
-- 1. 데이터 업데이트 프로시저

-- 2. 데이터 삭제 프로시저
-- 3. 시퀀스 만들기 


SELECT * FROM person;



