
--chr()
-- 지정된 수치와 일치하는 ASCII코드를 반환한다.
--SELECT ASCII('A') FROM DUAL; --65반환
--
--
-- RPAD(데이터, 고정길이, 문자)
-- 고정길이 안에 데이터를 출력하고 남는 공간을 문자로 채운다.(오른쪽 부터 채운다.)
--SELECT RPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;
--
--
-- LPAD(데이터, 고정길이,문자)
-- 고정길이 안에 데이터를 출력하고 남는 공간을 문자로 채운다.(왼쪽 부터 채운다.)
--SELECT LPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;
--
--
-- TRIM()
-- 문자열 공백 문자들을 삭제한다.
-- RTRIM() 오른쪽 공백만 제거 
-- LTRIM() 왼쪽 공백만 제거
--SELECT TRIM('    HELLO        ') FROM DUAL;



-- INSTR()
-- 특정 문자의 위치를 반환
-- 찾는 문자열이 없으면 0을 반환
SELECT INSTR('HELLOW','O') FROM DUAL;


-- INICAP()
-- 첫 문자를 대문자로 변환하는 함수
-- 공백이나 /를 구분자로 인식
SELECT INITCAP('good moring') FROM DUAL;
SELECT INITCAP('good/moring') FROM DUAL;


-- length()
-- 문자열의 길이를 반환
SELECT LENGTH('JOIN') FROM DUAL;


-- replace()
-- 특정문자를 원하는 문자로 바꿔준다.
SELECT REPLACE ('good moring','good','bad')
FROM DUAL;


-- CONCAT()
-- 주어지는 두 문자열을 연결
 SELECT CONCAT('Republic of', 'korea') FROM DUAL;


-- LOWER()
-- 데이터를 소문자로 반환
SELECT  LOWER('GOOD MORNING') FROM DUAL;


-- UPPER()
-- 데이터를 대문자로 반환
SELECT UPPER('good morning') FROM DUAL;


-- SUBSTR()
-- 시작 위치부터 선택한 개수만큼 문자를 반환한다.
SELECT  SUBSTR('good moring',1,4) FROM DUAL; 


-- 숫자함수

-- ABS()
-- 절대값을 반환
SELECT -10, ABS(-10) FROM DUAL;


-- ROUND()
-- 특정한 자리수에서 반올림하여 반환한다.
-- 지정한 숫자가 양수면 소수점 아래
-- 음수면 소수점 위
-- 생략되면 정수를 반환

SELECT ROUND(1234.567,1), 
	   ROUND(1234.567,-1), 
	   ROUND(1234.567)
FROM DUAL;


-- FLOOR()
-- 주어진 숫자보다 작거나 같은 경우 중 최대값을 반환
SELECT  FLOOR(2), FLOOR(2.1) FROM DUAL;


-- TRUNC()
-- 특정 자리수를 버리고 반환
SELECT TRUNC(1234.567,1),
       TRUNC(1234.567,-1),
       TRUNC(1234.567)
FROM DUAL;


-- SIGN()
-- 주어진 값의 음수, 정수, 0 여부를 판단한다.
-- 음수는 -1 0은 0 양수는 1을 반환한다.
SELECT SIGN(-10), SIGN(0), SIGN(10) FROM DUAL;


-- CEIL()
-- 주어진 숫자보다 크거나 같은 정수 중 최소값을 반환
SELECT CEIL(2), CEIL(2.1) FROM DUAL;


-- MOD()
-- 나누기 후 나머지를 반환
SELECT  MOD(1,3), MOD(2,3), MOD(3,3), MOD(4,3), MOD(0,3)
FROM DUAL;


-- POWER()
-- 주어진 숫자의 지정된 수 만큼 제곱값을 반환
SELECT POWER(2,1),POWER(2,2), POWER(2,3),POWER(2,4)
FROM DUAL;


-- 날짜 함수
-- 날짜 + 날짜는 불가능하다.
-- SYSDATE : 현재 날짜를 반환하는 키워드


-- ADD_MOTHS(날짜, 정수)
-- 특정 날짜에 개월수를 더해준다.

SELECT SYSDATE, ADD_MONTHS(SYSDATE,2)FROM DUAL;


-- MONTHS_BETWEEN
-- 두 날짜 사이의 개월수를 구해준다.
SELECT FIRST_NAME, SYSDATE , HIRE_DATE, MONTHS_BETWEEN(SYSDATE,HIRE_DATE)
FROM EMPLOYEES;


-- NEXT_DAY
-- 주어진 날짜로부터 내가 지정한 요일이 나오는 날짜 반환
-- 1 : 일요일 ~ 7 : 토요일 
-- 이번주 일요일
SELECT SYSDATE, NEXT_DAY(SYSDATE,'일') 
FROM DUAL;

-- 저번주 일요일
SELECT SYSDATE, NEXT_DAY(SYSDATE-7,'일') 
FROM DUAL;


-- 부서번호가 50번인 사원들의 이름을 출력하되, 
-- 이름 중 'el'을 모두 '**'로 대체하여 출력하세요
SELECT REPLACE (FIRST_NAME,'el','**'), DEPARTMENT_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 50;


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



-- 사원들의 이름, 입사일, 입사후 오늘까지의 개월수를 조회하되,
-- 입사기간이 200 개월 이상인 사람만 출력하고
-- 입사 개월수는 소수점 이하 한자리 까지만 버림하세요.
SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE),1)
FROM EMPLOYEES;
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)>=200;


-- 형변환 함수
-- TO_CHAR(날짜, 포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'YYYY,MM,DD DAY'),
TO_CHAR(SYSDATE,'YYYY,MM,DD HH:MI:SS')
FROM DUAL;


-- 날짜 형식 FORMATTING 모델
-- SCC, CC 세기
-- YYYY, YY 연도
-- MM 월
-- DD 요일
-- MON 월(JAN)
-- MONTH 월(JANUARY)
-- HH, HH24 시간
-- MI 분
-- SS 초

/*
 * 0 : 숫자, 공백시 0으로 채움
 * 9 : 숫자
 * , : 쉼표 표기
 * L : 지역 통화 기호
 * 
 * */


-- TO_NUMBER()
-- 오라클에서는 숫자만 있는 문자열은 묵시적으로 숫자로 취급하기 때문에 잘 사용하지 않는다.

-- 자릿수를 맞줌
SELECT TO_CHAR(1234567,'9,999,999')
FROM DUAL;

-- 앞에 통화기호 넣어주고 자리수 맞춤
SELECT TO_CHAR(1234567,'L9,999,999')
FROM DUAL;

--3자리로 표현하는데 자리수 부족하면 0으로 채워라
SELECT TO_CHAR(12,'0999')
FROM DUAL;


--TO_DATE(날짜, 포맷)
SELECT TO_DATE('2024.05.16') FROM DUAL;
SELECT TO_DATE('05.16.2024','MM,DD,YYYY') FROM DUAL;
SELECT TO_DATE('2024.05','YYYY.MM') FROM DUAL;
SELECT TO_DATE('16','DD') FROM DUAL; --올해, 지금월에 해당하는 날짜로 들어감


-- NULL 처리함수
-- NULL값을 다른값으로 변경(임시)
SELECT * FROM PLAYER ;
SELECT PLAYER_NAME, "POSITION" FROM PLAYER WHERE "POSITION" IS NULL;
SELECT PLAYER_NAME, NVL("POSITION",'미정') FROM PLAYER WHERE "POSITION" IS NULL;


-- NULL 아닐 때 치환할 값, NULL일 때 치환할 값
SELECT FIRST_NAME, NVL2(COMMISSION_PCT,'받음','안받음') FROM EMPLOYEES e ;


-- 순위 함수

-- RANK()
-- RANK() OVER(ORDER BY 컬럼)
SELECT RANK() OVER(ORDER BY SALARY DESC) "RANK", FIRST_NAME, SALARY
FROM EMPLOYEES;

-- DENSE_RANK()
-- 중복 순위 계산 안함
SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) "RANK", FIRST_NAME, SALARY
FROM EMPLOYEES;


-- 집계 함수
-- 여러 행들에 대한 연산결과를 하나의 행으로 반환
-- 집계 함수는 NULL값이 있는 행을 집계하지 않는다.


-- COUNT : 행의 개수를 반환
-- MIN : 행중 최소값을 반환
-- MAX : 행중 최대값을 반환
-- SUM : 행들의 합계를 반환
-- AVG : 행들의 평균을 반환
-- STDDEV : 행들의 표준편차를 반환
-- VARIANCE : 행들의 분산을 반환한다.

-- 전체 행의 개수를 구해준다.
SELECT COUNT(*) FROM EMPLOYEES;


-- 집계함수와 일반컬럼은 일반적인 방법으로는 같이 조회할 수 없다.
SELECT COUNT(*), FIRST_NAME  FROM EMPLOYEES;
	

-- 사원테이블에서 직종이 SA_REP인 사원들의 평균급여, 급여 최고액, 최저액, 총 합계를 출력
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY) 
FROM EMPLOYEES e 
WHERE e.JOB_ID ='SA_REP';


-- 부서의 개수를 출력(중복제거)
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM EMPLOYEES;


-- 부서번호가 80번인 부서의 사원들의 급여의 평균을 출력
SELECT ROUND(AVG(SALARY),1)
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = '80' ;


-- 그룹화 
-- GROUP BY

-- 각 부서별 급여의 평균과 총합을 출력
SELECT DEPARTMENT_ID,AVG(SALARY),SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;


-- 각 직종별 인원수를 출력
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES e 
GROUP BY JOB_ID


-- 부서별로 가장 높은 급여를 조회
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;


-- 부서별로 급여의 합계를 내림차순으로 조회
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID DESC;


-- 그룹함수
CREATE TABLE
월별매출(
	상품ID VARCHAR2(5),
	월 	VARCHAR2(10),
	회사 VARCHAR2(10),
	매출액 NUMBER
);

INSERT INTO 월별매출 VALUES('P001','2019.10','삼성',15000);
INSERT INTO 월별매출 VALUES('P001','2019.11','삼성',25000);
INSERT INTO 월별매출 VALUES('P002','2019.10','LG'10000);
INSERT INTO 월별매출 VALUES('P002','2019.11','LG',25000);
INSERT INTO 월별매출 VALUES('P003','2019.10','애플',15000);
INSERT INTO 월별매출 VALUES('P003','2019.11','애플',35000);

SELECT * FROM 월별매출;

-- ROLLUP
-- ROLLUP(A) : A그룹핑 -> 합계
-- ROLLUP(A,B) : A,B그룹핑 -> A소계/합계
-- ROLLUP(A,B,C) : A,B,C그룹핑 -> (A소계, B소계)/합계

SELECT 상품ID, 월, SUM(매출액) FROM 월별매출
GROUP BY ROLLUP(상품ID,월);


-- CUBE(A) : A그룹핑 -> 합계
-- CUBE(A, B) : A,B그룹핑/A그룹핑/B그룹핑 -> A소계, B소계/합계
-- CUBE(A, B, C) : A,B,C그룹핑/A,B그룹핑/A,C그룹핑/B,C그룹핑/A그룹핑/B그룹핑/C그룹핑   -> (A소계/B소계),(B소계)/합계

SELECT 상품ID, 월,SUM(매출액)
FROM 월별매출
GROUP BY CUBE(상품ID,월)

