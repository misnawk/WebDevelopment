-- SQL연산자
-- BETWEEN : A와 B사이의 값을 조회할 때 사용
-- IN : OR을 대신해서 사용하는 연산자
-- LIKE : 유사검색 

--사원테이블에서 06년도에 입사한 사원들의 정보를 사번, 이름, 직종, 입사일순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
--WHERE HIRE_DATE >= ('20060101','YYYYMMDD') AND GIRE_DATE <=TO_DATE('20061231','YYYYMMDD')
WHERE HIRE_DATE BETWEEN 
TO_DATE('20060101','YYYYMMDD') AND TO_DATE('20061231','YYYYMMDD') ; 



-- 사원 테이블에서 급여가 5000이상이고 6000이하인 사원의 정보를 사번, 이름, 급여순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 6000; --이상과 이하만 들어간다.


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



-- IN
-- 직종이 SA_MAN, IT_PROG인 사원들의 정보를 이름, 직종순으로 출력
SELECT FIRST_NAME ,JOB_ID
FROM EMPLOYEES
--WHERE JOB_ID = 'JOB_MAN' OR JOB_ID = 'IT_PROG';
WHERE JOB_ID IN('SA_MAN','IT_PROG');


-- 급여가 2200, 3200, 5000을 받는 사원들의 정보를 이름, 직종, 급여순으로 출력하세요.
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES 
WHERE SALARY IN('2200','3200','5000');

-- 유사검색
-- 부분적으로 일치하는 속성을 찾을 때 사용된다.
-- % : 모든값
-- _ : 하나의 값

-- 'A%' : A로 시자하는 모든 데이터
-- '%A' : A로 끝나는 모든 데이터
-- '%A%' : A를 포함하는 모든 데이터
-- '%A%I%' : A와 I를 포함하는 모든 데이터

-- 'A_' : A로 시작하는 두글자 데이터(_하나당 한글자)
-- '_A' : A로 끝나는 두글자 데이터
-- '_A_' : 두번째에 A가 존재하는 3글자 데이터
-- '__A' : A로 끝나는 세글자 데이터


-- 사원테이블에서 사원들의 이름 중 m으로 시작하는 사원들의 정보를 
-- 사번, 이름, 직종순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES e --e는 별칭으로 사용할 수 있다. JOIN할때 사용된다.
WHERE FIRST_NAME LIKE 'M%'


-- 사원테이블에서 이름이 D로 끝나는 사원의 사번, 이름, 직종을 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES 
WHERE e.FIRST_NAME LIKE '%d';

-- 이름의 첫글자가 M이면서 총 7글자의 이름을 가진 사원의 정보를 사번, 이름순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES  
WHERE FIRST_NAME LIKE 'M______';

-- 이름에 소문자 o가 들어가면서 이름이 a로 끝나는 사원들의 정보를
-- 이름, 급여 순으로 조회

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

SELECT FIRST_NAME,SALARY 
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE '%o%a';


-- 사원테이블에서 이름의 세번째 글자에 a가 들어가는 사원의정보를
-- 사번, 이름 순으로 출력

SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE '__a%';

-- 이름이 H로 시작하면서 6글자 이상인 사원들의 정보를
-- 사번, 이름순으로 조회

SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE 'H_____%';

-- 사원테이블에서 이름에 s가 포함되어있지 않은 사원들의 정보를
-- 사번, 이름으로 검색
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES 
WHERE FIRST_NAME NOT LIKE '%s%'

-- OR연산자를 통해 여러 조건을 검색
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE '%el' OR first_name LIKE '%en%'; --el로 끝나거나 en을 포함하는 이름
WHERE REGEXP_LIKE(FIRST_NAME,'el|en');

--REGEXP_LIKE("문자열","정규표현식","일치옵션");

-- A% -> ^A
-- %A -> A$


-- INSERT
-- 테이블에 데이터를 추가할 때 사용하는 키워드
-- INSERT INTO 테이블명(컬럼명1,컬럼명2...) VALUES(값1, 값2...); DEFAULT 사용할 때
-- 테이블명 VALUES(값1, 값2...); DEFAULT값 사용 불가


--TBL_STUDENT 테이블에 INSERT문으로 데이터를 넣었다. //GENDER은 'W'와 'M' 둘중하나만 선택가능
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES(0,'강민석','컴퓨터학과','M',TO_DATE('1999-06-03','YYYY-MM-DD'));

--ID는 다르게 설정해야한다.
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES(1,'강민','컴퓨터학과','M',TO_DATE('1999-06-03','YYYY-MM-DD'));

--DATE는 1980년도 이상으로 해야한다. (날짜를 더 늦게 설정)
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES(2,'강','컴퓨터학과','M',TO_DATE('2000-06-03','YYYY-MM-DD'));

--GENDER을 써주지않으면 기본값인 'W'가 입력된다.
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,BIRTH)
VALUES(3,'홍길동','컴퓨터학과',TO_DATE('2000-06-06','YYYY-MM-DD'));

--컬럼명을 생략하면 디폴트값을 사용하지못한다. 데이터를 전부 적어줘야한다.
INSERT INTO TBL_STUDENT VALUES(4,'박길동','컴퓨터학과','M',TO_DATE('2000-06-06','YYYY-MM-DD'));

SELECT * FROM TBL_STUDENT;


--테이블에서 SELECT한 데이터를 INSERT하는 경우

--SELECT한 테이블의 속성의 개수와 INSERT 하려고 하는 테이블의 속성의 개수와 이름이 일치해야한다.


-- UPDATE
-- 테이블의 데이터를 수정할 때 사용하는 키워드
-- UPDATE 테이블명
-- SET 기존컬럼명 = 새로운 값,
-- 기존컬럼명 = 새로운 값,
-- 기존컬럼명 = 새로운 값,
-- 기존컬럼명 = 새로운 값,
-- WHERE 조건식

-- WHERE절이 없으면 모든 데이터에 대해 수정이 된다.(W된다)

SELECT * FROM TBL_STUDENT;

UPDATE TBL_STUDENT
SET NAME = '제임스';

UPDATE TBL_STUDENT
SET MAJOR = '산업경영공학과'
WHERE ID = 1;


-- DELETE
-- 테이블에서 데이터를 삭제하고자 할 때 사용하는 명령어 
-- 조건에 해당하는 하나의 행이 삭제된다.
-- DELETE FROM 테이블명 WHERE 조건식


DELETE FROM TBL_STUDENT
WHERE ID = 0;


--DELETE FROM TBL_STUDENT; (W됨)

-- ORDER BY(정렬)
-- 질의 결과에 반환되는 행들을 특정 기준으로 정렬하고자 할 때 사용
-- ORDER BY절은 SELECT절의 가장 마지막에 기술
-- ASC : 오름차순(DEFULT 생략 가능)
-- DESC : 내림차순(생략 불가)


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


-- 사원테이블에서 급여를 많이받는 사원순으로 사번, 이름, 급여, 입사일을 출력하세요.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,HIRE_DATE
FROM EMPLOYEES 
ORDER BY SALARY DESC, HIRE_DATE; --급여 내림차순으로 하고 같으면 입사일 오름차순 기준으로 정렬


-- 사원테이블에서 부서번호가 빠른순, 부서번호가 같다면 직종이 빠른순, 직종까지 같다면
-- 급여를 많이 받는 순으로 사번, 이름, 부서번호, 직종, 급여순으로 출력

SELECT EMPLOYEE_ID, FIRST_NAME, EMPLOYEE_ID,SALARY
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID , JOB_ID, SALARY DESC;

--급여가 15000이상인 사원들의 사번, 이름, 급여, 입사일을 입사일이 빠른순으로 조회

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,HIRE_DATE
FROM EMPLOYEES
WHERE SALARY>150000;
ORDER BY HIRE_DATE;







