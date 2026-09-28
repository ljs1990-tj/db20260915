-- 그룹 함수
-- SUM, AVG, MAX, MIN, COUNT

SELECT * FROM PROFESSOR;
SELECT 
    SUM(PAY) 
FROM PROFESSOR;
-- 정교수들의 급여의 합
SELECT 
    SUM(PAY) 
FROM PROFESSOR
WHERE POSITION = '정교수';

-- MAX, MIN
SELECT 
    MAX(PAY), MIN(PAY)
FROM PROFESSOR;

SELECT 
    AVG(PAY)
FROM PROFESSOR;

SELECT 
    COUNT(*), -- 전체 레코드의 개수
    COUNT(NAME), -- NAME 컬럼에 NULL이 아닌 레코드의 개수
    COUNT(BONUS) -- BONUS 컬럼에 NULL이 아닌 레코드의 개수
FROM PROFESSOR;



-- GROUP BY(그룹화)
SELECT 
    POSITION,
    ROUND(AVG(PAY))
FROM PROFESSOR
GROUP BY POSITION;

-- 그룹함수에서 WHERE와 HAVING 차이
-- WHERE : 그룹하기전에 조건으로 먼저 걸러냄(조건에 맞는 애들끼리 그룹화)
-- HAVING : 그룹이 다 끝난 후 조건 처리

-- ex1) 직급별 급여 평균. 단, 급여가 200이상인 사람들을 기준 => WHERE
-- ex2) 직급별 급여 평균이 300이 넘는 직급 구하기. => HAVING
SELECT 
    POSITION,
    ROUND(AVG(PAY))
FROM PROFESSOR
WHERE PAY >= 200
GROUP BY POSITION;

SELECT 
    POSITION,
    ROUND(AVG(PAY))
FROM PROFESSOR
GROUP BY POSITION
HAVING AVG(PAY) >= 300;

-- WHERE와 HAVING 같이 사용 가능

SELECT 
    POSITION,
    ROUND(AVG(PAY))
FROM PROFESSOR
WHERE PAY >= 200
GROUP BY POSITION
HAVING AVG(PAY) >= 300;


-- 각 학과별 학생수가 3이하인 학과명과 학생 수 출력
SELECT  
    STU_DEPT,
    COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT
HAVING COUNT(*) <= 3;

-- 각 성별에서 가장 키가 큰 학생의 성별, 키 값 구하기
SELECT 
    STU_GENDER,
    MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GENDER;


-- 각 학과별 학생들의 평균 키를 구하기
-- 단, 165이하인 학생들은 평균에서 제외
SELECT
    STU_DEPT,
    AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_HEIGHT > 165
GROUP BY STU_DEPT;

-- GROUP은 2개이상의 컬럼으로 가능
-- 1. 각 학과별 학생 수 구하기
-- 2. 각 학과내에서도 성별로 구분해서 학생 수 구하기
SELECT
    STU_DEPT,
    STU_GENDER,
    COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT, STU_GENDER
ORDER BY STU_DEPT;


-- 각 학과에서 키가 170이상인 학생들의 학생 수 구하기
-- 출력 컬럼 : 학과명, 키가 170이상 학생 수

SELECT
    STU_DEPT, COUNT(*)
FROM STUDENT
WHERE STU_HEIGHT >= 170
GROUP BY STU_DEPT;



