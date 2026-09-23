-- 문자 함수

SELECT *
FROM STUDENT;

-- 학번_이름, ex) 20153075_옥한빛

-- 1) CONCAT (문자열 이어붙이기)
SELECT CONCAT(CONCAT(STU_NO, '_'), STU_NAME)
FROM STUDENT;

-- 1-1) ||
SELECT STU_NO || '_' || STU_NAME
FROM STUDENT;

-- 2) LENGTH
SELECT ID, LENGTH(ID)
FROM PROFESSOR;

-- 3) SUBSTR
SELECT 
    NAME,
    SUBSTR(JUMIN, 3, 2),
    SUBSTR(JUMIN, 1, 6),
    SUBSTR(JUMIN, 7)
FROM STU;

-- DECODE => 자바의 IF문
-- DECODE(컬럼값, 1, 컬럼값이1일때출력, 아닐때출력)
SELECT 
    NAME,
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자') 성별
FROM STU;

-- UPPER, LOWER
SELECT
    UPPER('HelLo OrAcLE'),
    LOWER('HelLo OrAcLE')
FROM DUAL;

-- INSTR (특정 문자열이 몇번째에 위치에 처음 나오는지)
SELECT 
    EMAIL,
    INSTR(EMAIL, '@'),
    SUBSTR(EMAIL, INSTR(EMAIL, '@')+1) AS DOMAIN
FROM PROFESSOR;

-- TRIM, LTRIM, RTRIM
SELECT
    TRIM('    Hello Oracle   '),
    LTRIM('    Hello Oracle   '),
    RTRIM('    Hello Oracle   ')
FROM DUAL;

-- LPAD, RPAD (지정한 길이 만큼 특정 문자열 채우기)
SELECT 
    ID,
    RPAD(ID, 10, '*'),
    LPAD(ID, 10, '*')
FROM PROFESSOR;

-- 아이디에 첫 3글만 출력하고 나머지 공간을 * 채우기
-- 아이디가 6글자면 *이 3개, 아이디가 8글자면 *는 5개

SELECT
    ID,
    RPAD(SUBSTR(ID, 1, 3), LENGTH(ID), '*' )
FROM PROFESSOR;

-- 아이디의 마지막 3글자만 *로 출력
SELECT
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH(ID), '*'),
    SUBSTR(ID, 1, LENGTH(ID)-3) || '***'
FROM PROFESSOR;

-- EMAIL에서 @ 뒷부분을 다 *로 출력
-- captain@abc.net => captain@*******
SELECT 
    INSTR(EMAIL, '@'),
    SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')),
    RPAD(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')), LENGTH(EMAIL), '*')
FROM PROFESSOR;

SELECT 
    SUBSTR(STU_NAME, 1,1) || '*' || SUBSTR(STU_NAME, 3,1)
FROM STUDENT;

-- 첫글자와 마지막 글자 빼고 다 *로



