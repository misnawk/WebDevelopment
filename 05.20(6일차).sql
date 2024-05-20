-- JOIN
-- 데이터베이스에서 `두 개 이상의 테이블` 을 연결하여 하나의 결과 테이블로 만드는것을 의미한다.
-- JOIN을 사용하는 이유는 데이터베이스에서 테이블을 분리하여 '데이터의 중복을 줄여 데이터의 일관성을 유지하기 위함이다.'
-- 여러가지 일관성을 유지하기 위함이다.
-- 여러가지 JOIN 방식이 있으며 JOIN의 방식에 따라 결과가 달라진다.

-- JOIN의 종류
--
-- INNER JOIN
-- 각 테이블에서 조인 조건에 일치되는 데이터만 가져온다.
-- A와 B테이블의 공통된 부분을 의미한다. 교집합과 비슷하다.
--
-- ANSI JOIN
-- 테이블A INNER JOIN 테이블B ON 조건식
-- 테이블A JOIN 테이블B ON 조건식 

-- ORACLE JOIN
-- FROM 테이블, 테이블B WHERE 조건식

-- SELF INNER JOIN
-- 하나의 테이블 내에서 다른 컬럼을 참조하기 위해 사용하는 자기 자신과의 조인
-- 이를 통해 데이터베이스에서 한 테이블 내의 값을 다른 값과 연결할 수 있다.
-- SELECT 테이블A.열, 테이블B.열
-- FROM 테이블A JOIN 테이블B ON 조건식


-- CROSS JOIN
-- 두 개 이상의 테이블에서 모든 가능한 조합을 만들어 결과를 반환하는 방법
-- 이를 통해 두 개 이상의 테이블을 조합하여 새로운 테이블을 만들 수 있다.
-- 각 행의 모든 가능한 조합을 만들기 때문에 결과가 매우 큰 테이블이 될 수 있으므로 사용에 주의해야 한다.

-- SELECT 테이블1.열, 테이블2.열
-- FROM 테이블1 CORSS JOIN 테이블2; 


SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS;

SELECT FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 부서, 지역테이블로부터 부서이름과 CITY 조회하기
SELECT * FROM DEPARTMENTS d;
SELECT * FROM LOCATIONS l ;

SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS d JOIN LOCATIONS l 
ON D.LOCATION_ID = L.LOCATION_ID ;


-- 지역(LOCATIONS), 나라(COUNTRIES)테이블에서 CITY와 COUNTRY_NAME 조회

SELECT * FROM LOCATIONS l;
SELECT * FROM COUNTRIES c;

SELECT CITY, COUNTRY_NAME
FROM LOCATIONS l JOIN COUNTRIES c 
ON l.COUNTRY_ID = c.COUNTRY_ID ;


-- FIRST_NAME, LAST_NAME, JOB_ID, JOB_TITLE을 출력
-- EMPLOYEES와 JOBS 테이블을 조회

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;

SELECT FIRST_NAME, LAST_NAME, j.JOB_ID, JOB_TITLE
FROM EMPLOYEES e JOIN JOBS j
ON e.JOB_ID = j.JOB_ID;


-- 사원 ,부서, 지역테이블로부터 first_name, email,department_id, department_name, location_id, city
-- 를 출력하되 city가 'seattle' 인 경우만 출력하기

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT e.FIRST_NAME, e.email,d.department_id,d.department_name,l.location_id, l.city
FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID where l.CITY  = 'Seattle';

-- OUTER JOIN
-- 두 테이블에서 '공통된 값을 가지지 않는 행들'도 반환한다.

-- left outer Join
-- '왼쪽 테이블의 모든 행' 과 '오른쪽 테이블에서 공통된 값'을 가지고 있는 행들을 반환한다.
-- 만약 오른쪽 테이블에서 공통괸 값을 가지고 있는 행이 없다면 NULL값을 반환


-- select 컬럼명1, 컬럼명2...
-- from 테이블1, left outer join 테이블2
-- on 조건식


-- select 컬럼명1, 컬럼명2...
-- from 테이블1, right outer join 테이블2
-- on 조건식-

-- full outer join
-- 두 테이블에서 '모든 값'을 반환한다.
-- 만약 공통된 값을 가지고 있지 않는 행이 있다면 NULL값을 반환한다.
-- 합집합 연산 결과와 같다.
-- 양쪽 테이블 데이터 집합에서 공통적으로 존재하는 데이터, 한쪽에만 존재하는 데이터 모두 추출된다.
-- select 컬럼명1, 컬럼명2...
-- from 테이블1, full outer join 테이블2
-- on 조건식-



-- 사원 테이블과 부서 테이블의 left outer join을 이용하여 
-- 사원이 어느 부서에 속해있는지 조회하기

SELECT e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e left OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;
SELECT * FROM EMPLOYEES  WHERE FIRST_NAME = 'Kimberely';


SELECT e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e right OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

-- left 조인과 right 조인 둘다 합침 
SELECT e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e full OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;


-- 집합연산자
-- join과는 별개로 두 개의 테이블을 합치는 방법

-- 1. union
-- 두 개의 테이블에서 '중복을 제거하고 합친 모든 행' 을 반환한다.

-- 사원테이블에과 부서테이블을 unoin한다.
-- 사원 이름과 부서이름의 모든 값을 가져와서 중복을 제거하고 싶다.

SELECT e.first_name
FROM EMPLOYEES e 
UNION 
SELECT d.DEPARTMENT_NAME
FROM DEPARTMENTS d;


-- View
-- 하나 이상의 테이블이나 다른 뷰의 데이터를 볼 수 있게 하는 데이터베이스 객체
-- 실제 데이터는 뷰를 구성하는 테이블에 담겨있지만 마치 테이블 처럼 사용할 수 있다.
-- 테이블 뿐만 아니라 다른 뷰를 참조해 새로운 뷰를 만들어 사용할 수 있다.
--
-- View의 특징
-- 독립성
-- 테이블 구조가 변경되어도 뷰를 사용하는 응용프로그램은 변경하지 않아도 된다.
--
-- 편리성
-- 복잡한 쿼리문을 뷰로 생성함으로써 관련 쿼리를 단순하게 작성할 수 있다.
-- 또한 해당 형태의 SQL문을 자주 사용할 때 뷰를 사용하면 편리하게 이용할수있다.
--
-- 보안성 
-- 직원의 급여정보와 같이 숨기고 싶은 정보가 존재한다면, 뷰를 생성할 때 
-- 해당 컬럼을 빼고 생성함으로써 사용자에게 정보를 감출 수 있다.

-- View의 생성
-- create or replace view 뷰이름 as(쿼리문)

-- View의 삭제
-- Drop View 뷰이름 restrict or cascade
-- restrict : 뷰를 다른곳에서 참조하고 있다면 삭제 취소
-- cascade : 뷰를 참조하는 다른 뷰나 제약조건까지 모두 삭제

SELECT * FROM EMPLOYEES e ;

CREATE OR REPLACE VIEW my_empl as(
	SELECT EMPLOYEE_ID, first_name, salary, (salary * commission_pct) "보너스"
	FROM EMPLOYEES e 
);

SELECT * FROM my_empl;

-- data_plus라는 view를 만들고
-- 이름, 급여, 급여를 많이 받는 순으로 순위를 매겨서
-- view를 조회하세요.

CREATE OR REPLACE VIEW data_plus AS(
	SELECT first_name, salary, RANK()OVER(ORDER BY SALARY DESC)"RANK"
	FROM EMPLOYEES 
	
);
SELECT * FROM data_plus;



-- view를 palyer_age라는 이름으로 만들고
-- 선수들의 이름과 나이를 구하여 저장하고 조회하세요
SELECT * FROM PLAYER p ;

CREATE OR REPLACE VIEW player_age as(
SELECT player_name, round((SYSDATE-birth_date)/365) "AGE"
FROM PLAYER
);

SELECT * FROM player_age;
SELECT * FROM team;

-- 나이가 35살 이상인 선수만 조회하세요
SELECT * FROM player_age WHERE age >=35;


-- team_name 이라는 이름으로 view를 만들고
-- 선수이름, 팀이름을 조회 하여 view에 저장
-- team_name은 team 테이블에 있음
-- player_name은 player테이블에 있음
 

SELECT * FROM team;
SELECT * FROM PLAYER;

CREATE OR REPLACE VIEW team_name as(
select player_name, TEAM_name
from PLAYER p  JOIN TEAM t 
ON p.team_id = t.team_id
);

SELECT * FROM team_name;


-- STADIUM_id, STADIUM_name, team_name을
-- 검색하여 STADIUM_info라는 view로 만들고
-- 해당 view에서 team_name null인 경기장 조회하기

SELECT * FROM TEAM t  ;
SELECT * FROM STADIUM s ;

CREATE OR REPLACE VIEW STADIUM_info as(
	SELECT s.STADIUM_id, s.STADIUM_name, t.team_name
	FROM STADIUM s left OUTER JOIN TEAM t
	ON t.team_id = s.hometeam_id
);

SELECT * FROM STADIUM_info;


-- TCL(Transaction Control Language)
-- 트랜젝션 제어 언어

-- 트랜젝션 : 데이터베이스 작업을 처리하는 논리적 연산 단위
-- ex) select, update, insert, delete 문장

-- 트랜잭션의 특성
-- 원자성(Amotomicity)
-- 원자와 같이 데이터베이스 연산들이 나눌수도, 줄일수도 없는 하나의 유닛으로 취급
-- 트랜젝션에 정의된 연산들은 모두 성공적으로 전혀 실행되지 않은 상태로 남아야 한다.

/*
 * 10,000원이 든 계좌 A에서, 0원이 든 계좌 B로 10,000원을 보낸다.
 * update 계좌 A
 * set 잔액 = 0
 * where 계좌번호 = A;
 * 
 * 
 * update 계좌B
 * set 잔액 = 10,000
 * where 계좌번호 = B;
 * */

-- 일관성
-- 데이터베이스의 트랜잭션이 제약조건, cascades, triggers를 포함한
-- 정의된 모든 조건에 맞게 데이터 값이 변경된다.
-- 트랜젝션 실행 전의 데이터베이스 내용이 잘못되지 않으면 실행후에도 데이터베이스의 내용이 잘못되면 안된다.
--
-- 고립성(Isolation)
-- 특정DBMS에서 다수의 유저들이 같은 시간에 같은 데이터에 접근하였을 때
-- 수행중인 트랜젝션이 완료될 때 까지 다른 트랜잭션의 요청을 막음으로서 데이터가 꼬이는것을 방지한다.
--
-- 영속성(Durability)
-- 트랜잭션 실행이 성공적일 때, 그 트랜잭션이 갱신한 데이터 베이스 내용은
-- 영구적으로 저장된다.

-- TCL의 종류
-- COMMIT
-- DML로 변경된 데이터를 데이터베이스로 적용할 때 사용
-- INSERT, UPDATE, DELETE문을 사용할한 후 변경 작업을 데이터반영을 위해 사용
-- COMMIT문 사용시 이전 데이터는 영원히 지워짐
-- COMMIT문 사용시 모든 사용자가 변경된 데이터 확인 가능
-- SQLserver는 기본적으로 AUTO COMMIT 모드 이므로 자동으로 commit을 수행한다.
--
-- ROLLBACK
-- DML로 변경된 데이터를 변경 이전 상태로 되돌릴 때 사용
-- 데이터에 대한 변경사항 취소
-- ROLLBACK문 사용시 이전 데이터 다시 재저장 -> COMMIT 되지 않은 상위 트랜젝션 모두 ROLLBACK시킴
-- R0LLBACK문 사용시 관련 행의 잠금(LOCKING)이 풀려 다른 사용자들이 데이터접근 불가
-- SQLserver는 기본적으로 AUTOCOMMIT모드 이므로 자동으로 COMMIT 
-- 오류가 발생하면 자동으로 ROLLBACK처리
--
-- SAVEPOINT
-- 오류 복구에 효과적인 방법
-- 전체 트랜젝션을 ROLLBACK 하지 않고도 오류 복귀가 가능
-- 효과적으로 오류 복구 처리를 위해 저장점을 만들어 놓고 사용
-- 복잡한 대규모 트랜젝션에서 에러가 발생했을 때 주로 사용
-- 복수의 저장점 정의 가능
--
-- 저장점까지 롤백 할때 : ROLLBACK TO 저장점명;
-- 저장점 만들기 : SAVEPOINT 저장점명;


SELECT * FROM EMPLOYEES ;

-- 사원테이블에서 job_id 가 'TI_PROG'인 사람들의 이름ㅇ르
-- 홍길동으로 바꾸기
UPDATE EMPLOYEES 
SET FIRST_NAME = '홍길동'
WHERE job_id = 'IT_PROG';

SELECT * FROM EMPLOYEES e WHERE  JOB_ID = 'IT_PROG';






