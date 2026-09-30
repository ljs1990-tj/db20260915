-- 시퀀스

-- EX) 게시판 -> 제목, 내용, 작성자, 작성일, 조회수 등이 필요
-- 게시글번호 : 1
-- 제목 : 오라클 재밌다
-- 내용 : 정말 재밌다~~~
-- 작성자 : TEST123
-- 작성일 : 2026/09/30
-- 조회수 : 0

CREATE TABLE BOARD(
    BOARDNO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100),
    CONTENTS VARCHAR(300),
    USERID VARCHAR2(100),
    CNT NUMBER,
    CDATETIME DATE,
    UDATETIME DATE
); 

SELECT * FROM BOARD;

-- 시퀀스 생성
CREATE SEQUENCE TEST_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 99999
    NOCYCLE;

SELECT 
    TEST_SEQ.NEXTVAL
FROM DUAL;

CREATE SEQUENCE BOARD_SEQ
    INCREMENT BY 1
    START WITH 1;


SELECT * FROM BOARD;

INSERT INTO BOARD 
VALUES(BOARD_SEQ.NEXTVAL, '재밌는 코딩~', 'ㅋㅋㅋㅋㅋㅋ', 'test123', 0, SYSDATE, SYSDATE);

INSERT INTO BOARD 
VALUES(BOARD_SEQ.NEXTVAL, '점메추', '냉무', 'qqq', 0, SYSDATE, SYSDATE);
COMMIT;

-- 댓글 테이블 (BOARD_COMMENT)
-- 댓글번호(COMMENTNO), 댓글내용(COMMENT), 작성자(USERID), 
-- 작성일(CDATETIME), 수정일(UDATETIME)

