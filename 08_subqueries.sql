-- 08_subqueries
-- 다른 sql 문 내부에 포함되어 실행되는 쿼리를 말하며
-- where절: 조건비교, from절: 파생테이블, select절: 계산 결과 컬럼, having절: 집계 결과 조건 등의 맥락에 사용 될 수 있다.

-- 1. 서브쿼리의 결과를 조건으로 활용하는 경우
-- 민트미역국과 같은 카테고리의 메뉴 검색
SELECT
    *
FROM
    tbl_menu
WHERE
    category_code = (SELECT
                        category_code
                    FROM 
                        tbl_menu
                    WHERE  
                        menu_name = '민트미역국');
