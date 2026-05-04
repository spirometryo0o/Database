# 날짜: 2026/05/04
# 이름: 홍유원
# 내용 : 2장 SQL 기초

#테이블 생성
CREATE TABLE User1 (
	userid VARCHAR(20),
    name   VARCHAR(20),
    hp     CHAR(13),
    age    int
);

#테이블 삭제
DROP TABLE User1;


#테이블에 데이터 추가
INSERT INTO User1 VALUSE ('A101', '김유신', '010-1234-1111',25);
INSERT INTO User1 VALUSE ('A102', '김춘추', '010-1234-2222',23);
INSERT INTO User1 VALUSE ('A103', '장보고', '010-1234-3333',32);
INSERT INTO User1 (userid, name, age) VALUES ('A104', '강감찬', 45);
INSERT INTO User1 SET
					userid='A105', 
                    name='이순신', 
                    hp='101-1234-5555';

#테이블에 데이터 조회
SELECT * FROM User1;
SELECT * FROM USER1 WHERE userid='A101'; -- where : 조건절
SELECT * FROM USER1 WHERE name='김춘추';
SELECT * FROM USER1 WHERE age < 30;
SELECT * FROM USER1 WHERE age >= 30;
SELECT userid, name, age From User1;alter

#실습 2-4. 테이블에 데이터 수정
UPDATE User1 SET hp='010-1234-4444' WHERE useid='A104';
UPDATE User1 SET age=51 WHERE userid='A105';
UPDATE User1 SET hp='010-1234-1001', 
				 age=27, 
				 WHERE userid='A101';

#실습 2-5. 데이터 삭제
DELETE FROM User1 WHERE userid='A101';
DELETE FROM User1 WHERE userid='A102' AND age=25;
DELETE FROM User1 WHERE age >= 30;

# 실습 2-6. 테이블 컬럼 수정
ALTER TABLE User1 ADD gender TINYINT;
ALTER TABLE User1 ADD birth CHAR(10) AFTER name;
ALTER TABLE User1 MODIFY gender CHAR(1);
ALTER TABLE User1 Drop gender;
SELECT * FROM USER1;

#실습 2-7. 테이블 복사
CREATE TABKE User1_1 LIKE User1; -- 테이블 복사, 데이터는 복사 안됨
INSERT INTO User1_1 SELECT * FRIM User1; -- User1 테이블 데이터를 User1_1로 복사
SELECT * FROM User1_1;
