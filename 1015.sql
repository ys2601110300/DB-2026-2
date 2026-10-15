--  부속질의문(Sub Query)
--  26 / 08 / 01에 제품을 주문한 고객의 이름을 조회하시오.
SELECT * 
    FROM 주문
    WHERE 주문일자 = '2026-08-01';
    
SELECT 고객이름
    FROM 고객 
    WHERE EXISTS(
                    SELECT *
                    FROM 주문
                    WHERE 주문일자 = '2026-08-01' AND 주문고객 = 고객아이디);

--  26 / 08 / 01에 제품을 주문하지 않은 고객의 이름을 조회하시오.
SELECT 고객이름
    FROM 고객 
    WHERE NOT EXISTS(
                    SELECT *
                    FROM 주문
                    WHERE 주문일자 = '2026-08-01' AND 주문고객 = 고객아이디);
                    
--  고객테이블에 고객아이디가 kiwi, 고객이름이 김유정, 나이가 32세, 등급이 gold, 직업이 연예인
--  적립금이 1000원인 새로운 고객의 정보를 삽입하시오.
INSERT INTO 고객 VALUES('kiwi',
                                            '김유정',
                                            32,
                                            'gold',
                                            '연예인',
                                            1000);
                                            
SELECT *
    FROM 고객;
    
--  고객테이블에 고객아이디 tomato, 고객이름 정은심, 나이 36세, 등급 silver, 적립금 4000원, 직업은 모르는
--  새로운 고객의 정보를 추가하시오.
INSERT INTO 고객 (고객아이디, 고객이름, 나이, 등급, 적립금) VALUES ('tomato',
                                                                                                                '정은심',
                                                                                                                36,
                                                                                                                'silver',
                                                                                                                4000);
                                                                                                                
SELECT *
    FROM 고객;
    
INSERT INTO 고객 VALUES ('tomato2',
                                            '정은채',
                                            36,
                                            'silver',
                                            null,
                                            4000);

SELECT *
    FROM 고객;
    
--  한빛제과에서 제조한 제품의 제품명, 재고량, 단가를 제품테이블에서 검색하여 한빛제품 테이블을 추가하시오.
CREATE TABLE 한빛제품(
                            제품명 VARCHAR (50) NOT NULL PRIMARY KEY,
                            재고량 INT,
                            단가 INT);
                            
INSERT
    INTO 한빛제품(제품명, 재고량, 단가)
    SELECT 제품명, 재고량, 단가
    FROM 제품
    WHERE 제조업체 = '한빛제과';
    
--  제품테이블에서 제품번호가 p03인 제품의 제품명을 통큰파이로 수정하시오.
UPDATE 제품
    SET 제품명 = '통큰파이'
    WHERE 제품번호 = 'p03';
        
SELECT *
    FROM 제품;

--   제품테이블에서 통통우동 제품명을 쫄깃우동으로 수정하시오.
UPDATE 제품
    SET 제품명 = '쫄깃우동'
    WHERE 제품명 = '통통우동';

--   제품테이블에서 모든 제품을 10%인상한 가격으로 인상단가를  출력하시오.
UPDATE 제품
    SET 단가 = 단가 * 1.1;
    
SELECT 제품번호, 제품명, 재고량, 단가 인상단가, 제조업체
    FROM 제품;
    
--  정소화 고객이 주문한 제품의 주문수량을 5개로 수정하시오.
UPDATE 주문
    SET 수량 = 5
    WHERE 주문고객 IN (SELECT 고객아이디
                                    FROM 고객
                                    WHERE 고객이름 = '정소화');

--  고객테이블에서 tomato2인 고객을 삭제하시오.
DELETE FROM 고객
    WHERE 고객아이디 = 'tomato2';
    
--  VIEW(기본테이블에서 파생된 가상 테이블)

--  고객테이블에서 등급이 VIP인 고객의 고객아이디, 고객이름, 나이,등급으로 구성된 뷰를 

--  우수고객이라는 이름으로 생성하시오.
 
CREATE 우수고객(고객아이디,고객이름,나이,등급)
    AS SELECT 고객아이디, 고객이름, 나이, 등급 
    FROM 고객
    WHERE 등급='vip'
    WITH CHECK OPTION;    

--  제품테이블에서 제조업체별 제품수로 구성된 뷰를 업체별 제품수라는 이름으로 생성하시오
SELECT 제조업체, COUNT(*) 제품수
    FROM 제품
    GROUP BY 제조업체;

CREATE VIEW 업체별제품수(제조업체, 제품수)
    AS SELECT 제조업체, COUNT(*) 제품수
    FROM 제품
    GROUP BY 제조업체
    WITH CHECK OPTION;

--  나이가 30세이상인 우수고객을 검색하시오.
SELECT *
    FROM 우수고객
    WHERE 나이 >= 30;

--   제품테이블에서 제품번호, 재고량, 제조업체  컬럼을 갖는 제품1 뷰를 생성하시오.
CREATE VIEW 제품1
    AS SELECT 제품번호, 재고량, 제조업체
    FROM 제품
    WITH CHECK OPTION;
    
SELECT *   
    FROM 제품1;
    
--  제품1 뷰에 제품번호 'p08', 재고량 1000, 제조업체가  '신선식품'인 새로운 제품의 정보를 추가하시오.
INSERT INTO 제품1 VALUES ('p08',
                                                1000,
                                                '신선식품');
                       
제품 1 뷰의 기본테이블인 제품에도 추가가 되었는지 확인                                                
SELECT *
    FROM 제품;
 