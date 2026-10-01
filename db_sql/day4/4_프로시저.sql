-- 프로시저

CREATE OR REPLACE PROCEDURE TEMP_PROC
IS
BEGIN  
    DBMS_OUTPUT.PUT_LINE('Hello Oracle'); -- 자바의 프린트문 같은 역할
END;
/

-- PL/SQL과 관련된건 주석을 다른 라인에 작성
SET SERVEROUTPUT ON; 
EXEC TEMP_PROC;

-- 인자 값으로 보낸 사번을 가진 사원의 이름, 직급, 급여 정보 출력
EXEC EMPINFO_PROC(1234);

CREATE OR REPLACE PROCEDURE EMPINFO_PROC(I_EMPNO EMP.EMPNO%TYPE)
IS
    O_ENAME EMP.ENAME%TYPE;
    O_JOB EMP.JOB%TYPE;
    O_SAL EMP.SAL%TYPE;
BEGIN
    SELECT ENAME, JOB, SAL
    INTO O_ENAME, O_JOB, O_SAL
    FROM EMP
    WHERE EMPNO = I_EMPNO;
    
    DBMS_OUTPUT.PUT_LINE(O_ENAME || '님의 직급은 ' || O_JOB || ', 급여는 ' || O_SAL);
END;
/
SELECT * FROM EMP;
EXEC EMPINFO_PROC(7566);

-- EXEC EMP_ADDSAL_PROC(사번, 급여)
-- 해당 사번을 가진 사원의 급여를 두번째 인자값으로 변경

CREATE OR REPLACE PROCEDURE EMP_ADDSAL_PROC(
    I_EMPNO EMP.EMPNO%TYPE,
    I_SAL EMP.SAL%TYPE
)
IS
    O_COUNT NUMBER;
BEGIN
    UPDATE EMP SET
        SAL = I_SAL
    WHERE EMPNO = I_EMPNO;
    O_COUNT := SQL%ROWCOUNT;
    
    IF O_COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('사번을 확인해주세요.');
    ELSIF O_COUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('수정되었습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('2건이상 수정되었습니다.');
    END IF;
    COMMIT;
END;
/

EXEC EMP_ADDSAL_PROC(7566, 4000);
SELECT * FROM EMP;
ROLLBACK;


-- 프로시저 호출
-- ENROL_PROC('학번', '과목번호', '수정할 점수')
-- 1. 없는 학번이나 없는 과목번호를 입력하면 '정보를 다시 확인해주세요' 출력
-- 2. 점수가 0미만, 100초과일 경우 '점수의 범위는 0~100 입니다' 출력
-- 3. 학번, 과목번호에 해당하는 점수는 3번째 인자값으로 변경

CREATE OR REPLACE PROCEDURE ENROL_PROC(
    I_STUNO ENROL.STU_NO%TYPE,
    I_SUBNO ENROL.SUB_NO%TYPE,
    I_GRADE ENROL.ENR_GRADE%TYPE
)
IS
    O_COUNT NUMBER;
BEGIN
    IF I_GRADE BETWEEN 0 AND 100 THEN
        UPDATE ENROL SET
            ENR_GRADE = I_GRADE
        WHERE STU_NO = I_STUNO AND SUB_NO = I_SUBNO;
        O_COUNT := SQL%ROWCOUNT;
        IF O_COUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('정보를 다시 확인해주세요');
        ELSIF O_COUNT = 1 THEN
            DBMS_OUTPUT.PUT_LINE('수정되었습니다!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('2개 이상 수정되었습니다!');
        END IF;
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('점수의 범위는 0~100 입니다');
    END IF;
END;
/


EXEC ENROL_PROC('20131001', '104', 75);
SELECT * FROM ENROL;


-- STUDENT 테이블에 학번, 이름, 학과를 입력받아서 저장하는 프로시저
-- 학번은 8글자 아니면 에러 문구 출력

CREATE OR REPLACE PROCEDURE STUINSERT_PROC (
    I_STUNO STUDENT.STU_NO%TYPE,
    I_STUNAME STUDENT.STU_NAME%TYPE,
    I_STUDEPT STUDENT.STU_DEPT%TYPE
)
IS
BEGIN
    IF LENGTH(I_STUNO) != 8 THEN
--        DBMS_OUTPUT.PUT_LINE('8글자!!!!!!!!!!!');
        RAISE_APPLICATION_ERROR(-20001, '학번은 8글자!!');                               -- 20001~ 20999
    END IF;
    
    INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT)
    VALUES(I_STUNO, I_STUNAME, I_STUDEPT);
    COMMIT;
   
END;
/

EXEC STUINSERT_PROC('12341234', '홍길동', '기계');

SELECT * FROM STUDENT;




