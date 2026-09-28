-- 1. 다음 학생 정보를 STUDENT 테이블에 추가하시오.
--    학번 : 20262015
--    이름 : 박학생
--    학과 : 기계
--    학년 : 1
--    반 : A
--    성별 : F
--    키 : 165
--    몸무게 : 52
SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES('20262015', '박학생', '기계', 1, 'A', 'F', 165, 52);
COMMIT;

-- 2. 몸무게가 NULL이 아닌 학생을 조회하시오.
SELECT * 
FROM STUDENT
WHERE STU_WEIGHT IS NOT NULL;

-- 3. 키가 160 이상 175 이하인 학생을 조회하시오.
--    ( BETWEEN 사용 )
SELECT * 
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 160 AND 175;
-- WHERE STU_HEIGHT >= 160 AND STU_HEIGHT <= 175;

-- 4. 이름이 '이'씨로 시작하는 학생을 조회하시오.
SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '이%';

-- 5. 학과가 '기계'이면서 몸무게가 60 이상인 학생을 조회하시오.
SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계' AND STU_WEIGHT >= 60; 

-- 6. 학과가 '컴퓨터정보' 또는 '전기전자'인 학생을 조회하시오.
--    ( IN 사용 )
SELECT *
FROM STUDENT
WHERE STU_DEPT IN ('컴퓨터정보', '전기전자');
-- WHERE STU_DEPT = '컴퓨터정보' OR STU_DEPT = '전기전자';

-- 7. 학번이 20262015인 학생의 키를 3 증가시키시오.
UPDATE STUDENT SET
    STU_HEIGHT = STU_HEIGHT + 3
WHERE STU_NO = '20262015';
COMMIT;
-- 8. 학번이 20262015인 학생을 삭제하시오.
DELETE FROM STUDENT WHERE STU_NO = '20262015';
COMMIT;


​