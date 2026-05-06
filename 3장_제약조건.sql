# 날짜 : 2026/05/06
# 이름 : 홍유원
# 내용 : 3장 제약조건

#실습 3-1. 기본키 실습
CREATE TABLE User2(
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10),
    addr VARCHAR(50)
);

#실습 3-2. User2 데이터 추가
INSERT INTO User2 VALUES ('A101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO User2 VALUES ('A102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO User2 VALUES ('A103', '장보고', '1978-03-01', '전남 완도군');
INSERT INTO User2 VALUES ('A104', '강감찬', '1968-08-16', '서울 관악구');
INSERT INTO User2 VALUES ('A105', '이순신', '1981-05-23', '부산 부산진구');
SELECT * FROM USER2;

#실습 3-3. 고유키 실습
CREATE TABLE User3(
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10),
    hp	CHAR(13)  UNIQUE,
    addr VARCHAR(50)
    );
    
    
#실습 3-4. User3 데이터 추가
INSERT INTO User3 VALUES ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
INSERT INTO User3 VALUES ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
INSERT INTO User3 VALUES ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
INSERT INTO User3 VALUES ('A104', '강감찬', '1968-08-16', '010-1234-1004', '서울 관악구');
INSERT INTO User3 VALUES ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산 부산진구');
INSERT INTO User3 VALUES ('A106', '정약용', '1981-05-22',  NULL, '부산 부산진구');
INSERT INTO User3 (userid, name, birth, addr) VALUES ('A107', '을지문덕', '1980-01-22', '부산 금정구');
INSERT INTO USER3 (userid, birth, addr, name) VALUES ('A107', '1980-01-22', '부산 금정구', '을지문덕');

INSERT INTO User3 VALUES 
INSERT I
SELECT * FROM USER3;

#실습 3-5. 외래키 실습
CREATE TABLE Parent(
	pid	  VARCHAR(10) PRIMARY KEY,
    name  VARCHAR(10),
    birth CHAR(10), -- 1990-01-23(총 10자리 고정문자열)
    addr  VARCHAR(100)
);

CREATE TABLE Child(
	cid VARCHAR(10) PRIMARY KEY,
    name  VARCHAR(10),
    hp CHAR(13) UNIQUE,
    parent VARCHAR(10),
    FOREIGN KEY(parent) REFERENCES parent(pid)
);

#실습 3-6, parent, Child 데이터 추가하기
INSERT INTO Parent VALUES ('P101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO Parent VALUES ('P102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO Parent VALUES ('P103', '장보고', '1978-03-01', '전남 완도시');
INSERT INTO Parent VALUES ('P104', '강감찬', '1979-08-16', '서울 관악시');
INSERT INTO Parent VALUES ('P105', '이순신', '1981-05-23', '부산 부산진구');
* FROM Parent;

INSERT INTO Child VALUES ('C101', '김철수', '010-1234-1001', 'P101');
INSERT INTO Child VALUES ('C102', '김영희', '010-1234-1002', 'P102');
INSERT INTO Child VALUES ('C103', '강철수', '010-1234-1003', 'P103');
INSERT INTO Child VALUES ('C104', '이철수', '010-1234-1004', 'P104');
INSERT INTO Child VALUES ('C104', '이철수', '010-1234-1004', 'P100'); -- 부모키값 P100이 존재하지 않기때문에 INSERT 안됨 
INSERT INTO Child VALUES ('C105', '최영', '010-1234-1004', NULL);
* FROM Child;

#실습 3-7. DEFAULT와 NOT NULL 실습
CREATE TABLE User4(
	userid VARCHAR(10) PRIMARY KEY,
    name   VARCHAR(10) NOT NULL,
    gender CHAR(1),
    age    INT        DEFAULT 1,
    hp     CHAR(13) UNIQUE,
    addr   VARCHAR(20)
);

INSERT INTO User4 VALUES ('A101', '김유신', 'M', '25', '010-1234-1111', '경남 김해시');
INSERT INTO User4 VALUES ('A101', '김춘추', 'M', '23', '010-1234-2222', '경남 경주시');
INSERT INTO User4 VALUES ('A101', '장보고', 'M', '35', '010-1234-3333', '전남 완도시');
INSERT INTO User4 VALUES ('A101', '강감찬', 'M', '42', '010-1234-4444', '서울시 관악구');
INSERT INTO User4 (userid, name, gender, hp, addr) VALUES ('A101', '이순신', 'Muser3user2user1user3', '010-1234-5555', '부산시 진구');
INSERT INTO User4 VALUES ('A101', '신사임당', 'F', '32', NULL, '강릉시');
INSERT INTO User4 VALUES ('A101', '허난설헌', 'F', '27', NULL, '경기도 광주시');
Select * from User4;

#실습 3-9. AUTO_INCREMENT와 CHECK 제약조건
CREATE TABLE User5 (
	seq 	INT AUTO_INCREMENT PRIMARY KEY,
	name    VARCHAR(10) NOT NULL,
    gender  CHAR(1) CHECK (gender IN ('M', 'F')),
    age		INT DEFAULT 1 CHECK (age > 0 AND age < 100),
    addr	VARCHAR(20)
);

INSERT INTO User5 (name, gender, age, addr) VALUES ('김유신','M', 25,'경남 김해시');
INSERT INTO User5 (name, gender, age, addr) VALUES ('김춘추','M', 35,'경남 경주시');
INSERT INTO User5 (name, gender, age, addr) VALUES ('장보고','M', 45,'전남 완도');
INSERT INTO User5 (name, gender, age, addr) VALUES ('강감찬','M', 51,'서울 관악구');
INSERT INTO User5 (name, gender, age, addr) VALUES ('이순신','M', 51,'부산시');
INSERT INTO User5 (name, gender, age, addr) VALUES ('신사임당','F', 25,'강릉시');
SELECT * FROM User5;