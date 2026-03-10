-- Active: 1773026909909@@127.0.0.1@3306@menudb
-- 07_grouping
-- group by : 특정 컬럼의 값이 같은 행들을 하나의 그룹으로 묶기 위해 사용한다.
-- having : 주로 group by와 함께 사용 되며 그룹화 된 결과에 조건을 적용할 때 사용한다.

-- 1. group by
SELECT
    category_code
FROM
    tbl_menu
GROUP BY
    category_code;

-- (1) count 함수: 집계함수
-- category_code 별 메뉴 개수 조회
SELECT
    category_code, 
    count(*) as menu_count
FROM
    tbl_menu
GROUP BY
    category_code;

-- count 함수의 특성
-- '*' : 전체 행의 개수를 카운트, 컬럼명 : null 제외한 행의 개수를 카운트
SELECT
    count(*) as total_count,
    count(category_code) as category_code_count,
    count(ref_category_code) as ref_category_code_count
FROM
    tbl_category;

-- (2) sum 함수 활용 : 집계함수
-- category_code별 menu_price 합계
SELECT
    category_code,
    SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- (3) AVG 함수 활용 : 집계함수
-- category_code 별 menu_price 평균
SELECT
    category_code,
    AVG(menu_price) as avg_price
FROM
    tbl_menu
GROUP BY
    category_code;