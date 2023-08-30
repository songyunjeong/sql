--
-- Copyright (c) Status Code 200 Corporation 2023.  All Rights Reserved.
--
--  NAME
--    busanhanjan.sql
--
--  USAGE
--       SQL> START busanhanjan.sql
--
--

SET TERMOUT ON
PROMPT 부산한잔의 테이블을 생성합니다. Please wait.
SET TERMOUT OFF

DROP TABLE PUB;
DROP TABLE ALCOHOL;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';

-- PUB 테이블 생성
CREATE TABLE PUB
	(pno NUMBER(7) CONSTRAINT pub_pno_pk PRIMARY KEY,
	pname VARCHAR2(45) CONSTRAINT pub_pname_nn NOT NULL,
	place VARCHAR2(120) CONSTRAINT pub_place_nn NOT NULL,
	tel VARCHAR2(14) CONSTRAINT pub_tel_uq UNIQUE,
	plike NUMBER(4) DEFAULT 0 CONSTRAINT pub_plike_ck CHECK (plike BETWEEN 0 AND 9999),
	star NUMBER(5, 2) DEFAULT 0 CONSTRAINT pub_star_ck CHECK (star BETWEEN 1.00 AND 5.00),
	category VARCHAR2(15) CONSTRAINT pub_category_ck CHECK (category IN ('국산 맥주', '수입 맥주', '일반 소주', '와인', '위스키', '일반 증류주', '탁주', '과실주', '중국술', '사케', '브랜디', '리큐르', '전통소주', '청주', '기타 주류', '논알콜')),
	link VARCHAR2(255),
	homepage VARCHAR2(255)
);

-- PUB COLUMN SIZE
set linesize 350
set pagesize 50

col pno format 9999999
col pname format a25
col place format a50
col tel format a16
col plike format 9999
col star format 999.99
col category format a10
col link format a45
col homepage format a25

-- PUB 샘플 데이터
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (1, '몰틀리', '부산 금정구 금정로219번길 27 1층', '0507-1419-8823', NULL, 4.53, NULL, NULL, NULL);
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (2, '호맥', '부산 금정구 중앙대로1959번길 55', NULL, NULL, 4.59, NULL, NULL, 'http://www.ho-mac.com/');
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (3, '쉼, 어묵 그리고 한잔 술', '부산 금정구 금정로219번길 16', NULL, NULL, NULL, NULL, 'https://www.instagram.com/suimeomuk_guseo/', NULL);
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (4, '역전할머니맥주', '부산 금정구 금정로231번길 29', NULL, NULL, 4.7, NULL, NULL, NULL);
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (5, '옥수관', '부산 금정구 금강로 380번길 38 1층', '051-513-5999', NULL, 4.58, NULL, NULL, NULL);
INSERT INTO pub (pno, pname, place, tel, plike, star, category, link, homepage)
VALUES (6, '해리의 집', '해리의 집 부산 금정구 금정로219번길 14 구서동', '051-581-5586', NULL, NULL, NULL, NULL, NULL);

-- ALCOHOL 테이블 생성
CREATE TABLE alcohol (
    alcoholno NUMBER(7) PRIMARY KEY,
    category VARCHAR2(20) NOT NULL CHECK (category IN ('국산 맥주', '수입 맥주', '일반 소주', '와인', '위스키', '증류주', '탁주', '과실주', '중국술', '사케', '브랜디', '리큐르', '전통소주', '청주', '기타 주류', '논알콜')),
    aname VARCHAR2(45) NOT NULL,
    degree NUMBER(4, 2) CHECK (degree IS NULL OR (degree >= 0 AND degree < 100)),
    manufacturer VARCHAR2(60),
    rdate DATE,
    price NUMBER(10, 0) CHECK (price >= 0 AND price <= 99999999),
    link VARCHAR2(255)
);

-- ALCOHOL COLUMN SIZE
set linesize 350
set pagesize 50

col alcoholno format 9999999
col category format a10
col aname format a20
col degree format 99.99
col manufacturer format a15
col rdate format a10
col price format 9999999999
col link format a45

-- ALCOHOL 샘플 데이터
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (1, '탁주', '삼해주', 15, '선인양조', TO_DATE('2023-08-21', 'YYYY-MM-DD'), 30000, 'https://smartstore.naver.com/suninbrew/');
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (2, '청주', '소성주', 6, '인천탁주', TO_DATE('2023-08-21', 'YYYY-MM-DD'), 1300, 'https://sosungju.modoo.at/');
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (3, '과실주', '감귤주', 10, '시트러스', TO_DATE('2023-08-21', 'YYYY-MM-DD'), 8200, 'https://www.ehondiju.com/');
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (4, '증류주', '양촌 감 보드카', 32, '양촌감', TO_DATE('2023-08-21', 'YYYY-MM-DD'), 17000, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (5, '와인', '복숭아와인', 12, '솔티마을', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (6, '리큐르', '블링블링 바다별', 15, '영덕주조', NULL, NULL, 'https://ydjujo.co.kr/new/index.php');
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (7, '과실주', '오르또', 13.5, '오르또와이너리', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (8, '과실주', '뷰레떼라이트스파클링', 8, '애플린영농조합', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (9, '과실주', '머루와인', 12, '덕유양조', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (10, '과실주', '해1614', 12, '덕유양조', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (11, '과실주', '추시감와인', 12.5, '양촌감와이너리', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (12, '과실주', '레인보우', 12, '도란원', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (13, '과실주', '애플린', 12, '반딧불사과와인', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (14, '과실주', '딸기스파클링와인', 12, '해미읍성딸기와인', NULL, NULL, NULL);
INSERT INTO alcohol (alcoholno, category, aname, degree, manufacturer, rdate, price, link)
VALUES (15, '과실주', '애플블랑', 12, '예산사과와인', NULL, NULL, NULL);

COMMIT;

SET TERMOUT ON
PROMPT Status Code 200
PROMPT 부산한잔
PROMPT
PROMPT 테이블 생성이 완료되었습니다.