SELECT * FROM TBL_USER;
SELECT * FROM TBL_POINT;

-- 사용자 아이디, 이름, 잔여포인트 출력
SELECT U.USERID, NAME, BALANCE
FROM TBL_USER U
INNER JOIN (
    SELECT *
    FROM (
        SELECT 
            USERID, BALANCE,
            RANK() OVER(PARTITION BY USERID ORDER BY CDATETIME DESC) RANK
        FROM TBL_POINT
    ) WHERE RANK = 1
) T ON U.USERID = T.USERID;


-- '오지훈'의 현재 남은 포인트를 출력하세요.
-- 아이디, 이름, 남은포인트 출력






