-- 조건

-- WHERE 
-- =(같다), >=(크거나-작거나 같다), >(크다 작다)

-- STUDENT 테이블에서 이름이 '김철수'의 모든 컬럼 조회
SELECT *
FROM STUDENT
WHERE STU_NAME = '김철수';

-- 키가 170이상인 학생들의 모든 컬럼 조회
SELECT *
FROM STUDENT
WHERE STU_HEIGHT >= 170;

SELECT STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL; -- IS NULL, IS NOT NULL

-- 1학년 이면서 여자인 학생들 출력 (AND)
SELECT *
FROM STUDENT
WHERE STU_GRADE = 1 AND STU_GENDER = 'F';
-- 2학년 이거나 남자인 학생들 출력 (OR)
SELECT *
FROM STUDENT
WHERE STU_GRADE = 2 OR STU_GENDER = 'M';

-- IN (같은 컬럼을 대상으로 OR 연산할 때 유용)
SELECT *
FROM STUDENT
WHERE STU_GRADE IN (1, 2);
-- WHERE STU_GRADE = 1 OR STU_GRADE = 2;

-- 키가 170이상 180이하인 학생 검색
-- BETWEEN (하나의 컬럼에 대한 범위 값을 구할 때)
SELECT *
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 170 AND 180;
-- WHERE STU_HEIGHT >= 170 AND STU_HEIGHT <= 180;

-- 특정 값 포함 여부 검색
-- %는 개수 무제한(0~무한), _는 한개
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2015%';

SELECT *
FROM PROFESSOR
WHERE EMAIL LIKE '%net';

SELECT *
FROM PROFESSOR
WHERE EMAIL LIKE '%naver%';

SELECT *
FROM PROFESSOR
WHERE POSITION LIKE '조__';

SELECT SYSDATE
FROM STUDENT;
