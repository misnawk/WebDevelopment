

-- HAING절
-- GROUP BY 로 집계된 값중 WHERE절 처럼 틀정 조건을 추가하는것
-- 그룹함수에 조건을 달아야 할 때

-- 각 부서별 급여의 최대값, 최소값, 인원수를 출력하되
-- 급여의 최대값이 8000이상인 결과만 보여줄것

SELECT MAX(SALARY), MIN(SALARY), COUNT(*)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
--WHERE MAX(SALARY) >= 8000;
HAVING MAX(SALARY) >= 8000;

-- 각 부서별 인원수가 20명인 이상인 부서의 정보를 부서번호, 급여의 합, 급여의 평균, 인원수 순으로 출력하되, 
-- 급여의 평균은 소수점 2자리 까지 반올림하여 출력


--EMPLOYEE_ID : 사원정보
--FIRST_NAME : 이름
--LAST_NAME : 성
--EMAIL : 이메일
--PHONE_NUMBER : 폰번호
--HIRE_DATE : 입사날짜
--JOB_ID : 직종
--SALARY : 급여
--COMMISSION_PCT : 보너스율
--MANAGER_ID : 상사 사원번호
--DEPARTMENT_ID : 부서번호


SELECT DEPARTMENT_ID, ROUND(SUM(SALARY),2),ROUND(AVG(SALARY),2),COUNT(*)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20; 


-- 부서별, 직종별로 그룹화 하여 결과를 부서번호, 직종, 인원수 순으로 출력하되
-- 직종이 'MAN'으로 끝나는 경우에만 조회하세요

SELECT DEPARTMENT_ID JOB_ID,COUNT(*)
FROM EMPLOYEES 
WHERE JOB_ID LIKE '%MAN'
GROUP BY DEPARTMENT_ID, JOB_ID;


-- 각 부서별 평균 급여를 소수점 한자리까지 버림으로 출력하되,
-- 평균 급여가 10000미만인 그룹만 조회해야 하며, 
-- 부서번호가 50이하인 부서만 조회

SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY),1)
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID <= 50
GROUP BY DEPARTMENT_ID;
HAVING TRUNC(AVG(SALARY),1) < 10000;

------------------------------------------------------------------------------------------

-- DCL(Data Control Language)
-- 데이터 제어어
-- 데이터베이스에 접근하고 객체들을 사용하도록 권한을 주고 회수하는 명령어

-- DCL의 종류
-- GRANT : 권한을 부여
-- REVOKE : 권한을 강탈

-- SUBQUERY
-- 특정 SQL문장 안에 또 다른 SQL 문장이 포함되어 있는것
-- 여러번 DB접속이 필요한 상황을 한번으로 줄여서 속도를 증가시킬 수 있다.
-- 서브쿼리를 사용할 수 있는곳
-- WHERE, HAVING
-- SELECT, DELETE문의 FROM절
-- UPDATE문의 SET절
-- INSERT문의 INTO절

-- 사원테이블에서 이름이 'Michael' 이고 직종이 'MK_MAN'인 사원의 급여보다
-- 많이 받는 사원들의 정보를 사번, 이름, 직종, 급여순으로 출력

-- 이름이 'Michael' 이고 직종이 'MK_MAN'인 사원의 급여
SELECT SALARY 
FROM EMPLOYEES  
WHERE FIRST_NAME ='Michael' AND JOB_ID = 'MK_MAN';

-- 급여가 13,000보다 많이 받는 사원들의 정보
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID, SALARY
FROM EMPLOYEES 
WHERE SALARY >13000;


SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID, SALARY
FROM EMPLOYEES 
WHERE SALARY >(SELECT SALARY 
			   FROM EMPLOYEES  
			   WHERE FIRST_NAME ='Michael' AND JOB_ID = 'MK_MAN'
);


--EMPLOYEE_ID : 사원정보
--FIRST_NAME : 이름
--LAST_NAME : 성
--EMAIL : 이메일
--PHONE_NUMBER : 폰번호
--HIRE_DATE : 입사날짜
--JOB_ID : 직종
--SALARY : 급여
--COMMISSION_PCT : 보너스율
--MANAGER_ID : 상사 사원번호
--DEPARTMENT_ID : 부서번호



-- 사번이 150번인 사원의 급여와 같은 급여를 받는 
-- 사원들의 정보를 사번, 이름, 급여순으로 출력

SELECT SALARY 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 150; --10000

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY =(SELECT SALARY 
   			   FROM EMPLOYEES 
			   WHERE EMPLOYEE_ID = 150);


			  
			  
			  
			  
-- 급여가 회사의 평균급여 이상인 이름과 급여를 조회
			  
--회사 평균급여
SELECT AVG(SALARY)
FROM EMPLOYEES e 

--회사 평균급여보다 많이 받는 이름과, 급여
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES e
WHERE SALARY>=(SELECT AVG(SALARY)
FROM EMPLOYEES e);
			  


--EMPLOYEE_ID : 사원정보
--FIRST_NAME : 이름
--LAST_NAME : 성
--EMAIL : 이메일
--PHONE_NUMBER : 폰번호
--HIRE_DATE : 입사날짜
--JOB_ID : 직종
--SALARY : 급여
--COMMISSION_PCT : 보너스율
--MANAGER_ID : 상사 사원번호
--DEPARTMENT_ID : 부서번호
	
-- 사번이 111번인 사원의 직종과 같고, 사번이 159인 사원의 급여보다
-- 많이 받는 사원의 정보를 사번, 이름, 직종, 급여순으로 출력

-- 사번이 111번인 사원의 직종
SELECT JOB_ID
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = '111';

-- 사번이 159번인 사원의 급여
-- 8000
SELECT SALARY
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = '159';


SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES 

WHERE JOB_ID = (SELECT JOB_ID
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 111) AND SALARY > (SELECT SALARY
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 159);
			

-- 100번 부서의 최소 급여보다 많이 받는 다른 부서의 부서번호, 최소 급여를 조회

-- 부서가 100번인 최소급여
-- 6900
SELECT MIN(SALARY)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100;

			
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > (SELECT MIN(SALARY)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100);


-- PALYER 테이블에서 TEAM_ID가 'K01'인 선수중 POSITON이 'GK'인 선수 
-- TEAM_ID가 'K01'인 선수
SELECT * FROM PLAYER WHERE TEAM_ID = 'K01';
SELECT *
FROM (SELECT * FROM PLAYER WHERE TEAM_ID = 'K01')
WHERE "POSITION" = 'GK';


-- PLAYER 테이블에서 전체 평균키와 포지션별 평균키를 구하기
SELECT "POSITION", AVG(HEIGHT),(SELECT AVG(HEIGHT)FROM PLAYER)
FROM PLAYER 
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";


-- CONCATENATION(연결)
-- 두개 컬럼을 마치 하나의 컬럼처럼 조회하는 것
-- ||
SELECT FIRST_NAME ||' '|| LAST_NAME FROM EMPLOYEES;


-- OO의 급여는 OO이다.
SELECT FIRST_NAME||'의 급여는' ||SALARY ||'이다'
FROM EMPLOYEES 


-- 별칭(ALIAS)
-- 조회된 컬럼의 이름이 너무 길다면 별명을 줘서 대신 사용할 수 있다.
-- SELECT절
	-- AS 뒤에 별칭 작성
	-- 한칸 띄우고 작성
-- FROM절
	-- 테이블이름 뒤에 한칸 띄우고 작성

-- 별칭의 특징
-- 테이블에 별칭을 줘서 컬럼을 단순, 명확히 할 수 있다.
-- 조회된 SELECT문장에서만 유효하다.
-- 테이블 별칭은 길이가 30자까지 가능하나 짧을수록 좋다.
-- 테이블 별칭에는 의미가 있는것이 좋다.


--EMPLOYEE_ID : 사원정보
--FIRST_NAME : 이름
--LAST_NAME : 성
--EMAIL : 이메일
--PHONE_NUMBER : 폰번호
--HIRE_DATE : 입사날짜
--JOB_ID : 직종
--SALARY : 급여
--COMMISSION_PCT : 보너스율
--MANAGER_ID : 상사 사원번호
--DEPARTMENT_ID : 부서번호
	


-- 사원테이블에서 EMPLOYEE_ID를 "사번", FIRST_NAME을 "이름",
-- SALARY를 "급여"로 바꿔서 조회하기
SELECT EMPLOYEE_ID "사번", FIRST_NAME "이름", SALARY "급여"
FROM EMPLOYEES 



-- 테이블이 2개이상있을시 조인 지정
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D;

-- PLAYER테이블에서 NICKNAME이 NULL인 선수들의 닉네임을
-- 정태민 선수의 닉네임으로 바꾸기


--정태민 닉네임
--킹카
SELECT NICKNAME 
FROM PLAYER WHERE PLAYER_NAME = '정태민';

-- NULL값을 킹카로 바꿈
UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME 
FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER p ;


--별칭(ALIAS)

















