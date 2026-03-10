-- 10_dml (데이터 조작 언어)
-- 테이블에 데이터를 삽입(insert), 수정(update), 삭제(delete)할 때 사용하는 sql 구문

-- 1. insert : 새로운 행을 추가한다. 테이블의 행 수가 증가한다.

-- 컬럼을 명시하지 않았을 경우 values에서 컬럼 순서를 지켜 모든 값을 삽입해야 한다.
INSERT INTO
    tbl_menu
VALUES  -- menu_code 컬럼은 AUTO_INCREMENT 설정이 되어 있으므로 NULL 처리
    (NULL, '바나나해장국', 15000, 4, 'Y'); -- 컬럼 순서에 맞게 작성

select * from tbl_menu;

-- insert 하고 싶은 데이터 컬럼을 지정해서 삽입
INSERT INTO
    tbl_menu (
        menu_name,
        menu_price,
        category_code,
        orderable_status
    )
VALUES 
    (
        '초콜릿죽',
        9500,
        5,
        'Y'
    );

-- 컬럼을 명시하면 insert 시 데이터의 순서를 바꾸는 것도 가능하다.
INSERT INTO
    tbl_menu (
        menu_price,
        menu_name,
        orderable_status,
        category_code
    )
VALUES 
    (
        9500,
        '파인애플탕',
        'Y',
        6
    );