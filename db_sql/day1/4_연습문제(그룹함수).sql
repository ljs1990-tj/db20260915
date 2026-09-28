SELECT * FROM EMP;
-- 1. (EMP) 81년도에 입사한 사람의 숫자를 출력하세요.
SELECT 
    COUNT(*)
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YY') = '81';

-- 2. (EMP) SAL+COMM의 값이 2500 이상인 사람의 숫자를 출력하세요.
SELECT 
    COUNT(*)
FROM EMP
WHERE SAL + NVL(COMM, 0) >= 2500;
-- 3. (EMP) 직급(JOB)별 가장 높은 급여를 출력하세요. (직급, 가장 높은급여 출력)
SELECT 
    JOB,
    MAX(SAL)
FROM EMP
GROUP BY JOB;

-- 4. (EMP) 부서(DEPTNO)별 평균급여를 구하세요. 단, 출력은 평균급여가 1800이상인 부서명, 평균급여를 출력하세요.
SELECT
    DEPTNO,
    AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 1800;

-- 5. (EMP) 입사년도별 사원수를 출력하세요. (결과화면 하단 이미지 참고)
SELECT 
    TO_CHAR(HIREDATE, 'YY') 입사년도,
    COUNT(*) 사원수
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
ORDER BY 입사년도 ;

-- 6. (STU) 태어난 월(JUMIN 컬럼 3,4번째 숫자)별 학생 수를 구하시오. (결과화면 하단 이미지 참고)
SELECT 
    SUBSTR(JUMIN, 3, 2) || '월' AS 태어난달,
    COUNT(*) 학생수
FROM STU
GROUP BY SUBSTR(JUMIN, 3, 2)
ORDER BY 태어난달;
-- 7. (STU) 각 성별별로 학생 수를 아래 이미지와 같이 구하시오.(하단 이미지 참고) 
SELECT
    SUM(DECODE(SUBSTR(JUMIN, 7, 1), 1, 1, 0)) 남학생수,
    SUM(DECODE(SUBSTR(JUMIN, 7, 1), 2, 1, 0)) 여학생수
    
--    COUNT(DECODE(SUBSTR(JUMIN, 7, 1), 1, 1)) 남학생수,
--    COUNT(DECODE(SUBSTR(JUMIN, 7, 1), 2, 1)) 여학생수
FROM STU;

SELECT 
    DECODE(SUBSTR(JUMIN, 7, 1), 1, 1)
FROM STU;
