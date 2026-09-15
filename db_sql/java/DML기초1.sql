-- 조회 ( SELECT )
SELECT * 
FROM FRUIT;

-- 조회 + 조건(WHERE)  =, >, <, >=, <=
SELECT * 
FROM FRUIT
WHERE FRUIT_NAME = '사과';

SELECT * 
FROM FRUIT
WHERE PRICE <= 800;

-- 조회 + 정렬(ORDER BY)
-- 정렬은 무조건 맨 마지막
SELECT *
FROM FRUIT
ORDER BY PRICE; -- 정렬의 기본 값은 오름차순(ASC)

SELECT *
FROM FRUIT
ORDER BY PRICE ASC; -- 오름차순

SELECT *
FROM FRUIT
ORDER BY PRICE DESC; -- 내림차순(DESC)

-- 삽입 ( INSERT )
INSERT INTO FRUIT(FRUIT_NAME, PRICE, CNT)
VALUES('사과', 1000, 20);

INSERT INTO FRUIT
VALUES('바나나', 500, 30);


-- 수정 ( UPDATE )
UPDATE FRUIT SET
    PRICE = 1100,
    CNT = CNT + 5
WHERE FRUIT_NAME = '사과';

SELECT * FROM FRUIT;

-- 삭제 ( DELETE )
DELETE FROM FRUIT WHERE FRUIT_NAME = '바나나';

DELETE FROM FRUIT WHERE FRUIT_NAME = '사과';

-- 커밋(확정), 롤백(되돌리기)
COMMIT; 
-- 테이블 데이터에 변화(INSERT, DELETE, UPDATE) 이후에는
-- COMMIT을 통해 확정해주지 않으면 최종 반영이 안된다.
-- COMMIT 하기전에는 ROLLBACK으로 되돌리기가 가능하다.
ROLLBACK;



