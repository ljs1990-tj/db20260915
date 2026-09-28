-- 조건 함수
SELECT * FROM STUDENT;

SELECT * FROM PROFESSOR;

SELECT * 
FROM PROFESSOR
WHERE PAY+BONUS >= 300; -- NULL값을 더하면 결과도 NULL


SELECT 
    NAME, PAY, BONUS, PAY+BONUS
FROM PROFESSOR;

-- NVL, NVL2 : NULL을 처리하는 함수
-- NVL(컬럼명, 대체값) => 컬럼 값이 NULL이면 대체값으로 출력
SELECT 
    NAME, PAY, NVL(BONUS, 0), PAY+NVL(BONUS, 0)
FROM PROFESSOR;

SELECT * 
FROM PROFESSOR
WHERE PAY+NVL(BONUS, 0) >= 300;

--
SELECT 
    NAME, BONUS, NVL2(BONUS, '있다', '없다')
FROM PROFESSOR;


-- DECODE : 자바의 IF문

SELECT 
    STU_NAME,
    DECODE(STU_GENDER, 'M', '남자'), -- IF까지
    DECODE(STU_GENDER, 'M', '남자', '여자') -- IF~ELSE까지
FROM STUDENT;

SELECT 
    STU_NAME,
    DECODE(STU_GRADE, 1, '저학년', 2, STU_GRADE || '학년', '고학년') -- ELSE IF
FROM STUDENT;

-- 학생 이름, 성별(남자OR여자) 출력
-- 성별을 구하는 방법은 JUMIN의 7번째 숫자가 1(남자) OR 2(여자)
SELECT 
    NAME,
    SUBSTR(JUMIN, 7, 1),
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자')
FROM STU;

-- CASE WHEN (범위에 대한 조건 줄때 좋다)
SELECT 
    STU_NO,
    CASE 
        WHEN ENR_GRADE >= 80 THEN '통과'
        WHEN ENR_GRADE >= 70 THEN '보류'
        ELSE '재시험'
    END 시험결과
FROM ENROL;


-- PAY+BONUS가 500이상이면 '높다'
-- 300이상 500미만이면 '중간'
-- 그 외에는 '낮다' 출력

SELECT  
    NAME,
    CASE
        WHEN PAY+NVL(BONUS, 0) >= 500 THEN '높다'
        WHEN PAY+NVL(BONUS, 0) >= 300 THEN '중간'
        ELSE '낮다'
    END AS 급여등급
FROM PROFESSOR;



