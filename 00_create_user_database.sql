-- root와 분리 된 새로운 계정 생성
CREATE USER 'ohgiraffers'@'%' IDENTIFIED BY 'ohgiraffers';

-- 현재 존재하는 데이터베이스 확인
SHOW DATABASES;

-- 사용할 데이터베이스 선택
USE mysql;

-- 모든 계정 정보 확인
SELECT * FROM user;

-- 새로운 데이터베이스(스키마) 생성
CREATE DATABASE menudb;

-- 새롭게 생성한 스키마에 새롭게 생성한 계정이 모든 권한을 가지도록 설정
GRANT ALL PRIVILEGES ON menudb.* TO 'ohgiraffers'@'%';

-- 권한 부여 확인
SHOW GRANTS FOR 'ohgiraffers'@'%';

SELECT USER();
