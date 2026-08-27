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