-- PROFESSOR 테이블 기준
SELECT * FROM PROFESSOR;

-- 1. 아래 정보에 맞게 PROFESSOR 테이블에 INSERT 하시오.
--    교수번호 : 1234, 이름 : 김교수, 아이디 : test12, 직급 : 정교수, 급여 : 500
--    입사일 : SYSDATE 
INSERT INTO PROFESSOR(PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES('1234', '김교수', 'test12', '정교수', 500, SYSDATE);
COMMIT;

-- 2. 보너스가 NULL이 아닌 데이터를 조회하시오.
SELECT * 
FROM PROFESSOR
WHERE BONUS IS NOT NULL; 
-- 3. 200~400 사이의 급여를 받는 데이터를 조회하시오. ( BETWEEN 사용 )
SELECT * 
FROM PROFESSOR
WHERE PAY BETWEEN 200 AND 400;
-- 4. 이름이 '김'씨로 시작하는 데이터를 조회하시오.
SELECT * 
FROM PROFESSOR
WHERE NAME LIKE '김%';

-- 5. 직급이 '조교수' 이면서 급여가 300이상인 데이터를 조회하시오.
SELECT * 
FROM PROFESSOR
WHERE POSITION = '조교수' AND PAY >= 300;
-- 6. 직급이 '조교수' 이거나 '정교수'인 데이터를 조회하시오. ( IN 사용 )
SELECT * 
FROM PROFESSOR
WHERE POSITION IN ('조교수', '정교수');
-- 7. 교수번호가 1234인 데이터의 급여를 50증가 시키시오.
UPDATE PROFESSOR SET
    PAY = PAY + 50
WHERE PROFNO = '1234';

-- 8. 교수번호가 1234인 데이터를 삭제하시오.
DELETE FROM PROFESSOR WHERE PROFNO = '1234';
COMMIT;
