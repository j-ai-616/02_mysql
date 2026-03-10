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

-- 집계함수
-- (1) count 함수
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

-- (2) sum 함수 활용
-- category_code별 menu_price 합계
SELECT
    category_code,
    SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- (3) AVG 함수 활용
-- category_code 별 menu_price 평균
SELECT
    category_code,
    AVG(menu_price) as avg_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- (4) MIN, MAX 함수 활용
-- 그룹별 최소값, 최대값을 구할 때 사용하며 "숫자, 문자, 날짜" 등 모든 자료형에 사용 가능하다.
-- 카테고리 그룹별 가장 비싼 or 싼 메뉴 가격
SELECT
    category_code,
    MAX(menu_price) as max_price,
    MIN(menu_price) as min_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- 2개 이상의 컬럼을 기준으로 
-- 각 컬럼 값 "조합이 같은 행 끼리" 하나의 그룹으로 묶인다.
SELECT 
    menu_price,
    category_code,
    count(*) as menu_count
FROM
    tbl_menu
GROUP BY
    menu_price,
    category_code;

-- 2. Having

-- 메뉴 개수가 2개 이상인 카테고리 그룹 조회
-- 먼저 카테고리 코드로 그룹화 한 뒤, 각 그룹의 메뉴 개수가 2개 이상인 "그룹만 필터링"한다.
SELECT 
    category_code,
    COUNT(*) as menu_count
FROM
    tbl_menu
GROUP BY
    category_code
HAVING  -- grouping 된 결과를 필터링 한다.
    COUNT(*) >= 2;

-- where절은 그룹화 이전의 행에 조건을 적용하고
-- having절은 그룹화 이후의 결과에 조건을 적용한다.

-- where절
SELECT  -- 마지막 순서
    category_code,
    AVG(menu_price) as avg_menu_price
FROM  -- 1번째 시작
    tbl_menu
WHERE  -- 2번째 
    menu_price >= 10000
GROUP BY  -- 3번째 : 2번째 걸러진 후 그룹핑. categoy_code(10)에는 10000원보다 작은 값이 있었을 것.
    category_code;

-- having 절
SELECT  -- 마지막 순서
    category_code,
    AVG(menu_price) as avg_menu_price
FROM  -- 1번째 시작
    tbl_menu
GROUP BY  -- 2번째 : 1번째 테이블의 전체를 그룹핑
    category_code
HAVING  -- 3번째 : 2번째 그룹핑 한 것에서 10000원 넘는 것
    AVG(menu_price) >= 10000;
    
-- 3. rollup
-- with rollup을 사용하면 그룹별 집계 결과와 함께 중간 소계 또는 전체 총합 행이 추가된다.
-- 이 때, 총합 또는 소계 행의 그룹 컬럼 값은 NULL으로 표시 될 수 있다.

-- 컬럼 한 개를 그루핑 했을 경우 rollup
-- 마지막에 전체 메뉴 가격 총합 행을 함께 조회한다.
SELECT
    category_code,
    SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
    category_code
WITH ROLLUP; -- 총합 행

-- 컬럼 두 개를 그루핑 했을 경우
-- group by에 작성 된 컬럼의 순서를 기준으로 계층적인 소계와 총계를 추가한다. (만약 group by에 작성 된 컬럼의 순서가 바뀌면 결과도 변한다.)
-- "첫 번째 컬럼 값"을 기준으로하여 소계를 중간에 추가. 맨 마지막에는 전체 메뉴 가격 총합 행을 함께 조회한다.
SELECT
    menu_price,
    category_code,
    SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
    menu_price,
    category_code
WITH ROLLUP;

SELECT
    category_code,
    menu_price,
    SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY  -- 위 코드에서 순서 변경
    category_code,
    menu_price
WITH ROLLUP;