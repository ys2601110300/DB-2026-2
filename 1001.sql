--  집계 함수 
--  SUM, AVG <= 숫자데이터 컬럼만 사용 가능
--  COUNT, MIN, MAX <= 모든 데이터에 사용 가능
--  SELECT절 또는 HAVING 절에 사용

--  고객테이블에서 나이의 평균을 검색하시오.
SELECT AVG (나이)  고객나이평균 
    FROM 고객;

--  고객테이블에서  성이 '김' 또는 '최' 또는 '오'인 고객의 나이 평균을 검색하시오.(단, 나이평균은 소수점 이하 둘째자리까지 표시하시오.)
SELECT ROUND (AVG(나이), 2) 나이평균
    FROM 고객
    WHERE 고객이름 LIKE '최%' OR  고객이름 LIKE'김%' OR  고객이름 LIKE '오%';
    
    
--  제품테이블에서 제조업체가 한빛제과 또는 대한식품은 제품의 단가평균을 검색하시오
SELECT ROUND (AVG(단가), 3)  단가평균
    FROM 제품
    WHERE 제조업체=  '한빛제과' OR 제조업체  = '대한식품';
    
SELECT ROUND (AVG(단가), 3)   단가평균
    FROM    제품
    WHERE   제조업체    IN  ('한빛제과', '대한식품');
    
SELECT TO_CHAR (AVG(단가), 'FM99999990.000')   단가평균
    FROM    제품
    WHERE   제조업체    IN  ('한빛제과', '대한식품');
    
--  SUM: 합계함수
--  한빛제과에서 제조한 제품의 재고량 합계를 제품 테이블에서 검색하시오.
SELECT SUM(재고량) 재고량합계
    FROM 제품
    WHERE 제조업체 = '한빛제과';

--  COUNT 함수
SELECT *
    FROM 고객;

--  고객 테이블에서 고객의 수를 구하시오.
SELECT COUNT(*)
    FROM 고객;

SELECT COUNT(고객이름)
    FROM 고객;
    
SELECT COUNT(나이)
    FROM 고객;
    
--  나이커럼에는 Null 값을 포함하고 있어서 개수에서 제외된다.
SELECT COUNT(나이)
    FROM 고객;
    
--  제품테이블에서 제조업체가 대한식품인 제품의 개수를 구하시오.
SELECT COUNT(재고량) 제품개수
    FROM 제품
    WHERE 제조업체 = '대한식품';
    
--  주문 테이블에서 apple주문고객이 주문한 수량의 합게와 주문한 제품의 개수를 구하시오.
SELECT COUNT(주문제품)  주문개수,  SUM(수량) 수량합계
    FROM 주문
    WHERE 주문고객 = 'apple';
    
--  제품 테이블에서 제조업체명을 표시하시오.(단 ,중복되는 제조업체는 제거하시오.)
SELECT DISTINCT 제조업체
    FROM    제품;

--   제품 테이블에서 참여한 제조업체의 수를 구하시오. (중복제거)
SELECT COUNT (DISTINCT 제조업체) 참여제조업체수
    FROM 제품;
    
--  제품 테이블에서 제조업체명에 '한'이 포함된 참여한 제조업체의 수를 구하시오.(중복 제거)
SELECT COUNT (DISTINCT 제조업체) 참여제조업체수
    FROM 제품
    WHERE 제조업체 LIKE '%한%';
    
--  주문 테이블
SELECT *
    FROM 주문;
    
--  주문 테이블에서 주문고객별 수량의 합계를 구하시오.
SELECT 주문고객, SUM(수량) 총주문수량
    FROM 주문
    GROUP BY 주문고객;
    
--  제품테이블에서 제조업체별로 제조한 제품의 개수와 제품 중 가장 비싼 가격 단가를 검색하되
--  제품의 개수는 제품수, 가장 비싼 단가는 최고가라고 출력하시오.
SELECT 제조업체, COUNT(*) 제품수, MAX(단가) 최고가
    FROM 제품
    GROUP BY 제조업체;
    
--  주문테이블에서 주문 고객별로 주문한 제품의 개수와 주문수량 중 가장 적은 수량을 검색
--  (단 ,주문한 제품의 개수는 주문제품수, 가장 적은 수량은 최소수량으로 출력)
SELECT 주문고객, COUNT(*) 주문제품수, MIN(수량) 최소수량
    FROM 주문
    GROUP BY 주문고객;
    
--  제품테이블에서 제품을 2개이상 제조한 제조업체별로 제품의 개수와 가장 비싼 단가를 출력하시오.
SELECT 제조업체, COUNT(*) , MAX(단가)
    FROM 제품
    GROUP BY 제조업체 
    HAVING  COUNT(*)  >= 2;
    
--  고객 테이블에서 직업별 최고령자의 나이와 최연소자의 나이를 출력하시오.
SELECT *
    FROM 고객;

SELECT 직업, MAX(나이) 최고령자나이, MIN(나이) 최연소자나이
    FROM 고객
    GROUP BY 직업;
    
--  고객 테이블에서 적립금의 합계가 2,000원 이상인 직업별 최고령자의 나이와 최연소자의 나이를 출력하시오.
SELECT 직업,  MAX(나이) 최고령자나이, MIN(나이) 최연소자나이
    FROM 고객
    GROUP BY 직업
    HAVING SUM(적립금) >= 2000;
    
--  고객 테이블에서 적립금의 합계가 2,000원 미만인 직업별 최고령자의 나이와 최연소자의 나이를 출력하시오.
SELECT 직업,  MAX(나이) 최고령자나이, MIN(나이) 최연소자나이
    FROM 고객
    GROUP BY 직업
    HAVING SUM(적립금) < 2000;