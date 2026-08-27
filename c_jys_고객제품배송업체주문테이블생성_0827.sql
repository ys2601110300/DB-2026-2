-- DDL 
-- Table 생성

create table 고객(
    고객아이디 VARCHAR(20) not null primary key,
    고객이름 VARCHAR(20) not null,
    나이 int,
    등급 varchar (10) not null,
    직업 VARCHAR (20),
    적립금 int default 0
);

create table 제품(
    제품번호 CHAR(5) not null,
    제품명 VARCHAR(20),
    재고량 int,
    단가 int,
    제조업체 VARCHAR(20),
    primary key(제품번호),
    check(재고량>=0 and 재고량 <=10000)
);

-- Foreign Key
create table 주문(
    주문번호 VARCHAR(10) NOT NULL PRIMARY KEY,
    주문고객 VARCHAR(20),
    주문제품 VARCHAR(5),
    수량 INT,
    배송지 VARCHAR(50),
    주문일자 DATE,
    FOREIGN KEY (주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY (주문제품) REFERENCES 제품(제품번호) 
);

CREATE TABLE 배송업체(
    업체번호 VARCHAR(5) NOT NULL PRIMARY KEY,
    업체명 VARCHAR(20),
    주소 VARCHAR(100),
    전화번호 VARCHAR(20)
);