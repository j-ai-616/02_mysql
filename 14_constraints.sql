-- 14_constraints (제약 조건)

-- 1. NOT NULL: NULL 값을 허용하지 않는 제약 조건
CREATE TABLE IF NOT EXISTS user_notnull
(
    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender CHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- 정상 수행
INSERT INTO user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');

-- 제약조건 위반
-- gender는 명시적 null 입력이 가능하지만 phone 명시적 null 입력 불가 (제약조건 위배)
NSERT INTO user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (2, 'user01', 'pass01', '유관순', NULL, NULL, 'yoo123@gmail.com');
-- insert할 컬럼으로 나열하지 않은 경우 default값이 없어서 처리 되지 못함 (제약조건 위배)
NSERT INTO user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES ('user01', 'pass01', '유관순', NULL, '010-1234-5678', 'yoo123@gmail.com');

-- 2. UNIQUE : 중복 값을 허용하지 않는 제약 조건
CREATE TABLE IF NOT EXISTS user_unique
(
    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender CHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- 정상 수행
INSERT INTO user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');

-- 제약조건 위반
-- user_id에 unique 제약 조건이 있으므로 동일한 id를 입력하거나 수정하면 오류 발생
INSERT INTO user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');

-- 3. PRIMARY KEY : 각 행을 유일하게 식별하는 제약 조건
-- NOT NULL + UNIQUE 의 의미를 가진다.

CREATE TABLE IF NOT EXISTS user_primary_key
(
    user_no INT PRIMARY KEY,   -- 컬럼 레벨
    user_id VARCHAR(255) NOT NULL UNIQUE,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender CHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
    -- PRIMARY KEY(user_no, user_id)   -- 테이블 레벨 작성 (여러 컬럼을 묶어서 복합키 사용 시)
);

-- 정상 수행
INSERT INTO user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');
-- 정상 수행
INSERT INTO user_primary_key(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');

INSERT INTO user_primary_key(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (NULL, 'user01', 'pass01', '유관순', '여', '010-1234-5678', 'yoo123@gmail.com');

