-- 1. 많은 급여를 받는 상위 5명 교수의 이름, 급여, 순위를 출력하시오.
SELECT *
FROM (
    SELECT
        NAME, PAY, 
        RANK() OVER(ORDER BY PAY DESC) AS RANK
    FROM PROFESSOR
) WHERE RANK <= 5;

-- 2. 각 학과별 가장 높은 급여를 받는 교수의 이름, 학과, 급여를 출력

SELECT NAME, DNAME, PAY
FROM (
    SELECT 
        NAME, DNAME, PAY,
        RANK() OVER(PARTITION BY P.DEPTNO ORDER BY PAY DESC) AS RANK
    FROM PROFESSOR P
    INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO
) WHERE RANK = 1;

-- 3. (STU) 각 성별에서 키가 가장 큰 학생의 이름, 성별, 키 출력 
SELECT NAME, GENDER, HEIGHT
FROM (
    SELECT 
        NAME, DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자') AS GENDER, HEIGHT,
        RANK() OVER(PARTITION BY SUBSTR(JUMIN, 7, 1) ORDER BY HEIGHT DESC) RANK
    FROM STU
) WHERE RANK = 1;

-- (EMP)
-- 4. 부서(DEPTNO)별 평균 급여가 가장 높은 부서의 부서명, 평균 급여 출력
SELECT DEPTNO, DNAME, AVG_SAL
FROM (
    SELECT 
        E.DEPTNO, DNAME, AVG(SAL) AS AVG_SAL,
        RANK() OVER(ORDER BY AVG(SAL) DESC) AS RANK
    FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    GROUP BY E.DEPTNO, DNAME
) WHERE RANK = 1;


