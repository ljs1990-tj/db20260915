-- PROFESSOR
-- 1. 가장 높은 급여를 받는 사람의 교수번호, 이름, 급여 출력
SELECT 
    PROFNO, NAME, PAY
FROM PROFESSOR
WHERE PAY = (
    SELECT
     MAX(PAY)
    FROM PROFESSOR
);

-- 2. 전체 평균 급여보다 높은 급여를 받는 교수의 교수번호, 이름, 급여 출력

SELECT 
    PROFNO, NAME, PAY
FROM PROFESSOR
WHERE PAY > (
    SELECT
        AVG(PAY)
    FROM PROFESSOR
);
-- 3. 본인의 직급 평균 급여보다 높은 급여를 받는 교수의 교수번호, 이름, 급여 출력
SELECT PROFNO, NAME, PAY
FROM PROFESSOR P
INNER JOIN (
    SELECT
        POSITION, AVG(PAY) POSITION_PAY
    FROM PROFESSOR
    GROUP BY POSITION
) T ON P.POSITION = T.POSITION
WHERE PAY > POSITION_PAY;

-- EMP, SALGRADE
-- 4. 가장 높은 급여를 받는 사람과 가장 적은 급여를 받는 사원의 사번, 이름, 급여 출력


SELECT *
FROM EMP
WHERE SAL IN (
    SELECT MAX(SAL)
    FROM EMP
    UNION
    SELECT MIN(SAL)
    FROM EMP
);

-- 5. 부서별(DEPTNO) 가장 높은 급여를 받는 사람과 가장 적은 급여를 받는 사람의 사번, 이름, 부서명, 급여 출력


SELECT EMPNO, ENAME, DNAME, SAL
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
INNER JOIN (
    SELECT 
        DEPTNO, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL
    FROM EMP
    GROUP BY DEPTNO
) T ON E.DEPTNO = T.DEPTNO
WHERE SAL IN (MAX_SAL, MIN_SAL);

-- 6. 본인 직급의 평균 급여 등급보다 높은 급여등급을 가진 사람의 사번, 이름, 급여등급 출력
SELECT 
    EMPNO, ENAME, GRADE, JOB_GRADE
FROM EMP E
INNER JOIN SALGRADE S ON SAL BETWEEN LOSAL AND HISAL
INNER JOIN (
    SELECT 
        JOB,
        AVG(GRADE) AS JOB_GRADE
    FROM EMP E
    INNER JOIN SALGRADE S ON SAL BETWEEN LOSAL AND HISAL
    GROUP BY JOB
) T ON E.JOB = T.JOB
WHERE GRADE > JOB_GRADE;





