--접속유저의 모든 테이블 및 제약조건 삭제
DO $$ 
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;


--접속유저의 모든 시퀀스 삭제
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT sequence_name FROM information_schema.sequences WHERE sequence_schema = current_schema()) LOOP
        EXECUTE 'DROP SEQUENCE ' || quote_ident(r.sequence_name);
    END LOOP;
END $$;


--접속유저의 모든 뷰 삭제
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT table_name FROM information_schema.views WHERE table_schema = current_schema()) LOOP
        EXECUTE 'DROP VIEW ' || quote_ident(r.table_name);
    END LOOP;
END $$;

-- 접속 유저의 모든 트리거 삭제
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT trigger_name FROM information_schema.triggers WHERE trigger_schema = current_schema()) LOOP
        EXECUTE 'DROP TRIGGER ' || quote_ident(r.trigger_name) || ' ON ' || quote_ident(r.table_name);
    END LOOP;
END $$;
--------------------------------------------------------------------------
------------------------------ 테이블 생성 ---------------------------------
--------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    MEMBER_NO SERIAL PRIMARY KEY,
    MEMBER_EMAIL VARCHAR(100) NOT NULL UNIQUE,
    MEMBER_PWD VARCHAR(100) NOT NULL,
    MEMBER_NICKNAME VARCHAR(100) NOT NULL UNIQUE,
    MEMBER_PHONE VARCHAR(20) NOT NULL UNIQUE,
    MEMBER_GENDER VARCHAR(3) CHECK (MEMBER_GENDER IN ('M','F')),
    MEMBER_ADDRESS VARCHAR(500) NOT NULL,
    MEMBER_BIRTH VARCHAR(20) NOT NULL,
    MEMBER_PROFILE VARCHAR(2000) DEFAULT 'defaultUserImg.png' NULL,
    MEMBER_GRADE VARCHAR(20) DEFAULT '브론즈' NOT NULL,
    MEMBER_ENROLL_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
    MEMBER_MODIFY_DATE DATE NULL,
    MEMBER_STATUS CHAR(1) DEFAULT 'Y' CHECK (MEMBER_STATUS IN ('Y', 'N')) NOT NULL,
    ALARM_STATUS CHAR(1) DEFAULT 'Y' CHECK (ALARM_STATUS IN ('Y', 'N')),
    LOGIN_SIGN_PATH INTEGER CHECK (LOGIN_SIGN_PATH IN ('1','2','3') )NULL,
	ADMIN_STATUS CHAR(1) DEFAULT 'N' CHECK(ADMIN_STATUS IN ('Y','N')) 
);


COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원 번호';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NICKNAME IS '회원 닉네임';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '회원 전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_GENDER IS '회원 성별 남("M")/여("F")';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '회원 주소';
COMMENT ON COLUMN MEMBER.MEMBER_BIRTH IS '회원 생년월일';
COMMENT ON COLUMN MEMBER.MEMBER_PROFILE IS '사용자 프로필사진';
COMMENT ON COLUMN MEMBER.MEMBER_GRADE IS '회원 등급 : 브론즈 / 실버 / 골드 / 플레티넘/ 다이야';
COMMENT ON COLUMN MEMBER.MEMBER_ENROLL_DATE IS '회원가입 날짜';
COMMENT ON COLUMN MEMBER.MEMBER_MODIFY_DATE IS '탈퇴한 날짜';
COMMENT ON COLUMN MEMBER.MEMBER_STATUS IS '탈퇴 상태  ("Y" / "N" )';
COMMENT ON COLUMN MEMBER.ALARM_STATUS IS '알람 동의 상태 ( "Y" /  "N")';
COMMENT ON COLUMN MEMBER.LOGIN_SIGN_PATH IS '(1 : 네이버  /  2 : 카카오  /  3: 구글 )';

CREATE EXTENSION IF NOT EXISTS pgcrypto; 

INSERT INTO MEMBER (
    MEMBER_EMAIL, MEMBER_PWD, MEMBER_NICKNAME, MEMBER_PHONE, 
    MEMBER_ADDRESS, MEMBER_BIRTH, MEMBER_PROFILE, MEMBER_GRADE, 
    MEMBER_STATUS, ALARM_STATUS, ADMIN_STATUS
) VALUES (
    'admin@example.com', crypt('1234', gen_salt('bf')), 'admin', '1234567890', 
    '123 Street, City', '2000-01-01', 'user01.png', '브론즈', 
    'Y', 'Y','Y'
);
CREATE SEQUENCE SEQ_MEMNO;

-------------------------------------------------------------------------------------------
--냉장고식재료
CREATE TABLE REFRIGERATOR (
	REF_NO SERIAL PRIMARY KEY,	
	REF_THUMBNAIL VARCHAR(2000) NULL,
	REF_NAME VARCHAR(100) NOT NULL,
	REF_FRESH INTEGER DEFAULT 1 NOT NULL CHECK(REF_FRESH IN('1','2','3')),
	REF_CONSUMPTION_DATE DATE DEFAULT (CURRENT_DATE + INTERVAL '7 days') NOT NULL,	
	REF_COUNT NUMERIC DEFAULT 0 NOT NULL,	
	REF_INPUT_DATE DATE DEFAULT CURRENT_DATE NOT NULL,	
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NULL
);

COMMENT ON COLUMN REFRIGERATOR.REF_NO IS '회원 냉장고 번호';
COMMENT ON COLUMN REFRIGERATOR.REF_THUMBNAIL IS '식재료 썸네일사진';
COMMENT ON COLUMN REFRIGERATOR.REF_NAME IS '식재료 명';
COMMENT ON COLUMN REFRIGERATOR.REF_FRESH IS '식재료 신선도 : 신선 (1) / 보통(2) / 위험(3)';
COMMENT ON COLUMN REFRIGERATOR.REF_CONSUMPTION_DATE IS '식재료 소비기한';
COMMENT ON COLUMN REFRIGERATOR.REF_COUNT IS '식재료 개수';
COMMENT ON COLUMN REFRIGERATOR.REF_INPUT_DATE IS '식재료 냉장고 입고 날짜';
COMMENT ON COLUMN REFRIGERATOR.STATUS IS '식재료 유무상태 ("Y" / "N")';
	
CREATE SEQUENCE SEQ_REFNO;

--나의 냉장고 외래키 
ALTER TABLE REFRIGERATOR 
ADD COLUMN MEMBER_NO INTEGER, 
ADD CONSTRAINT FK_MEMBER_TO_REFRIGERATOR 
	FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) -- MEMBER 테이블의 MEMBER_NO 열을 참조
	ON DELETE CASCADE; --부모 테이블 삭제시 자식도 삭제 시킴


-------------------------------------------------------------------------------------------
--알림

create table notify (
	notify_no serial PRIMARY key,
	notify_isread BOOLEAN not null default false,
	notify_type INTEGER not null CHECK ( notify_type in ( '1', '2', '3', '4', '5')),
	notify_content varchar(255) not null,
	notify_create_at date default CURRENT_DATE,
	notify_member_no INTEGER not null
);

--알림 외래키
ALTER TABLE notify
ADD CONSTRAINT FK_MEMBER_TO_notify
	FOREIGN KEY (notify_member_no) REFERENCES MEMBER
	ON DELETE CASCADE;

COMMENT ON COLUMN notify.notify_type IS '좋아요 (1) / 댓글 (2) / 문의 (3) / 후기(4) / 소비기한(5)';


-------------------------------------------------------------------------------------------
--팔로워관계

CREATE TABLE FOLLOW(
	FOLLOWING_NO INTEGER NOT NULL,
	FOLLOWER_NO INTEGER NOT NULL,
	FOLLOW_DATE DATE DEFAULT CURRENT_DATE NOT NULL
);

COMMENT ON COLUMN FOLLOW.FOLLOWING_NO IS '팔로잉 번호';
COMMENT ON COLUMN FOLLOW.FOLLOWER_NO IS '팔로워 번호';
COMMENT ON COLUMN FOLLOW.FOLLOW_DATE IS '팔로잉, 팔로워 날짜';

--팔로워 외래키
ALTER TABLE FOLLOW
ADD CONSTRAINT FK_FOLLOWING_NO
FOREIGN KEY (FOLLOWING_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
ADD CONSTRAINT FK_FOLLOWER_NO
FOREIGN KEY (FOLLOWER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;


-------------------------------------------------------------------------------------------
--레시피

CREATE TABLE RECIPE(
	RCP_NO SERIAL PRIMARY KEY,
	RCP_TITLE VARCHAR(500) ,
	RCP_CONTENT VARCHAR(2000) ,
	RCP_VIDEO VARCHAR(1000) NULL,
	RCP_MAIN_PHOTO VARCHAR(1000) ,
	RCP_TAG VARCHAR(500) NULL,
	RCP_WRITE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	COOK_AMOUNT VARCHAR(20),
	COOK_TIME VARCHAR(20) ,
	COOK_KIND VARCHAR(50),
	COOK_LEVEL VARCHAR(3) ,
	RCP_VIEW NUMERIC DEFAULT 0 ,
	STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')) 
);

COMMENT ON COLUMN RECIPE.RCP_NO IS '레시피 글번호';
COMMENT ON COLUMN RECIPE.RCP_TITLE IS '레시피 글 제목';
COMMENT ON COLUMN RECIPE.RCP_CONTENT IS '레시피 소개';
COMMENT ON COLUMN RECIPE.RCP_VIDEO IS '레시피 동영상';
COMMENT ON COLUMN RECIPE.RCP_MAIN_PHOTO IS '대표 썸네일 사진';
COMMENT ON COLUMN RECIPE.RCP_TAG IS '태그';
COMMENT ON COLUMN RECIPE.RCP_WRITE_DATE IS '레시피 글 작성한 날짜';
COMMENT ON COLUMN RECIPE.COOK_AMOUNT IS '음식양';
COMMENT ON COLUMN RECIPE.COOK_TIME IS '요리 시간';
COMMENT ON COLUMN RECIPE.COOK_KIND IS '요리 종류';
COMMENT ON COLUMN RECIPE.COOK_LEVEL IS '요리 난이도';
COMMENT ON COLUMN RECIPE.RCP_VIEW IS '레시피 조회수';
COMMENT ON COLUMN RECIPE.STATUS IS '레시피 상태';

CREATE SEQUENCE SEQ_RCPNO;

ALTER TABLE RECIPE
	ADD COLUMN MEMBER_NO INTEGER,
	ADD CONSTRAINT FK_MEMBER_TO_RECIPE
	FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
	ON DELETE CASCADE;



-------------------------------------------------------------------------------------------
--조리순서 

CREATE TABLE COOK_ORDER(
	COOK_ORD_NO SERIAL PRIMARY KEY,
	COOK_ORD_CONTENT VARCHAR(1000) NOT NULL,
	COOK_ORD_PHOTO VARCHAR(1000) NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);


COMMENT ON COLUMN  COOK_ORDER.COOK_ORD_NO IS '요리순서 번호';
COMMENT ON COLUMN COOK_ORDER.COOK_ORD_CONTENT IS '요리순서내용';
COMMENT ON COLUMN COOK_ORDER.COOK_ORD_PHOTO IS '요리 손질사진';
COMMENT ON COLUMN COOK_ORDER.STATUS IS '상태';

CREATE SEQUENCE SEQ_CKONO;

ALTER TABLE COOK_ORDER
    ADD COLUMN RCP_NO INTEGER,
    ADD CONSTRAINT FK_RECIPE_TO_COOK_ORDER
    FOREIGN KEY (RCP_NO) REFERENCES RECIPE (RCP_NO)
    ON DELETE CASCADE;

-------------------------------------------------------------------------------------------
--요리추가 팁

CREATE TABLE COOK_TIP(
	COOK_TIP_NO SERIAL PRIMARY KEY,
	COOK_TIP_CONTENT VARCHAR(500),
	STATUS CHAR(1) DEFAULT  'Y' CHECK(STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN COOK_TIP.COOK_TIP_NO IS '추가 기능 번호';
COMMENT ON COLUMN COOK_TIP.STATUS IS '상태';

CREATE SEQUENCE SEQ_CKTNO;

ALTER TABLE COOK_TIP
    ADD COLUMN COOK_ORD_NO INTEGER,
    ADD CONSTRAINT FK_COOK_ORD_NO_TO_COOK_TIP
    FOREIGN KEY (COOK_ORD_NO) REFERENCES COOK_ORDER (COOK_ORD_NO)
    ON DELETE CASCADE;


-------------------------------------------------------------------------------------------
--재료 분류
CREATE TABLE DIVISION(
	DIV_NO SERIAL PRIMARY KEY,
	DIV_NAME VARCHAR(30) NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN DIVISION.DIV_NO IS '분류 번호';
COMMENT ON COLUMN DIVISION.DIV_NAME IS '분류 이름';
COMMENT ON COLUMN DIVISION.STATUS IS '분류 상태';

CREATE SEQUENCE SEQ_DIVNO;

ALTER TABLE DIVISION
    ADD COLUMN RCP_NO INTEGER,
    ADD CONSTRAINT FK_RECIPE_TO_DIVISION
    FOREIGN KEY (RCP_NO) REFERENCES RECIPE (RCP_NO)
    ON DELETE CASCADE;


-------------------------------------------------------------------------------------------
--재료 정보

CREATE TABLE INGREDIENTS_INFO(
	INGRE_NO SERIAL PRIMARY KEY,
	INGRE_NAME VARCHAR(50) NOT NULL,
	INGRE_AMOUNT NUMERIC NOT NULL,
	INGRE_UNIT VARCHAR(20) NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN INGREDIENTS_INFO.INGRE_NO IS '재료 정보번호';
COMMENT ON COLUMN INGREDIENTS_INFO.INGRE_NAME IS '재료 이름';
COMMENT ON COLUMN INGREDIENTS_INFO.INGRE_AMOUNT IS '재료 수량';
COMMENT ON COLUMN INGREDIENTS_INFO.INGRE_UNIT IS '재료 단위';
COMMENT ON COLUMN INGREDIENTS_INFO.STATUS IS '재료정보 상태';

CREATE SEQUENCE SEQ_INGRENO;

ALTER TABLE INGREDIENTS_INFO
    ADD COLUMN DIV_NO INTEGER,
    ADD CONSTRAINT FK_DIVISION_TO_INGREDIENTS_INFO
    FOREIGN KEY (DIV_NO) REFERENCES DIVISION (DIV_NO)
    ON DELETE CASCADE;


-------------------------------------------------------------------------------------------
--상품

CREATE TABLE PRODUCT(
	PRODUCT_NO SERIAL PRIMARY KEY,
	SELLER VARCHAR(500) NOT NULL,
	CATEGORY VARCHAR(1000) NULL,
	PRODUCT_NAME VARCHAR(1000) NOT NULL,
	PRODUCT_BRAND VARCHAR(255) NOT NULL,
	NORMAL_PRICE NUMERIC NOT NULL,
	SALE_PRICE NUMERIC NOT NULL,
	DISCOUNT NUMERIC NOT NULL,
	MAIN_IMG VARCHAR(1000) NOT NULL,
	DESCRIPTION VARCHAR(5000) NOT NULL,
	SHIPMENT_TYPE VARCHAR(50) NOT NULL,
	SHIPMENT_TIME NUMERIC NOT NULL,
	SHIPPING_PRICE NUMERIC NOT NULL,
	PRODUCT_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	PRODUCT_VIEW NUMERIC DEFAULT 0,
	SCRAP_COUNT NUMERIC DEFAULT 0,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '상품 번호';
COMMENT ON COLUMN PRODUCT.SELLER IS '판매자';
COMMENT ON COLUMN PRODUCT.CATEGORY IS '상품 카테고리';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '상품명';
COMMENT ON COLUMN PRODUCT.PRODUCT_BRAND IS '상품 브랜드';
COMMENT ON COLUMN PRODUCT.NORMAL_PRICE IS '상품 정상가';
COMMENT ON COLUMN PRODUCT.SALE_PRICE IS '상품 판매가';
COMMENT ON COLUMN PRODUCT.DISCOUNT IS '상품 할인율';
COMMENT ON COLUMN PRODUCT.MAIN_IMG IS '상품 대표이미지';
COMMENT ON COLUMN PRODUCT.DESCRIPTION IS '상품 상세설명';
COMMENT ON COLUMN PRODUCT.SHIPMENT_TYPE IS '배송 방법';
COMMENT ON COLUMN PRODUCT.SHIPMENT_TIME IS '배송 기간';
COMMENT ON COLUMN PRODUCT.SHIPPING_PRICE IS '배송비';
COMMENT ON COLUMN PRODUCT.PRODUCT_DATE IS '상품생성일';
COMMENT ON COLUMN PRODUCT.SHIPPING_PRICE IS '조회수';
COMMENT ON COLUMN PRODUCT.PRODUCT_VIEW IS '스크랩수';
COMMENT ON COLUMN PRODUCT.STATUS IS '상품 상태';

CREATE SEQUENCE SEQ_PRODUCTNO;


-------------------------------------------------------------------------------------------
--주문

CREATE TABLE ORDERS(
	ORDER_NO SERIAL PRIMARY KEY,
	FINAL_PRICE NUMERIC NOT NULL,
	ORDER_MEMO VARCHAR(1000) NULL,
	PAYMENT_TYPE VARCHAR(50) NOT NULL,
	ORDER_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	buyer_name varchar(50) NOT NULL,
	buyer_email varchar(1000) NOT NULL,
	buyer_phone varchar(20) NOT NULL,
	recipient_name varchar(50) NOT NULL,
	recipient_address varchar(1000) NOT NULL,
	recipient_phone varchar(20) NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN ORDERS.ORDER_NO IS '주문 번호';
COMMENT ON COLUMN ORDERS.FINAL_PRICE IS '최종 결제 금액';
COMMENT ON COLUMN ORDERS.ORDER_MEMO IS '요청사항';
COMMENT ON COLUMN ORDERS.PAYMENT_TYPE IS '결재 수단';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문일자';
COMMENT ON COLUMN ORDERS.buyer_name IS '주문자 성명';
COMMENT ON COLUMN ORDERS.buyer_email IS '주문자 이메일';
COMMENT ON COLUMN ORDERS.buyer_phone IS '주문자 전화번호';
COMMENT ON COLUMN ORDERS.recipient_name IS '수령자 성명';
COMMENT ON COLUMN ORDERS.recipient_address IS '수령자  주소';
COMMENT ON COLUMN ORDERS.recipient_phone IS '수령자 전화번호';
COMMENT ON COLUMN ORDERS.STATUS IS '주문 상태';


ALTER TABLE ORDERS
	 ADD COLUMN MEMBER_NO INTEGER,
    ADD CONSTRAINT FK_MEMBER_TO_ORDERS
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
    ON DELETE CASCADE;

CREATE SEQUENCE SEQ_ORDERSNO;


-------------------------------------------------------------------------------------------
--상품 옵션 소분류
CREATE TABLE OPTION_NAME(
	OPTIONS_NAME_NO SERIAL PRIMARY KEY,
	OPTIONS_NAME VARCHAR(255) NOT NULL,
	MAIN_OPTION BOOLEAN NOT NULL,
	OPTIONS_NORMAL_PRICE NUMERIC NOT NULL,
	OPTIONS_SALE_PRICE NUMERIC NOT NULL,
	OPTIONS_STOCK NUMERIC NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN OPTION_NAME.OPTIONS_NAME_NO IS '옵션소분류번호';
COMMENT ON COLUMN OPTION_NAME.OPTIONS_NAME IS '옵션 소분류명';
COMMENT ON COLUMN OPTION_NAME.MAIN_OPTION IS '대표옵션';
COMMENT ON COLUMN OPTION_NAME.OPTIONS_STOCK IS '재고량';
COMMENT ON COLUMN OPTION_NAME.OPTIONS_NORMAL_PRICE IS '정상가';
COMMENT ON COLUMN OPTION_NAME.OPTIONS_SALE_PRICE IS '판매가';
COMMENT ON COLUMN OPTION_NAME.STATUS IS '상태( "Y" / "N" )';

CREATE SEQUENCE SEQ_OPTION_NAMENO;

ALTER TABLE OPTION_NAME
    ADD COLUMN PRODUCT_NO INTEGER,
    ADD CONSTRAINT FK_PRODUCT_TO_OPTION_NAME
	FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
	ON DELETE CASCADE;
-------------------------------------------------------------------------------------------
--장바구니

CREATE TABLE PRODUCT_CART(
	OPTION_QUANTITY NUMERIC NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN PRODUCT_CART.STATUS IS '장바구니 상태 ( "Y" / "N" )';

ALTER TABLE PRODUCT_CART
    ADD COLUMN MEMBER_NO INTEGER,
	   ADD COLUMN OPTIONS_NAME_NO INTEGER,
    ADD CONSTRAINT FK_MEMBER_TO_PRODUCT_CART
        FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
        ON DELETE CASCADE,
	 ADD CONSTRAINT FK_OPTIONS_NAME_NO_TO_PRODUCT_CART
        FOREIGN KEY (OPTIONS_NAME_NO) REFERENCES OPTION_NAME (OPTIONS_NAME_NO)
        ON DELETE CASCADE,
    ADD CONSTRAINT PK_PRODUCT_CART 
        PRIMARY KEY (MEMBER_NO,OPTIONS_NAME_NO);

-------------------------------------------------------------------------------------------
--주문 상품 옵션
CREATE TABLE ORDER_PDOPT(
	QUANTITY NUMERIC NOT NULL,
	ORDER_PDOPT_PRICE NUMERIC NOT NULL
);

COMMENT ON COLUMN ORDER_PDOPT.QUANTITY IS '수량';

ALTER TABLE ORDER_PDOPT
    ADD COLUMN ORDER_NO INTEGER,
    ADD COLUMN OPTIONS_NAME_NO INTEGER,
    ADD CONSTRAINT FK_ORDERS_TO_ORDER_PDOPT
        FOREIGN KEY (ORDER_NO) REFERENCES ORDERS (ORDER_NO)
        ON DELETE CASCADE,
    ADD CONSTRAINT FK_OPTIONS_NAME_TO_ORDER_PDOPT
        FOREIGN KEY (OPTIONS_NAME_NO) REFERENCES OPTION_NAME (OPTIONS_NAME_NO)
        ON DELETE CASCADE,
    ADD CONSTRAINT PK_PRODUCT_OPTIONS 
        PRIMARY KEY (ORDER_NO, OPTIONS_NAME_NO);


---------------------------------------------------------------------------------------------
--게시글
CREATE TABLE BOARD(
	BOARD_NO SERIAL PRIMARY KEY,
	 BOARD_TITLE VARCHAR(100) NOT NULL,
	 BOARD_CONTENT VARCHAR(5000) NOT NULL,
	 BOARD_CREATE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	 BOARD_VIEWS NUMERIC  DEFAULT 0 NOT NULL,
	 BOARD_TAG VARCHAR(255) NULL,
	 BOARD_VOTE NUMERIC DEFAULT 0 NOT NULL, 
	 BOARD_THUMBNAIL VARCHAR(2000) NOT NULL,
	 STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL 
 );

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글 제목';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '게시글 내용';
COMMENT ON COLUMN BOARD.BOARD_CREATE_DATE IS '게시글 작성일';
COMMENT ON COLUMN BOARD.BOARD_VIEWS IS '게시글 조회수';
COMMENT ON COLUMN BOARD.BOARD_TAG IS '태그';
COMMENT ON COLUMN BOARD.BOARD_VOTE IS '추천수(좋아요)';
COMMENT ON COLUMN BOARD.BOARD_THUMBNAIL IS '대표이미지';
COMMENT ON COLUMN BOARD.STATUS IS '게시글 상태 ( "Y" / "N"  )';

CREATE SEQUENCE SEQ_BOARDNO;

ALTER TABLE BOARD 
ADD COLUMN MEMBER_NO INTEGER, 
ADD CONSTRAINT FK_MEMBER_TO_BOARD
	FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) 
	ON DELETE CASCADE;

---------------------------------------------------------------------------------------------
--신고
CREATE TABLE REPORT(
	REPORT_NO SERIAL PRIMARY KEY,
	REPORT_WHY VARCHAR(100) NOT NULL,
	REPORT_CONTENT VARCHAR(1000) NOT NULL
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고 번호';
COMMENT ON COLUMN REPORT.REPORT_WHY IS '신고 사유';
COMMENT ON COLUMN REPORT.REPORT_CONTENT IS '신고 상세내용';

CREATE SEQUENCE SEQ_REPORTNO;

ALTER TABLE REPORT
ADD COLUMN BOARD_NO INTEGER,
ADD COLUMN MEMBER_NO INTEGER,
ADD CONSTRAINT FK_BOARD_TO_REPORT
FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_MEMBER_TO_REPORT
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
ON DELETE CASCADE;
	
---------------------------------------------------------------------------------------------
--게시글 미디어
CREATE TABLE MEDIA(
	MEDIA_NO SERIAL PRIMARY KEY,
	MEDIA_TYPE NUMERIC NOT NULL CHECK(MEDIA_TYPE IN ('1','2')),
	MEDIA_KIND NUMERIC NOT NULL CHECK(MEDIA_KIND IN ('1','2','3')),
	FILE_PATH VARCHAR(1000) NOT NULL,
	UPLOAD_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	ORIGIN_NAME VARCHAR(255) NOT NULL,
	CHANGE_NAME VARCHAR(255) NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL 
);

COMMENT ON COLUMN MEDIA.MEDIA_NO IS '미디어 번호';
COMMENT ON COLUMN MEDIA.MEDIA_TYPE IS '미디어 타입: 사진(1) / 동영상(2)'; 
COMMENT ON COLUMN MEDIA.MEDIA_KIND IS '미디어 구분: 레시피 작성(1)  /  상품소개(2) / 자유게시판 (3)';
COMMENT ON COLUMN MEDIA.FILE_PATH IS '저장경로';
COMMENT ON COLUMN MEDIA.UPLOAD_DATE IS '업로드일시';
COMMENT ON COLUMN MEDIA.ORIGIN_NAME IS '파일 원본명';
COMMENT ON COLUMN MEDIA.CHANGE_NAME IS '파일 수정명';
COMMENT ON COLUMN MEDIA.STATUS IS '미디어 상태 ( "Y" / "N"  )';

CREATE SEQUENCE SEQ_MEDIANO;

ALTER TABLE MEDIA
ADD COLUMN BOARD_NO INTEGER NULL,
ADD COLUMN PRODUCT_NO INTEGER NULL,
ADD COLUMN RCP_NO INTEGER NULL,
ADD CONSTRAINT FK_BOARD_TO_MEDIA
FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_MEDIA
FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
ON DELETE CASCADE,	
ADD CONSTRAINT FK_RECIPE_TO_MEDIA
FOREIGN KEY (RCP_NO) REFERENCES RECIPE (RCP_NO)
ON DELETE CASCADE;

---------------------------------------------------------------------------------------------
--댓글
CREATE TABLE COMMENTS(
	COMMENT_NO SERIAL PRIMARY KEY,
	COMMENT_CONTENT VARCHAR(500) NOT NULL,
	COMMENT_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	COMMENT_ANSWER_TYPE NUMERIC NOT NULL CHECK(COMMENT_ANSWER_TYPE IN ('1','2')),
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL 
);

COMMENT ON COLUMN COMMENTS.COMMENT_NO IS '댓글질답 번호';
COMMENT ON COLUMN COMMENTS.COMMENT_CONTENT IS '댓글 내용';
COMMENT ON COLUMN COMMENTS.COMMENT_DATE IS '댓글 작성일';
COMMENT ON COLUMN COMMENTS.COMMENT_ANSWER_TYPE IS '댓글(1) 답변(2)';
COMMENT ON COLUMN COMMENTS.STATUS IS '댓글 상태 ';

CREATE SEQUENCE SEQ_COMMENTSNO;

ALTER TABLE COMMENTS
ADD COLUMN BOARD_NO INTEGER,
ADD COLUMN REF_COMMENT_NO INTEGER NULL,
ADD COLUMN MEMBER_NO INTEGER,
ADD CONSTRAINT FK_BOARD_TO_COMMENTS
FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_COMMENTS_TO_COMMENTS
FOREIGN KEY (REF_COMMENT_NO) REFERENCES COMMENTS (COMMENT_NO) 
ON DELETE CASCADE,  
ADD CONSTRAINT FK_MEMBER_TO_COMMENTS
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
ON DELETE CASCADE;


-----------------------------------------------------------------------
--질의 응답
CREATE TABLE QNA(
	QNA_NO SERIAL PRIMARY KEY,
	QNA_CONTENT VARCHAR(500) NOT NULL,
	QNA_CREATE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	QNA_TYPE NUMERIC NOT NULL CHECK(QNA_TYPE IN ('1','2')),
	QNA_ANSWER_TYPE NUMERIC NOT NULL CHECK(QNA_ANSWER_TYPE IN ('1','2')),
	QNA_PHOTO VARCHAR(1000) NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL 
);

COMMENT ON COLUMN QNA.QNA_NO IS '질답 번호';
COMMENT ON COLUMN QNA.QNA_CONTENT IS '문의 내용';
COMMENT ON COLUMN QNA.QNA_CREATE_DATE IS '문의 작성일';
COMMENT ON COLUMN QNA.QNA_TYPE IS '문의 종류: 상품 (1)/ 레시피(2)';
COMMENT ON COLUMN QNA.QNA_ANSWER_TYPE IS 'QNA 종류: 질문 (1)/ 답변(2)';
COMMENT ON COLUMN QNA.QNA_PHOTO IS '첨부사진';
COMMENT ON COLUMN QNA.STATUS IS '질답 상태';

CREATE SEQUENCE SEQ_QNANO;

ALTER TABLE QNA
ADD COLUMN REF_QNA_NO INTEGER NULL,
ADD COLUMN RCP_NO INTEGER,
ADD COLUMN PRODUCT_NO INTEGER,
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN PDOPT_NO INTEGER,
ADD CONSTRAINT FK_QNA_TO_QNA
FOREIGN KEY (REF_QNA_NO) REFERENCES QNA (QNA_NO) 
ON DELETE CASCADE,  
ADD CONSTRAINT FK_RECIP_TO_QNA
FOREIGN KEY (RCP_NO) REFERENCES RECIPE (RCP_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_QNA
FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_MEMBER_TO_QNA
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_OPTION_NAME_TO_QNA
FOREIGN KEY (PDOPT_NO) REFERENCES OPTION_NAME (OPTIONS_NAME_NO)
ON DELETE CASCADE;

---------------------------------------------------------------------------------------------
--후기
CREATE TABLE REVIEW(
	REVIEW_NO SERIAL PRIMARY KEY,
	REVIEW_CONTENT VARCHAR(500) NOT NULL,
	REVIEW_CREATE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	RATING NUMERIC NOT NULL,
	REVIEW_PHOTO VARCHAR(1000) NOT NULL,
	REVIEW_TYPE	NUMERIC CHECK(REVIEW_TYPE IN (1,2)) NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL 
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '후기 번호';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '후기 내용';
COMMENT ON COLUMN REVIEW.REVIEW_CREATE_DATE IS '후기 작성일';
COMMENT ON COLUMN REVIEW.RATING IS '평점';
COMMENT ON COLUMN REVIEW.REVIEW_PHOTO IS '첨부사진';
COMMENT ON COLUMN REVIEW.REVIEW_TYPE IS '후기 종류(1번 제품 2번 레시피)';
COMMENT ON COLUMN REVIEW.STATUS IS '상태';

CREATE SEQUENCE SEQ_REVIEWNO;

ALTER TABLE REVIEW
ADD COLUMN RCP_NO INTEGER,
ADD COLUMN PRODUCT_NO INTEGER,
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN PDOPT_NO INTEGER,
ADD CONSTRAINT FK_RECIPE_TO_REVIEW
FOREIGN KEY (RCP_NO) REFERENCES RECIPE (RCP_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_REVIEW
FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_MEMBER_TO_REVIEW
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_OPTION_NAME_TO_REVIEW
FOREIGN KEY (PDOPT_NO) REFERENCES OPTION_NAME (OPTIONS_NAME_NO)
ON DELETE CASCADE;


-------------------------------------------------------------------------------------------
--스크랩 게시글
CREATE TABLE SCRAP_BOARD(
	SCRAP_BOARD_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);
COMMENT ON COLUMN SCRAP_BOARD.SCRAP_BOARD_DATE IS '스크랩 일';
COMMENT ON COLUMN SCRAP_BOARD.STATUS IS '스크랩 상태';

ALTER TABLE SCRAP_BOARD
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN BOARD_NO INTEGER,
ADD CONSTRAINT FK_MEMBER_TO_SCRAP_BOARD
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_BOARD_TO_SCRAP_BOARD
FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_SCRAP_BOARD 
PRIMARY KEY (MEMBER_NO, BOARD_NO);


-------------------------------------------------------------------------------------------
--스크랩 상품
CREATE TABLE SCRAP_PRODUCT(
	SCRAP_PRODUCT_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);
COMMENT ON COLUMN SCRAP_PRODUCT.SCRAP_PRODUCT_DATE IS '스크랩 일';
COMMENT ON COLUMN SCRAP_PRODUCT.STATUS IS '스크랩 상태';

ALTER TABLE SCRAP_PRODUCT
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN PRODUCT_NO INTEGER,
ADD CONSTRAINT FK_MEMBER_TO_SCRAP_PRODUCT
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_SCRAP_PRODUCT
FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_SCRAP_PRODUCT
PRIMARY KEY (MEMBER_NO, PRODUCT_NO);


-------------------------------------------------------------------------------------------
--스크랩 레시피
CREATE TABLE SCRAP_RECIPE(
	SCRAP_RECIPE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);
COMMENT ON COLUMN SCRAP_RECIPE.SCRAP_RECIPE_DATE IS '스크랩 일';
COMMENT ON COLUMN SCRAP_RECIPE.STATUS IS '스크랩 상태';	

ALTER TABLE SCRAP_RECIPE
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN RCP_NO INTEGER,
ADD CONSTRAINT FK_MEMBER_TO_SCRAP_RECIPE
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_SCRAP_RECIPE
FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_SCRAP_RECIPE
PRIMARY KEY (MEMBER_NO, RCP_NO);


-------------------------------------------------------------------------------------------
--좋아요 게시글
CREATE TABLE LIKE_BOARD	(
	LIKE_BOARD_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);
COMMENT ON COLUMN LIKE_BOARD.LIKE_BOARD_DATE IS '좋아요일';
COMMENT ON COLUMN LIKE_BOARD.STATUS IS '좋아요 상태';

ALTER TABLE LIKE_BOARD
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN BOARD_NO INTEGER,
ADD CONSTRAINT FK_MEMBER_TO_LIKE_BOARD
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_BOARD_TO_LIKE_BOARD
FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_LIKE_BOARD
PRIMARY KEY (MEMBER_NO, BOARD_NO);
	
-------------------------------------------------------------------------------------------
--좋아요 레시피
CREATE TABLE LIKE_RECIPE(
	LIKE_RECIPE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN LIKE_RECIPE.LIKE_RECIPE_DATE IS '좋아요일';
COMMENT ON COLUMN LIKE_RECIPE.STATUS IS '좋아요 상태';

ALTER TABLE LIKE_RECIPE
ADD COLUMN MEMBER_NO INTEGER,
ADD COLUMN RCP_NO INTEGER,
ADD CONSTRAINT FK_MEMBER_TO_LIKE_RECIPE
FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_PRODUCT_TO_LIKE_RECIPE
FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_LIKE_RECIPE
PRIMARY KEY (MEMBER_NO, RCP_NO);


-------------------------------------------------------------------------------------------
--레시피_추천 상품카테고리

CREATE TABLE RECIPE_PRODUCT_CATEGORY(
	STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')) NOT NULL
);
	
COMMENT ON COLUMN RECIPE_PRODUCT_CATEGORY.STATUS IS '레시피_추천 상품카테고리 상태';

ALTER TABLE RECIPE_PRODUCT_CATEGORY
ADD COLUMN PRODUCT_NO INTEGER,
ADD COLUMN RCP_NO INTEGER,
ADD CONSTRAINT FK_PRODUCT_TO_LIKE_RECIPE
FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO)
ON DELETE CASCADE,
ADD CONSTRAINT FK_RECIPE_TO_LIKE_RECIPE
FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
ON DELETE CASCADE,
ADD CONSTRAINT PK_RECIPE_PRODUCT_CATEGORY
PRIMARY KEY (PRODUCT_NO , RCP_NO);



-------------------------------------------------------------------------------------------------------------
------------------------------------------------------트리거--------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- CREATE OR REPLACE FUNCTION update_ingredients_status_after_division_delete()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     UPDATE INGREDIENTS_INFO
--     SET status = 'N'
--     WHERE div_no = OLD.div_no;

--     RETURN OLD;
-- END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER trigger_update_ingredients_status
-- AFTER DELETE ON DIVISION
-- FOR EACH ROW
-- EXECUTE FUNCTION update_ingredients_status_after_division_delete();

-- COMMIT;



----------------------------------------------------------------------------------------------
-----------------------------------------Insert ----------------------------------------------
-- 멤버추가--
-- (1번은 관리자입니다)
INSERT INTO MEMBER (
    MEMBER_EMAIL, MEMBER_PWD, MEMBER_NICKNAME, MEMBER_PHONE, 
    MEMBER_ADDRESS, MEMBER_BIRTH, MEMBER_GRADE, 
    MEMBER_STATUS, ALARM_STATUS, ADMIN_STATUS
) VALUES 
    ('kangsan1023@naver.com', crypt('1234', gen_salt('bf')), '이강산', '01052622263', '서울 강남구 강남대로 320 310호', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('odg@gorang.com', crypt('1234', gen_salt('bf')), 'odg', '01044443333', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('gkadbcjf@naver.com', crypt('1234', gen_salt('bf')), 'gkadbcjf', '1234562791', '서울 은평구 갈현로3나길 22 센트레빌', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),   
   
   ('user01@example.com', crypt('1234', gen_salt('bf')), 'user01', '1234567891', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user02@example.com', crypt('1234', gen_salt('bf')), 'user02', '1234567892', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user03@example.com', crypt('1234', gen_salt('bf')), 'user03', '1234567893', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user04@example.com', crypt('1234', gen_salt('bf')), 'user04', '1234567894', '123 Street, City', '2000-01-01', '브론즈', 'Y', 'Y', 'Y'),
    ('user05@example.com', crypt('1234', gen_salt('bf')), 'user05', '1234567895', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user06@example.com', crypt('1234', gen_salt('bf')), 'user06', '1234567896', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user07@example.com', crypt('1234', gen_salt('bf')), 'user07', '1234567897', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user08@example.com', crypt('1234', gen_salt('bf')), 'user08', '1234567898', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user09@example.com', crypt('1234', gen_salt('bf')), 'user09', '1234567899', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user10@example.com', crypt('1234', gen_salt('bf')), 'user10', '1234567800', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user11@example.com', crypt('1234', gen_salt('bf')), 'user11', '1234567801', '123 Street, City', '2000-01-01', '브론즈', 'Y', 'Y', 'Y'),
    ('user12@example.com', crypt('1234', gen_salt('bf')), 'user12', '1234567802', '123 Street, City', '2000-01-01', '브론즈', 'Y', 'Y', 'Y'),
    ('user13@example.com', crypt('1234', gen_salt('bf')), 'user13', '1234567803', '123 Street, City', '2000-01-01', '브론즈', 'Y', 'Y', 'Y'),
    ('user14@example.com', crypt('1234', gen_salt('bf')), 'user14', '1234567804', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user15@example.com', crypt('1234', gen_salt('bf')), 'user15', '1234567805', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user16@example.com', crypt('1234', gen_salt('bf')), 'user16', '1234567806', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user17@example.com', crypt('1234', gen_salt('bf')), 'user17', '1234567807', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user18@example.com', crypt('1234', gen_salt('bf')), 'user18', '1234567808', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user19@example.com', crypt('1234', gen_salt('bf')), 'user19', '1234567809', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y'),
    ('user20@example.com', crypt('1234', gen_salt('bf')), 'user20', '1234567810', '123 Street, City', '2000-01-01',  '브론즈', 'Y', 'Y', 'Y');

-- 상품 --
INSERT INTO public.product(
   seller,category, product_name, product_brand,
   normal_price, sale_price, discount, main_img, description,
   shipment_type, shipment_time, shipping_price
) VALUES 
	('과일의 왕','#과일#성주#참외', '성주 참외 꿀참외 1.5kg', '성주', 30000, 24000, 20, 'item1.png',
   '경북 성주는 풍부한 일조량, 물 빠짐이 좋은 미사질 토양을 지녀 참외를 재배하기에 최적의 조건을 갖춘 곳인데요. 참외가 참 신선하고 맛이 좋다 싶으면 역시나 성주에서 온 참외이곤 하지요. 과실이 통통하게 잘 여문 향긋한 성주 참외를 온 가족이 함께 즐길 수 있는 양으로 담아 준비했어요. 시원한 냉장고 혹은 찬물에 잠시 두었다가 꺼내 먹으면, 참외의 달콤한 향이 더욱 선명하게 느껴질 거예요. 아삭아삭한 식감, 함뿍 배어 나오는 달큰한 과즙을 그대로 음미해 보세요.', '일반 택배배송', 2, 1000),
	('고랭지 사과','#과일#사과#고랭지#부사', '고랭지 부사 사과 1.3kg(4~5입)', '고랭지', 24900, 22900, 5, '과일1.jpeg',
   '고랭지의 기온차를 견디고 자라 빨갛게 잘 익은 부사 사과를 만나보세요.  맛좋기로 유명한 부사사과를 준비했어요. 과육이 단단하고 신맛과 단맛의 균형이 조화로워 인기가 많은 품종이지요. 국내 농가에서 정성스레 길러 한 두번에 나눠 먹기 좋은 양으로 담았는데요. 식후나 디저트로 남김없이 즐기기 좋은 사이즈랍니다. 잘 여문 사과 한 알로 달콤한 즐거움을 누려보세요.', '일반 택배배송', 2, 1000),
    ('제스프리 키위','#과일#키위#제스프리#골드#뉴질랜드', '[제스프리] 뉴질랜드 골드키위 1.1kg (8~10입) (후숙필요)', '제스프리', 14900, 13410, 10, '과일2.jpg',
   '뉴질랜드의 따스한 햇살 아래, 달콤하게 무르익은 골드키위를 만나보세요. 농장에서부터 선별, 유통까지, 세계적인 키위 브랜드 제스프리의 깐깐한 품질 관리를 거친 키위랍니다. 
	반으로 잘라 숟가락으로 떠먹으면, 촉촉하고 상큼한 과즙이 입안 가득 맴돌지요. 비타민C, 엽산, 식이섬유 등이 풍부해, 영양소까지 섭취할 수 있답니다. 털이 적어 매끄럽고, 손질까지 편리하니 제스프리 골드키위로 달콤한 디저트 타임을 만끽해 보세요.', '일반 택배배송', 2, 1000),
    ('[Dole]','#과일#바나나#스위티오#고랭지#Dole', '[Dole] 스위티오 바나나 1kg', 'Dole', 5190, 4930, 10, '과일3.jpeg',
   '스위티오는 Dole이 생산하는 바나나 중에서도 가장 품질이 뛰어나고 당도가 높은 것만을 선별해 붙여주는 이름이에요. 이 이름을 얻기 위해서는 바나나가 자라는 환경부터 달라야 합니다. 스위티오 바나나는 필리핀 해발 600m 이상의 고산지대에 위치한 농장에서 재배돼요. 저지대에 있는 농장에 비해 평균 기온이 낮기 때문에 과육에 수분이 적고 쫀득한 식감을 갖게 되지요. 일반 바나나보다 재배 기간이 5개월~8개월 이상 긴 것도 특징이에요. 광합성을 오래 하는 만큼 더 진한 달콤함을 머금고 있습니다. 꼼꼼한 선별을 통해 선택된 스위티오 바나나는 한국 전용선박과 부두를 통해 들여와 신선함을 유지하고 있어요. Dole이 자랑하는 맛있는 바나나를 만나보세요.', 
	'일반 택배배송', 2, 1000),
	('[Dole]','#과일#아보카도#펠루#고랭지#Dole', '[Dole] 아보카도 1kg (5~7입)', 'Dole', 30000, 24000, 20, '과일4.jpg',
   '부드럽고 고소한 아보카도 과육은 마치 싱그러운 버터를 한 입 베어 문 것 같은 착각에 빠지게 만들어요. 울퉁불퉁하고 투박한 겉모습과 달리, 반을 가르면 등장하는 매끄러운 과육과 동글동글한 씨앗이 눈길을 끌지요. 고품질 과일 브랜드 Dole에서 까다롭게 수확한 맛 좋은 아보카도를 준비했어요. 넉넉하게 담았으니 아보카도를 즐겨먹는 분이라면 더더욱 챙겨두세요. 샐러드, 비빔밥, 샌드위치 등 다양한 요리에 활용할 수 있는 만능 식재료이니까요. ',
	'일반 택배배송', 2, 1000),
    ('미국체리사장','#과일#체리#캘리포니아#미국', '미국산 캘리포니아 생체리 500g (10row)', '체리USA', 18000, 16200, 10, '과일5.jpg',
   '체리를 떠올리면 누구나 입안 가득 침이 고일 거예요. 기분 좋게 퍼지는 짙은 달콤함은 1년 중 맛볼 수 있는 날이 그리 길지 않아 만족스러움과 함께 아쉬움을 남긴답니다.  과일계의 다이아몬드라 불리는 체리 중에서도 한 입에 쏙 들어가는 크기의 캘리포니아 생체리를 선보일게요. 일조량이 풍부한 미국 서부 지역에서 수확하여 항공편을 통해 신선하게 수입한 제품이랍니다. 보석처럼 빛나는 달콤상큼한 체리 한 알로 즐거운 디저트 타임을 즐겨보세요.', 
	'일반 택배배송', 2, 1000),
	('아니농포도','#과일#포도#델라웨어#국산', '델라웨어 포도 200g', '델라웨어', 8900, 7900, 11, '과일6.jpg',
   '녹음이 우거지는 풍경 속, 가장 익숙한 과일이 있다면 그건 아마도 포도일 거예요. 평소 우리가 먹던 짙은 보랏빛의 포도와는 또 다른 매력을 가진 포도를 만나보세요. 작은 보석처럼 알알이 빛나는 포도, 델라웨어입니다. 검붉은빛 껍질이 얇고 씨가 없을 뿐더러, 자그마한 크기라 드시기에 참 편한데요. 앙증맞은 포도알에 자두향을 머금은 새콤함이 꽉 들어차 있답니다. 한 알씩 깨물어 드셔 보세요. 계절의 달콤함이 성큼 다가올 거예요.',
	'일반 택배배송', 2, 1000),	
	('과일의 왕','#과일#토마토#완숙#국산#성주#탱글탱글', '[KF365] 완숙토마토 2kg', '성주', 16000, 12800, 20, '과일7.jpg',
   '잘 익은 토마토는 썰어서 그대로 먹기만 해도 맛있어요. 붉은 과육은 조금 더 달아지고, 식감은 부드럽게 변합니다. 라이코펜이며 비타민, 베타카로틴이 풍부해 매일매일 꼭 챙겨 먹으면 좋은 영양 식재료가 바로 토마토인데요. 잘 익은 토마토를 잘 선별해 담아 냈습니다. 완숙토마토를 깨끗하게 씻은 후 올리브유를 뿌려 드셔보세요. 살사나 샐러드를 만들어도 맛있고, 볶음 등으로 활용해보셔도 좋아요.', '일반 택배배송', 2, 1000),
    ('카라농작물','#과일#카라#향긋#제주#국산', '산딸기 250g', '카라', 18000, 14400, 20, '과일8.jpg',
   '만감류의 풍성한 달콤함을 즐기는 분들을 위해  준비했어요. 1년 중 단 두 달만 만나볼 수 있는 귀한 과일, 카라향입니다. 처음엔 오돌토돌한 카라향의 껍질이 생소하게 보일 수 있는데요. 직접 먹어보면 그 진가를 알 수 있답니다. 산미가 적고 달콤한 맛이 일품일 뿐더러, 다른 만감류에 비해 껍질을 벗기기가 쉽다는 장점이 있지요. 대표적인 만감류 특산지, 제주에서 길러낸 과일이라 더욱 만족스럽고요. 달콤함과 수분까지 가득 담아낸 카라향으로, 이 계절의 제주를 만나보세요. ', '일반 택배배송', 2, 1000),
	('보석딸기 재배원','#과일#산#딸기#국산#보석', '성주 참외 꿀참외 1.5kg', '보석산딸기',16900, 14900, 11, '과일9.jpg',
   '알알이 붉은빛이 탐스런 산딸기는 과육이 연해 생과로 만나볼 기회가 흔치 않은데요. 먹음직스러운 크기에, 부드럽고 탱글한 외관을 자랑하는 산딸기를 만나보세요. 한 입에 쏙 넣어보면, 톡톡 씹히는 과육 사이로 특유의 새콤달콤함이 은은하게 배어나오죠. 아담한 양을 담아내, 끝까지 신선하게 즐길 수 있을 거예요. 가볍게 씻어 기분 좋은 상큼함을 누려보세요.', '일반 택배배송', 2, 1000),	
	('썬키스트','#과일#레몬#썬키스트#미국#팬시', '[썬키스트] 팬시 레몬 1kg (8-12입)', '썬키스트', 13000, 12350, 5, '과일10.jpg',
   '팡팡 터지는 새콤한 과즙을 머금은 레몬은 비타민의 보고라고 해도 과언이 아닌데요. 얇게 저민 레몬과 설탕을 차곡차곡 쌓아 만든 레몬청을 한 스푼 담고, 얼음과 탄산수를 부으면 청량한 레모네이드가 완성됩니다. 레몬 그 자체를 즐기는 방법으로는 레모네이드가 가장 먼저 떠오르지만, 사실 무척 활용도가 높은 과일이에요. 고기의 식감을 연하게 할 뿐만 아니라 해산물의 비린내를 잡아주고, 각종 쿠키 및 파이의 풍미도 근사하게 만들어 주죠.  신선한 레몬을 넉넉하게 담아 문 앞까지 전해드릴게요. 요리 못지않게 살림에도 많은 용도로 활용될 거예요.', '일반 택배배송', 2, 1000),	
	('스나노골드','#과일#사과#금#시나노골드#국산', '시나노골드 (금사과) 1.3kg (5~7입)', '골든킹', 25000, 23500, 6, '과일11.jpg',
   '홍옥이나 부사처럼 빨갛게 익어가는 사과가 있는가 하면, 노랗게 여무는 사과도 있어요. 금사과로도 불리는 시나노 골드는 처음 열매가 맺혔을 땐 연둣빛을 띠고 있지만, 시간이 지날수록 밝은 노란색으로 물들어 가지요. 아삭아삭한 식감과 수분감이 뛰어나고, 신맛과 단맛의 조화가 무척 훌륭한 사과랍니다. 향기는 또 어떨까요. 사과 본연의 존재감을 그대로 드러내듯, 기분 좋게 번지는 그윽한 향은 모자람이 없답니다.', '일반 택배배송', 2, 1000),
	('망고조아재배','#과일#망고#태국#냉장', '태국산 망고 600g (2입)', '태국망고장', 9900, 8910, 10, '과일12.jpeg',
   '고급스러운 단맛과 탱탱하고 진득한 식감으로 한 번 맛본 사람은 계속 먹게 된다는 열대과일 망고! 열대지방의 햇빛을 그대로 담아 황금빛 과육을 뽐내는 망고는 한 마디로 사랑입니다. 그중에서도 태국 망고로 불리는 남독마이는 깊고 부드러운 단맛으로 당도와 향이 뛰어나 세계적으로 인정받는 고급 품종이에요. 그래서 망고를 사랑하는 분들을 위해 맛 좋기로 유명한 태국 망고를 준비했습니다. 어떤 과일로도 채워지지 않는 허전함이 있다면 태국 망고 남독마이로 입안 가득 차오르는 향긋함과 달콤함을 즐겨보세요.', '일반 택배배송', 2, 1000),	
	('일론머스크과일장','#과일#멜론#머스크#국산', '[KF365] 머스크멜론 1.6kg', '화성전기', 15900, 14900, 6, '과일13.jpg',
   '멜론은 촉촉한 식감과 입안에 감도는 단맛으로 그만의 매력을 톡톡히 발산하는 과일이죠. 그중에서도 달콤한 맛과 향을 품은 머스크 멜론을  합리적인 가격으로 만나보세요. 국내 농가에서 정성스레 재배해 묵직하게 잘 익은 머스크 멜론이랍니다. 맛도 맛이지만 비타민C, 칼륨도 풍부하게 함유하고 있어 꾸준히 즐겨 찾는 분들도 계시죠. 과일 디저트는 물론이고, 시원한 빙수로 만들거나 하몽을 곁들여 근사한 안주로 즐겨도 좋을 거예요.', '일반 택배배송', 2, 1000),	
	('포도마루','#과일#경조정#유기농#청포도#초여름', '유기농 경조정 500g', '경조포도', 27900, 25900, 7, '과일14.jpg',
   '녹음이 우거지는 계절에 특히 생각나는 과일이 있습니다. 바로 ‘경조정’이라 불리는 청포도예요. 싱그러움이 번지는 연둣빛 색감, 속이 빤히 보일 만큼 얇고 투명한 껍질을 지녔죠. 비록 다른 포도보다 과실은 작은 편이지만, 깨무는 순간 퍼지는 풍성한 과즙은 여름의 생동감과 무척 닮아있습니다. 이른 새벽, 경북 군위에서 수확한 유기농 경조정을 풀콜드체인을 통해 문 앞까지 신선하게 전해드릴게요. 씨가 없고 식감도 부드러운 품종이니, 아이들 간식으로 가볍게 내어도 좋을 거예요.', '일반 택배배송', 2, 1000),
	('알뜰배재원','#과일#배#국산#유기농', '맛좋은 알뜰배 2kg (3~4입)', '알뜰배', 30000, 28500, 5, '과일15.jpg',
   '사각사각 시원한 과육 사이에 달고 개운한 과즙이 가득 들어찬 배, 호불호 없이 누구나 좋아하는 과일이지요. 요리에 단맛을 더하거나 육질을 연하게 할 때 쓰기도 하니, 그 활용도까지 무궁무진해요. 이번에는 외모는 조금 못났지만, 그 안에 들어찬 과육만큼은 맛이 참 좋은 알뜰배를 소개합니다. 작은 상처나 흠집, 울퉁불퉁한 모양과 얼룩 때문에, 달디단 과육을 보여주기도 전에 외면 받은 것들이에요. 손님 상에 내어 놓기에는 조금 민망할 수 있겠지요. 하지만 배즙, 김장, 갈비찜 등 요리에 활용하기에는 티끌만큼의 모자람도 없으니 장바구니에 기분 좋게 담아보세요.', '일반 택배배송', 2, 1000),
 	('새벽과일향','#과일#자몽#국산#웰빙#새벽', '자몽 900g (3입)', '샛별', 9000, 8100, 10, '과일16.jpg',
   '촉촉한 알갱이가 가득 차 있는 코랄빛 과육은 자몽 특유의 상큼함과 쌉싸름한 뒷맛을 품고 있는데요. 과즙, 수분뿐만 아니라 비타민도 풍부하게 들어있어 웰빙 과일로 꾸준한 인기를 누리고 있지요. 품질 좋은 자몽을 엄선하여 문 앞까지 전해드립니다. 생과 그 자체로 즐겨도 좋지만, 상큼한 에이드부터 오래 두고 먹기 좋은 자몽청까지 다양한 용도로 활용해 보세요. 자몽 과육을 썰어 넣은 샐러드는 입가심용 간편 메뉴로도 손색없을 거예요.', '일반 택배배송', 2, 1000),	
	('우리집과일','#과일#백도#국산#복숭아', '하우스 백도 복숭아 1.2kg 내외 (5~7입)', '하우스', 40000, 34000, 15, '과일17.jpg',
   '복숭아는 은은한 달콤함과 남다른 수분감을 뽐내는 여름 대표 과일이지요.  국내 하우스에서 정성스레 재배한 백도 복숭아를 선보입니다. 온도, 물 등 복숭아의 품질에 영향을 미치는 조건을 엄격하게 체크해가며 길러냈지요. 겉 붉고 속은 새하얀 백도 복숭아로 올여름 무더위를 기분 좋게 날려보세요.', '일반 택배배송', 2, 1000),

	-- 야채--
	('바름','#야채#고구마#국산#바름', '[바름] 영암 친환경 꿀고구마 2kg', '바름', 17000, 14500, 15, '야채1.jpeg',
   '전남 영암은 청청한 토양과 붉은 황토가 펼쳐진 곳이에요. 비옥한 땅에서 자라난 고구마는 더욱 깊고 진한 달콤함을 머금습니다. 영암에서 온 친환경 꿀고구마를 준비했습니다. 농약 없이 건강하게 길러낸 고구마를 엄선해 여러 번의 선별을 거쳤지요. 적외선으로 살균한 것은 물론, 온도와 습도를 체계적으로 관리하는 전용 창고에서 알맞게 숙성했답니다. 큼직한 사이즈로 골라 넉넉하게 담았으니, 서늘한 곳에 잘 두었다가 포슬하고 달콤한 맛을 즐겨보세요.', '일반 택배배송', 2, 1000),
	('다다기','#야채#오이#국산#아삭', '[KF365] 다다기오이 3입', '다다기', 3000, 2910, 3, '야채2.jpeg',
   '마디마다 열매가 다닥다닥 열린다 하여 붙여진 이름, 다다기오이. 꼭지로 갈수록 점차 짙어지는 녹색 그라데이션, 오돌토돌 솟아있는 돌기가 매력적인 오이예요. 특히 조직감이 뛰어나고, 씨방이 적어 쉽게 무르지 않는다는 장점이 있답니다. 식감도 우수해 오이소박이, 장아찌 등 다양한 메뉴에 두루 활용하기 좋지요. 1인 가구도 부담 없는 소량 구성으로 알뜰하게 전해드릴게요. 오이의 아삭거리는 식감, 싱그러운 수분감을 오롯이 누려보세요. ', '일반 택배배송', 2, 1000),

	('애기호박','#야채#애호박#국산#단골', '[KF365] 애호박 1개', '애기호박', 1500, 1470, 3, '야채3.jpg',
   '지금 소개하는 채소는 어느 요리와도 잘 어울리는, 만능 식재료 애호박입니다. 반찬이 마땅치 않은 날, 냉장고 속의 애호박으로 다양한 요리를 만들 수 있지요. 노릇노릇한 애호박전과 구수한 된장찌개, 부드럽고 고소한 볶음 반찬까지. 역시 만능 채소 1순위로 손꼽힐 만하답니다.  신선한 애호박을 부담 없는 양, 합리적인 가격으로 만나보세요.', '일반 택배배송', 2, 1000),

	('당근송창 시자','#야채#당근#국산#제주', '제주 흙당근 1kg', '당근송', 8000, 8000, 0, '야채4.jpg',
   '선명한 주홍빛으로 식탁에 산뜻한 분위기를 더해주는 채소, 아름다운 빛깔뿐만 아니라 풍부한 영양소까지 자랑하는  당근입니다. 비타민 A의 전구체인 베타카로틴을 다량 함유하고 있어 예로부터 웰빙 식재료로 사랑받고 있지요. 풍부한 일조량과 비옥한 화산토를 지닌 제주도에서 기른 맛 좋은 당근을 선보입니다. 지금 이 시기에만 만날 수 있는 제주도의 겨울 당근은 색감이 진하면서도, 달큼한 풍미를 한껏 품고 있어요. 별도의 세척 및 손질 과정 없이 수확한 상태 그대로 신선하게 전해드릴게요. 다양한 요리의 재료로, 아침을 여는 ABC 주스로 다채롭게 활용해 보세요.', '일반 택배배송', 2, 1000),

	('한통','#야채#양배추#국산#아삭달콤#한통', '한통 양배추', '한통', 6000, 5820, 3, '야채5.jpeg',
   '수분감 가득한 잎이 겹겹이 쌓인 양배추는 무궁무진한 활용도를 자랑하는 채소예요. 생으로 먹으면 아삭아삭한 식감이 돋보이고, 살짝 데치거나 볶아내면 은근한 단맛이 매력적이죠. 원하는 대로 잘라 사용할 수 있도록 한 통 그대로 준비했어요. 채썬 양배추에 드레싱을 뿌려 간단한 샐러드로 즐겨도 좋고요. 가볍게 삶아 따끈한 밥과 양념장을 올려 맛있는 쌈밥을 만들어도 훌륭할 거예요.', '일반 택배배송', 2, 1000),

	('새벽야채집','#야채#대파#국산#깐', '깐대파 500g', '새벽야채집', 4000, 3800, 5, '야채6.jpeg',
   '생으로 먹거나 살짝 데쳐냈을 때는 알싸하면서도 은은한 단맛을, 오래 끓여내면 시원한 맛을 내는 마법의 채소, 대파를 소개할게요. 각종 국물 요리의 육수를 낼 때는 통으로 넣어주면 시원한 맛이 제대로 우러나요. 기름기가 있는 요리에 곁들인다면 얇게 채를 썰어 파절이를 만들거나 동그랗게 송송 썰어 고명으로 뿌려주세요. 다채로운 활용도를 자랑하는 만큼 잦은 손질이 필요한 대파를 조금 더 간편하게 사용해보세요. 그때그때 유명산지 대파를 가락시장에서 수급하여 보내드립니다.', '일반 택배배송', 2, 1000),

	('싱싱야채','#야채#콩나물#국산#무농약', '[KF365] 무농약 국산콩 콩나물 300g', '싱싱야채', 1500, 1455, 3, '야채7.jpg',
   '식탁에 자주 오르는 일상 식재료로 콩나물을 빼놓을 수 없지요. 좋은 콩으로 키운 콩나물을 부담 없이 만날 수 있도록, 합리적인 가격에 국산콩 콩나물을 준비했어요. 농약 없이 깨끗하게 재배한 국산 콩으로 길러낸 콩나물이에요. 적당한 굵기에 아삭한 식감과 시원한 맛이 좋아 두루 활용하기 좋답니다. 산뜻한 나물 반찬은 물론이고 국, 탕 등 다양하게 요리해 보세요.', '일반 택배배송', 2, 1000),

	('GAP','#야채#깻잎#국산#밀량', '[KF365] GAP 밀양 깻잎 30g', 'GAP', 1500, 1455, 3, '야채8.jpg',
   '쌈채소나 반찬으로 활용할 향긋한 깻잎을 찾고 있다면, GAP 밀양 깻잎을 만나 보세요. 밀양은 일교차가 크고 비옥한 토양을 자랑하는 지역인데요. 밤낮의 기온을 견디고 풍부한 영양을 흡수한 깻잎이라, 개운한 향과 도톰한 잎을 가지고 있답니다. 까다로운 GAP 인증을 통과한 상품이기에 믿고 먹을 수 있어 더 만족스러워요. 밀양 깻잎을 활용하여 향긋한 요리를 만들어 보세요.', '일반 택배배송', 2, 1000),

	('컬리','#야채#배추#국산#미니', '알배기 배추 1봉', '컬리사장', 5000, 3750, 25, '야채9.jpeg',
   '한 입 베어 무는 순간 아삭한 식감에 반하고, 씹을수록 은은하게 퍼지는 고소하고 달큼한 맛에 두 번 반하는 알배기 배추를 소개할게요. 별다른 조리 없이 먹어도 맛있지만 햇살을 머금은 노란 잎에 고기 한 점을 얹어 쌈을 싸기에도 적당해요. 고춧가루, 소금, 젓갈로 삼삼하게 겉절이를 하거나 한입 크기로 썰어 된장국을 끓여내도 좋답니다. 그때그때 유명산지 알배기 배추를 수급해 보내드리니 순한 맛을 그대로 즐겨보세요. ', '일반 택배배송', 2, 1000),

	('컬리','#야채#양파#국산#단단', '양파 1.5kg', '컬리사장', 4500, 3150, 30, '야채10.jpg',
   '주황색 껍질 속에 숨겨진 하얀 속살의 양파. 집에 없으면 아쉬울 정도로, 다양한 음식에 활용되죠. 풍부한 영양은 물론, 다양한 매력을 발산하는 양파를 가져왔어요. 그때그때 좋은 양파를 가락시장에서 공급받아 보내드립니다. 껍질이 광택 있고, 단단하고 중량감 있는 양파만을 엄선했어요. 신선하고 수분 함량이 많아 아삭한 맛이 좋아요. 알싸하고 단 내음의 양파는 어떤 요리와도 잘 어울리는데요. 각종 요리에 어울려 음식의 풍미를 더할 뿐만 아니라 상하는 것도 막아줍니다.', '일반 택배배송', 2, 1000),

	('싱싱야채','#야채#브로콜리#국산#친환경#영양가득', '친환경 브로콜리 1개', '싱싱야채', 3000, 2940, 2, '야채11.jpeg',
   '단단한 줄기에 선명한 초록빛 꽃송이가 피어난 채소, 브로콜리를 마음 편히 즐겨 보세요. 안심하고 드실 수 있도록 농약 없이 건강하게 길러낸 브로콜리를 준비했어요. 이유식에도 자주 사용하는 브로콜리는 비타민C와 식이섬유가 풍부한 영양만점 채소인데요. 동글동글한 윗부분은 부드럽고 굵직한 줄기는 씹는 식감이 살아 있어 두 가지 매력을 만나볼 수 있지요. 살짝 데쳐 초고추장에 찍어 먹어도 좋고 샐러드, 카레에 넣으면 영양은 물론 예쁜 색감도 더해줄 거예요.', '일반 택배배송', 2, 1000),

	('아침한끼','#야채#감자#국산', '한끼 감자 300g', '아침한끼', 2400, 2280, 5, '야채12.jpg',
   '포슬포슬한 식감에 고소한 단맛이 나는 감자는 그대로 쪄 먹기도 좋고, 채 썰어 볶아서 반찬을 만들어도 좋아요. 때로는 숭덩 썰어 찌개나 찜 요리에 넣어주면 양념이 쏙쏙 배어 더욱 부드럽게 즐길 수 있지요. 요리에 자주 사용하는 필수 재료지만, 한 번에 많이 구비해두면 보관하기도 힘들고 쉽게 무르곤 해요. 그래서 감자를 딱 한끼 깔끔하게 즐길 수 있는 분량만큼 담아 보내드립니다. 번거롭게 손질할 일도 없고 남은 재료를 어떻게 처리할지 걱정할 필요도 없지요. 끼니마다 신선한 채소로 다채로운 요리를 완성해보세요.', '일반 택배배송', 2, 1000),

	('새벽야채집','#야채#국산#파프리카', '[KF365] 파프리카 2입', '새벽야채집', 3000, 2940, 2, '야채13.jpg',
   '알록달록한 색감까지 예쁜 파프리카를 신선하게 전해드립니다. 생생한 빛깔을 띠는 빨강 파프리카와 노랑 파프리카를 한 봉에 담았는데요. 수분감이 풍부해 생으로 드셔도 좋지만, 볶음이나 조림 등에 사용하면 맛과 영양은 물론 예쁜 색감까지 더할 수 있어요. 샐러드 토핑으로 활용하거나, 길쭉한 모양으로 잘라 채소 스틱으로 즐겨도 좋을 거예요. 남길 걱정 없는 양으로 간편하게 만나보세요.', '일반 택배배송', 2, 1000),

	('우리애기식탁','#야채#국산#청상추', '[KF365] 청상추 150g', '우리애기식탁', 2000, 1900, 5, '야채14.jpg',
   '상추는 어디서나 쉽게 접할 수 있기에 흔한 잎채소로만 여겨지죠. 그래서 오히려 그 진가를 몰라보는 것일 수도 있어요. 상추는 다른 잎채소에 비해 가격은 저렴하면서도 영양이 뛰어납니다. 비타민과 철분, 미네랄은 물론 식이섬유와 엽산이 풍부해 남녀노소 모두에게 도움이 되는 식재료인데요. 잎 전체가 녹색인 청상추는 맛이 순하고 식감이 부드러워 쌈채소부터 샐러드까지 다양하게 활용하기 좋습니다. 1인 가구나 소가족도 한두 번 먹기 좋은 소포장 제품이니 부담 없이 선택해보세요.', '일반 택배배송', 2, 1000),

	('우리애기식탁','#야채#국산#무', '[KF365] 무 1통', '우리애기식탁', 2200, 2090, 5, '야채15.jpg',
   '시원한 육수를 완성하는 데 빠질 수 없는 식재료, 바로 무일 거예요. 채 썬 무로 달큰한 무밥을 만들어도 별미고, 가볍게 버무려 산뜻한 무생채로 즐겨도 훌륭하지요. 이렇게 무궁무진한 활용도를 자랑하는 무를 만나보세요. 국내 농가에서 재배해 단단하고 신선한 무로 보내드린답니다. 전골, 조림 등 원하는 용도에 맞게 잘라 다채롭게 활용해 보세요. 어느 요리와도 잘 어울리니 냉장고에 구비해두면 참 든든할 거예요.', '일반 택배배송', 2, 1000),

	('우리애기식탁','#야채#가지#국산#', '[KF365] 가지 2입', '우리애기식탁', 40000, 34000, 15, '야채16.jpg',
   '늘 먹는 채소도 기본이 중요합니다. 없으면 허전한 필수 채소, 신선하게 담아가 보세요. 제철에 가장 맛이 좋은 가지를 준비했어요. 길쭉하게 뻗은 몸통에 윤기가 흐르는 신선한 가지랍니다. 특히나 수분이 많은 채소라 시원한 느낌으로 즐기기에도 좋지요. 가지볶음이나 가지나물 등 친숙한 요리부터, 가지 튀김이나 라자냐같은 별미 요리를 펼쳐보세요. 약간의 쓴맛이 느껴진다면, 꼭지를 자른 뒤 옅은 소금물이나 식초물에 담갔다가 사용해도 좋을 거예요.', '일반 택배배송', 2, 1000),

	('청량한하루','#야채#청경채#국산#아삭', '청경채 300g', '청량한하루', 3000, 2940, 2, '야채17.jpg',
   '청경채는 잎과 줄기가 붙어 자라는 한 포기 쌈채소예요. 중화풍 요리, 샤브샤브 재료로도 친숙하게 만나볼 수 있는데요. 아이들이 이유식을 시작할 때 가장 먼저 시도하는 채소이기도 합니다. 아삭하면서도 싱그러운 식감이 매력적이지만, 살짝 데치거나 볶아주면 새로운 풍미를 선사해요. 활용도 높은 청경채를 신선하게 만나보세요.', '일반 택배배송', 2, 1000),

	('청량한하루','#야채#마늘#국산#깐', '[KF365] 깐마늘 200g', '청량한하루', 3000, 2850, 5, '야채18.jpg',
   '알싸한 맛과 향으로 요리의 기본을 잡아주는 마늘. 각종 조리법에 빠지지 않고 들어가 깔끔한 맛을 완성해 주는 필수 재료인데요. 고기와 함께 그대로 구워내고 좋고, 오일이 들어가는 요리에 활용하면 느끼함을 금세 잡아주기도 하죠. 다채로운 활용도를 자랑하는 만큼, 잦은 손질이 필요한 마늘을 더욱 편리하게 만나보세요. 국내 농가에서 재배한 마늘의 껍질을 벗기고, 알차게 여문 알맹이만 골라 문 앞까지 전해드립니다. 손에 마늘향이 밸 염려 없이 무척 간편하게 사용할 수 있을 거예요..', '일반 택배배송', 2, 1000),

	('컬리','#야채#두부#국산#콩', '국산콩 두부 300g', '컬리', 2500, 2250, 10, '야채19.jpg',
   '자주 먹는 식재료일수록 좋은 재료로 활용도 있게 만들어, 부담 없는 가격에 드실 수 있는 상품이 더 많아져야 한다고 생각합니다. 세상에 이미 많은 두부가 있지만 두부를 선보이는 것 또한 이 때문이죠. 1등급 국산콩* 만을 사용해 고소한 맛을 살리고, 거품제거제와 유화제는 사용하지 않았습니다. 좋은 콩으로 제대로 만든 만큼 식탁에 매일같이 올리기에 참 편안한 두부예요. 기본을 지켜 다용도로 쓰기 좋게 만든 기본 두부, 선택해 보세요.', '일반 택배배송', 2, 1000),

-- 육류--
	('브룩클린688','#육류#호주#소고기#구이#치마살', '[브룩클린688] 호주산 목초육 치마살 구이용 300g (냉장)', '브룩클린688', 15900, 14787, 7, '육류1.jpeg',
   '호주 멜버른 브룩클린에는 세계적인 육류가공업체인 JBS그룹의 육가공장, 688 가공장이 있습니다. 최첨단 처리 시설을 갖춘 이 공장에서 생산되는 브룩클린688을 만나보세요. 좋은 품질과 합리적인 가격을 자랑하는 브랜드이죠. 고깃결이 곱고 일정해 부드러운 식감을 느낄 수 있는 치마살을 만나보세요. 소금과 후추를 더해 가볍게 구워내는 것만으로 충분하답니다. 촉촉하게 배어 나오는 육즙과 야들야들한 질감이 식사의 만족도를 한층 끌어올려 줄 거예요.', '일반 택배배송', 2, 1000),	

	('Kims Butcher','#육류#돼지고기#스페인#대패#삼겹살', '[Kims Butcher] 돌돌말이 대패 삼겹살 1kg(냉동)', 'Kims Butcher', 16990, 12900, 24, '육류2.jpg',
   '알맞게 익힌 돼지고기는 언제 먹어도 참 만족스러운 음식이죠. 부담 없이 즐길 수 있도록, Kims butcher가 깐깐하게 선택하고 선보이는 냉동 돌돌말이 삼겹살을 만나보세요. 인기 만점 삼겹살 부위를 얇게 저며 한 팩에 담은 상품인데요. 1kg 대용량 상품이라 냉장고에 든든하게 구비해 두고 다채로운 요리에 활용할 수 있답니다. 돌돌 말린 고기를 프라이팬에 올리면 금세 익어 간단하게 즐길 수 있고요. 전골이나 찌개 요리 등에도 안성맞춤이랍니다.', '일반 택배배송', 2, 1000),

	('델리치오','#육류#안심#소고기#호주#스테이크#냉장', '[델리치오] 호주산 목초육 안심 스테이크 250g (냉장)', '델리치오', 22900, 18320, 20, '육류3.jpeg',
   '지방이 적어 담백한 맛이 일품인 호주산 소 안심을 소개합니다. 소를 넓은 들판에 자유로이 방목하여, 목초를 먹이며 키웠어요. 자연 방목한 덕분에 소고기 결이 탄탄하고 육즙이 풍만하죠. 부드러운 안심 부위만을 선별해, 스테이크 조리가 간편하도록 먹기 좋은 크기로 2인분을 준비했답니다. 고급 레스토랑 못지 않은 안심 스테이크를 집에서도 취향껏 즐겨 보세요. ', '일반 택배배송', 2, 1000),

	('한돈','#육류#돼지고기#국산#한돈#삼겹살', '[KF365] 한돈 삼겹살 구이용 600g~ (냉장)', '한돈', 17950, 15300, 14, '육류4.jpg',
   '노릇하게 익힌 삼겹살은 언제 먹어도 만족스러운 음식이죠. 국내산 돼지고기의 삼겹살 부위를 구워 먹기 알맞은 두께로 준비했어요. 특유의 고소한 풍미는 물론이고, 야들한 식감까지 제대로 즐길 수 있지요. 두 가지 용량으로 준비했으니 필요에 맞게 선택해 보세요. 찌개 등의 요리에도 활용하기 좋답니다.', '일반 택배배송', 2, 1000),

	('한돈','#육류#돼지고기#국산#한돈#목살#구이', '[KF365] 한돈 목살 구이용 600g~ (냉장)', '한돈', 17600, 14940, 15, '육류5.jpg',
   '맛 좋고 건강한 우리 한돈을 부담 없이 즐겨보세요. 구이용으로 사랑받는 목살을 품질 좋은 한돈으로 준비했답니다. 목살은 기름기가 적어 담백한 맛을 자랑하는 부위인데요. 육즙을 보존하면서도 빠르게 구워 즐기기 적당한 두께로 정형했어요. 두 가지 용량으로 준비했으니 필요에 맞게 선택해 보세요. 찌개 등의 요리에도 활용하기 좋답니다.', '일반 택배배송', 2, 1000),

	('한돈','#육류#돼지고기#국산#한돈#냉동#삼겹살', '[KF365] 한돈 급냉 삼겹살 600g (냉동)', '한돈', 16990, 14990, 11, '육류6.jpg',
   '맛 좋은 우리 한돈을 부담 없이 즐겨보세요. 구이용으로 먹기 좋게 손질한 급냉 삼겹살을 준비했어요. 너무 두껍지도, 얇지도 않은 두께라 해동 없이 그대로 구워 즐길 수 있고요. 삼겹살 특유의 육즙과 씹는 재미도 오롯이 느낄 수 있답니다. 2~3인이 먹기 좋은 용량으로 준비했으니 냉동실에 든든히 챙겨 보세요.', '일반 택배배송', 2, 1000),

	('버크셔세상','#육류#돼지고기#국산#흑돼지#목살', '[버크셔세상] 버크셔K 흑돼지 목살 400g', '버크셔세상', 25000, 22500, 10, '육류7.jpeg',
   '한 번만 먹는 사람은 없다는 흑돼지, 버크셔K 입니다. 버크셔K는 두터운 지방층이 특징이라 유난히 고소한 풍미와 촉촉한 육즙이 남다른 순수 혈통 흑돼지예요. 지방 역시 불포화지방산 함량이 월등히 높아 오히려 지방 섭취에 대한 걱정을 놓아도 되죠. 두 번째로 가져온 부위는 앞다리살을 잇는 버크셔K 목살이랍니다. 근육 사이로 지방이 적당히 박혀 있어 육질, 풍미 모두가 부드럽고 고소한 부위이죠. 스테이크용으로 두툼하게 준비했어요. 사양 관리가 잘 된 버크셔K라 미듐 정도로만 적당히 익히면 더욱 풍성한 감칠맛을 누릴 수 있답니다. 돼지고기의 신세계를 버크셔K와 함께 경험해보세요.', '일반 택배배송', 2, 1000),

	('컬리','#육류#돼지고기#비엔나#소세지', '[KF365] 통통한 그릴 비엔나 소시지 700g', '컬리', 11000, 8500, 22, '육류8.jpg',
   '비엔나 소시지의 가장 큰 매력은 한 입에 쏙 넣고 깨물면 톡 하고 터지는 식감일 거예요. 이 매력을 오롯이 느낄 수 있도록, 입안 가득 꽉 차는 크기의 통통한 비엔나 소시지를 준비했답니다. 국산 돼지고기 함량이 94.36%에 달하니 풍성한 육즙과 육향은 말할 것도 없고요. 입자를 살려 갈았기에 쫄깃하게 씹히는 식감이 일품이에요. 넉넉한 양을 담았으니, 냉장고에 구비해 두고 두루두루 활용해 보세요. ', '일반 택배배송', 2, 1000),

	('우리땅오리','#육류#오리#가슴살', '[우리땅오리] 무항생제 오리 가슴살 슬라이스 350g (냉장)', '우리땅오리', 9900, 7992, 20, '육류9.jpg',
   '오리 가슴살은 퍽퍽한 느낌이 덜하고 지방의 고소한 풍미가 진하게 느껴지는 것이 특징이죠. 특히 프랑스에서는 고급 요리에 사용되는 귀한 재료이기도 한데요. 신선한 오리 가슴살을 길고 얇게 슬라이스해 사용이 간편한 제품을 만나보세요. 무항생제 1등급 오리만을 엄선해 더욱 안심할 수 있답니다. 기름기가 적고, 잡내가 거의 나지 않아 소고기처럼 미디움으로 익혀 즐겨도 좋고요. 샐러드 토핑으로 올리기에도 제격일 거예요.', '일반 택배배송', 2, 1000),

	('해올림','#육류#돼지고기#국산#삼겹살#냉장', '[해올림] 무항생제 삼겹살 500g 2종 (냉장)', '해올림', 20500, 16400, 20, '육류10.jpg',
   ' 해올림 삼겹살의 가장 큰 특징은 돼지 특유의 누린내가 없고 맛이 매우 깔끔하다는 점입니다. 구울 때 버터 냄새처럼 부드럽고 고소한 향, 고기가 식어도 기름이 하얗게 굳지 않고 비교적 부드럽게 유지되는 점, 삶았을 때 딱딱하게 굳지 않고 야들야들하게 남는 점 등 직접 맛을 보면 해올림 삼겹살의 우수성을 직접 느끼실 수 있죠. ', '일반 택배배송', 2, 1000),

	('조인','#육류#유정#계란#구운', '[조인] 동물복지 유정 구운란 20구', '조인', 13500, 18, 12250, '육류11.jpeg',
   '온 가족이 함께 먹을 수 있는 영양 간식을 찾고 계셨다면, 조인의 동물복지 유정 구운란을 만나보세요. 동물복지 인증을 받은 농장에서 건강하게 자란 닭이 낳은 달걀인데요. 달걀을 깨끗하게 세척한 뒤 알맞게 구워 완성했답니다. 갈색빛을 띄는 달걀을 한 입 베어물면 탱글탱글한 식감에 한번, 고소한 풍미에 두번 만족하게 될 거예요. 넉넉한 20구 상품으로 준비했으니, 든든하게 즐겨보세요.', '일반 택배배송', 2, 1000),

	('계란장사','#육류#계란#국산', '[KF365] 무항생제 대란 20구', '계란장사', 6900, 4900, 28, '육류12.jpg',
   '매일 같이 식탁에 오르는 식재료인 만큼 믿고 살 수 있는 달걀을 찾고 있는 분이라면 KF365가 선보이는 무항생제 대란을 만나보세요. 항생제와 산란촉진제 등이 포함돼 있지 않은 사료를 급여해 무항생제 인증을 받았고요. 알이 굵은 대란을 20구로 담아 든든하답니다. 다양한 요리에 언제든 부담 없이 사용해 보세요.', '일반 택배배송', 2, 1000),

	('하림','#육류#닭#국산#가슴살', '[자연실록] 무항생제 닭 가슴살 500g', '하림', 8200, 7380, 10, '육류13.jpg',
   '좋은 환경에서 키워 더욱 안심할 수 있는 하림의 자연실록 닭고기를 소개할게요. 무항생제 인증농가에서 기능성 사료를 먹고 자란 건강한 닭을 깨끗하게 손질하고요. 본연의 육향과 육즙을 살려 신선한 냉장 상태 그대로 담았답니다. 이번에는 지방이 적은 담백한 부위, 닭 가슴살을 준비했어요. 깔끔한 풍미를 자랑해 그대로 삶아 즐기거나 반려견 간식으로 마련하기에 제격이랍니다. 카레나 샌드위치 등의 요리에 활용하기에도 참 좋을 거예요.', '일반 택배배송', 2, 1000),
	
	('하림','#육류#닭#국산#다리살', '[자연실록] 무항생제 닭 다리살 (정육) 500g', '하림', 10200, 9180, 10, '육류14.jpeg',
   '좋은 환경에서 키워 더욱 안심할 수 있는 하림의 자연실록 닭고기를 소개할게요. 무항생제 인증농가에서 기능성 사료를 먹고 자란 건강한 닭을 깨끗하게 손질하고요. 본연의 육향과 육즙을 살려 신선한 냉장 상태 그대로 담았답니다. 이번에는 닭 다리의 뼈를 발라낸 뒤, 부드러운 살코기를 담아 준비했어요. 고소한 감칠맛이 남달라 다양한 요리에 두루 활용하기 좋답니다. 해동 없이 간편하게 우리 가족 반찬을 요리해 보세요.', '일반 택배배송', 2, 1000),

	('하림','#육류#닭#국산#안심살', '[자연실록] 무항생제 닭 안심살 500g', '하림', 8200, 7380, 10, '육류15.jpeg',
   '좋은 환경에서 키워 더욱 안심할 수 있는 하림의 자연실록 닭고기를 소개할게요. 무항생제 인증농가에서 기능성 사료를 먹고 자란 건강한 닭을 깨끗하게 손질하고요. 본연의 육향과 육즙을 살려 신선한 냉장 상태 그대로 담았답니다. 닭 안심살은 비교적 지방이 적고 담백해 식단 조절용으로 많이 활용하는 부위인데요. 기다란 모양새를 지녀 샐러드나 샌드위치 토핑으로 알맞답니다. 위생적인 환경에서 가공한 무항생제 닭고기, 안심하고 선택해 보세요.', '일반 택배배송', 2, 1000),

	-- 어류--
	('삼삼물산','#어류#생굴#국산#국밥', '[삼삼물산] 굴밥용 생굴 200g (가열조리용) ', '삼삼물산', 6100, 3900, 36, '어류1.jpg',
   '굴밥 한 그릇만 있으면 다른 반찬이 필요하지가 않아요. 원하는 재료를 넣어 밥을 짓기만 해도 맛있으니 요리의 부담 또한 덜하죠. 이번에 삼삼물산은 중간 크기의 생굴을 골라 굴밥용 제품으로 선보여요. 냉각한 해수만을 사용하고, 위생적인 시설에서 깔끔하게 손질하였으니 맛과 신선함이 그대로 담겨 있답니다. 받으신 후 살살 세척해 맛있는 굴밥을 지어보세요. 무, 콩나물, 미역, 버섯 등의 재료를 더하면 맛과 영양을 모두 챙기실 수 있을 거예요. ', '일반 택배배송', 2, 1000),
	
	('법성포참맛','#어류#굴비#국산', '[법성포참맛] 실속형 영광 굴비 1kg (20미)', '법성포참맛', 16900, 11900, 29, '어류2.jpg',
   '지방질이 풍부하고 살이 꽉 들어찬 참조기들이 떼를 지어 지나가는 영광 법성포. 그 길목에서 잡아 올린 참조기에 국내산 천일염을 더해 맛을 돋운 법성포참맛의 영광 굴비를 만나보세요. 어쩌다 한 번씩 구워 맛보던 굴비 맛이 못내 아쉬웠던 분들을 위해 실속형으로 준비했어요. 소담한 크기의 굴비지만 법성포 굴비만의 깊은 참맛이 차곡히 들어차 있지요. 가득 넣어뒀다가 필요할 때마다 꺼내 쓰기 좋은 냉동 굴비입니다. 그대로 해동해 구워 즐겨보아도 좋고, 찜이나 조림으로 활용해보아도 좋을 거예요.', '일반 택배배송', 2, 1000),

	('청산바다','#어류#낙지#국산', '[청산바다] 국산 뻘낙지 120~150g (생물)', '청산바다', 11500, 10500, 9, '어류3.jpg',
   '국산 뻘낙지는 깨끗한 황토 갯벌에서 자란 낙지를 한 마리씩 정성스레 잡은 것입니다. 통통하고 둥근 머리부터 길쭉하게 뻗은 다리 끝까지 안심하고 섭취할 수 있는 맛과 영양이 가득 차 있죠. 살아 있는 상태로 포장해 보내 드리니, 집에서도 싱싱한 낙지를 맛볼 수 있답니다. 흐르는 물에 가볍게 세척만 하여 싱싱한 국산 뻘낙지를 즐겨 보세요.', '일반 택배배송', 2, 1000),

	('삼삼물산','#어류#멍게#국산#통영', '[삼삼물산] 손질된 통영멍게 150g 내외 (생물)', '삼삼물산', 7900, 6320, 20, '어류4.jpg',
   '통통한 멍게는 입에 넣고 살짝 씹기만 해도 바다의 향이 톡 터져 나오죠. 삼삼물산은 통영과 거제 인근에서 양식한 멍게를 깔끔히 손질해 담았습니다. 세척과 손질 과정에서 냉각 해수만 사용하기에 신선함도 그대로 살아 있어요. 가볍게 헹군 후 초장에 살짝 찍어 향기와 식감을 즐겨보세요. 소포장 제품이라 혼자서 넉넉하게, 혹은 둘이서 알뜰히 먹을 수 있답니다.', '일반 택배배송', 2, 1000),

	('만선','#어류#전복#국산#완도', '[만선] 대용량 완도 전복 7-9마리 500g 내외 (생물)', '만선', 23900, 19120, 20, '어류5.jpg',
   '바다의 산삼이라고도 불리는 귀한 전복. 그동안 충분히 즐기지 못해 아쉬웠다면 대용량 완도 전복을 만나보세요. 완도 바다에서 잡아올린 싱싱한 전복을 넉넉하게 담았답니다. 어렵지 않게 손질할 수 있을 거예요. 버터에 노릇하게 굽거나 간장에 조려도 좋고요. 라면이나 탕, 전골 등 국물 요리에 특별함을 더해 보세요.', '일반 택배배송', 2, 1000),

	('Sea to Table','#어류#생새우#손질#냉동#베트남', '[Sea to Table] 손질 생새우살 200g (냉동) (26/30 사이즈)', 'Sea to Table', 8400, 6888, 18, '어류6.jpg',
   '언제나 맛있는 새우이지만, 늘 드는 생각이 하나 있죠. 누군가 새우의 속살만을 쏙 발라내 준다면 얼마나 좋을까? 준비한 손질 생새우살은 새우의 껍질과 내장, 꼬리까지 제거돼 세척만 마치면 손질 없이, 누구든 간편하게 즐길 수 있는 상품이에요. 4~5성급 호텔에 식자재로 납품될 정도로 맛과 품질이 우수한데요. 오동통 속살이 탄력 있게 차올라 흐뭇한 웃음을 안겨요. 크기가 꽤 커서 칠리 새우, 새우튀김 등 새우를 메인으로 한 요리에 활용하기도 좋지요. 손질이 번거롭다는 이유로 새우를 멀리하셨다면, 앞으로는 빠르고 자신 있게 요리해보세요. 200g 소분했기에 1~2인 가구라도 부담 없이 즐길 수 있어요.', '일반 택배배송', 2, 1000),

	('이호','#어류#참가자미#손질#생물', '[이호] 손질 참가자미 280g (생물)', '이호', 12900, 10900, 15, '어류7.jpg',
   '흰 살점이 주는 담백한 감칠맛, 오롯이 즐기고 싶다면 이호의 손질 참가자미를 추천할게요. 탄탄한 수산 경력의 베테랑이 국내 해협에서 잡아 올린 신선한 가자미를 깔끔하게 손질해 준비했어요. 소가구가 즐기기에 부담 없는 크기이지만, 통통한 살점은 오롯이 맛볼 수 있답니다. 별도의 간이 되어 있지 않은 상품이니 소금 간을 살짝 더해 그대로 구워보세요. 비린내가 적어서 어떤 요리를 해도 무척 잘 어울릴 거예요.', '일반 택배배송', 2, 1000),

	('Hallo','#어류#고등어#노르웨이#냉동', 'Hallo! 노르웨이 고등어 3종 (냉동) (택1)', 'Hallo', 3900, 3400, 12, '어류8.jpg',
   '노르웨이어로 안녕이란 뜻의 Hallo!(할로)에는 북대서양 청정 해역의 신선함을 그대로 전하고 싶은 마음이 담겨 있어요. 지방을 가득 품은 촉촉한 속살 덕분에 전 세계인들의 사랑을 받는 노르웨이 고등어를 간편하게 드실 수 있도록 준비했답니다. 통통하게 살이 오른 고등어만 선별하여 머리를 제거하고, 먹기 좋은 순살 형태로 손질했지요. 국산 천일염과 녹차를 넣고 숙성하여 감칠맛이 살아있고, 윤기가 자르르 도는 속살은 바라만 보아도 입에 침이 고여요. 원산지부터 가공 과정, 염도까지 꼼꼼하게 확인한 Hallo! 노르웨이 고등어를 오늘부터 식탁의 단골손님으로 맞이해 보세요.', '일반 택배배송', 2, 1000),

	('Hallo','#어류#생연어#노르웨이#냉장', '[KF365] 노르웨이 생연어 1kg (냉장)', 'Hallo', 61900, 54900, 11, '어류9.jpg',
   '노르웨이에서 항공 직송으로 날아온 신선한 생연어를 만나보세요. 어획 후, 배송 과정에서 한 번도 얼리지 않았기에 연어 본연의 맛과 식감을 오롯이 즐길 수 있답니다. 이번에는 노르웨이산 연어를 도톰하게 썰어 큼지막한 필렛 형태로 준비했어요. 가시뿐만 아니라 혈압육까지 깔끔하게 제거해 비린맛 없이 부드럽고 고소한 풍미를 맛볼 수 있죠. 원하는 대로 잘라 회로 드시거나 초밥, 연어장을 만들어도 좋고 홈파티에 준비해 근사한 요리를 펼쳐 보세요.', '일반 택배배송', 2, 1000),

	('만전김','#어류#만지도#곱창#김', '[만전김] 만지도 무산김(곱창김) 2종 (택1)', '만전김', 15860, 14260, 10, '어류10.jpg',
   '물 맑고 공기 좋기로 소문난 신안에서 뱃길로 약 20분을 가면 작은 섬 만지도가 그 모습을 드러냅니다. 만지도를 포함한 신안 인근 해역은 품질이 뛰어난 해산물로 유명하죠. 프리미엄 김을 지속적으로 선보여온 만전김 또한 만지도에서 맛 좋은 김을 수확했습니다. 김발에 포자를 착상해 전통 방식 그대로 재배하며, 화학 처리를 하는 대신 햇빛과 해풍으로 길러 원초가 건강하고 맛이 달아요. 특히 이 만지도 무산김은 엽채가 구불구불하고 식감이 오독오독한 곱창김만을 선별한 제품이랍니다. 풍미가 진하고 독특한 식감을 지닌 곱창김을 온전히 담아냈으니 가정에서 취향에 따라 굽거나 양념하여 드세요. 불에 살짝 구워 양념간장에 찍어 먹기만 해도 맛있을 거예요. ', '일반 택배배송', 2, 1000),

	('오징어장사','#어류#원양#오징어#손질#냉장', '[KF365] 원양산 손질오징어 3미 (냉장)', '오징어장사', 9200, 8280, 10, '어류11.jpg',
   '도톰한 몸통, 통통한 다리로 요리에 식감을 더해 보세요. 신선함을 그대로 간직한 원양산 손질 오징어를 준비했답니다. 뼈와 내장을 깔끔하게 손질해 두어, 흐르는 물에 가볍게 헹군 뒤 곧바로 사용할 수 있고요. 냉장 상태로 보내드리니 해동을 기다릴 필요도 없지요. 부담 없는 크기의 오징어 세 마리를 담았으니, 다채로운 요리에 활용해 보세요.', '일반 택배배송', 2, 1000),
	
--빵--
	('더브레드블루','#빵#밀#식빵', '[더브레드블루] 우리밀 식빵', '더브레드블루', 4500, 4050,10, '빵1.jpeg',
   '더브레드블루는 누구나 편안하고 건강하게 즐길 수 있는 빵을 만드는 비건 베이커리입니다. 빵을 만들 때 흔히 사용하는 계란, 우유, 버터를 사용하지 않고 식물성 재료만을 사용하죠. 이번에는 더브레드블루의 우리밀 식빵을 소개할게요. 우리밀과 쌀눈유, 유기농 비정제 설탕 등으로 깔끔하게 만들어낸 식빵이에요. 높은 밀 함량으로 은은하게 올라오는 구수한 밀의 향을 느낄 수 있지요. 잘 구운 식빵을 모두 슬라이스하여 보내 드리니, 다양하게 활용해 보세요.', '일반 택배배송', 2, 1000),

	('나폴레옹','#빵#크로와상#버터', '[나폴레옹] 크로와상', '나폴레옹', 3700, 3330, 10, '빵2.jpg',
   '오랜 전통과 노하우를 지닌 베이커리, 나폴레옹에서 만든 겉바속촉 크로와상을 소개할게요. 깊게 배어든 고소한 버터 풍미는 물론이고요. 겹겹이 결이 살아 있어 쫄깃한 식감까지 무척 매력적인 제품이랍니다. 별도로 조리할 필요 없이 바로 먹을 수 있는 크로와상이라 더욱 간편하죠. 우유나 커피를 곁들여 간단히 즐길 크로와상으로 부담 없이 선택해 보세요.', '일반 택배배송', 2, 1000),

	('아티제','#빵#카스테라#폭신', '[아티제] 카스테라 2종', '아티제', 12000, 10800, 10, '빵3.jpg',
   '맛있는 베이커리, 여유로운 분위기를 누릴 수 있는 아티제의 카스테라를 소개할게요. 국산 계란을 비롯해 꼼꼼히 엄선한 재료들로 정통 제조법을 충실하게 지켜 구워냈어요. 한 입을 먹어 보면 폭신한 식감에 은은한 달콤함이 부드럽게 어우러진답니다. 벌꿀로 달콤함을 더한 허니 카스테라와 담백한 매력의 흑미 카스테라, 두 가지 중 선택해 보세요. 우유, 커피를 곁들여 간식으로 즐기기에도 좋고, 아담한 사이즈라 부담 없는 선물로도 제격일 거예요.', '일반 택배배송', 2, 1000),

	('더벨로','#빵#치즈#바게트', '[더벨로] 치즈 바게트', '더벨로', 3500, 3150, 10, '빵4.jpg',
   '우리 밀로 건강한 빵을 만드는 베이커리, 더벨로가 소개하는 치즈 바게트를 만나 보세요. 국내산 밀가루로 만든 쫀쫀한 바게트 속에 롤치즈를 쏙쏙 넣어 짭조름한 맛과 부드러운 식감을 더했어요. 낮은 온도에서 천천히 발효했기에 더욱 깊은 풍미를 전한답니다. 살짝 데워 그대로 먹어도 고소하니 맛있고, 가볍게 올리브 오일과 발사믹 식초만 곁들여서 즐겨도 참 좋을 거예요.', '일반 택배배송', 2, 1000),
	
	('포비베이글','#빵#치즈#크림#잼', '[포비베이글] 크림치즈 8종', '포비베이글', 9900, 8910, 10, '빵5.jpg',
   '베이글 혹은 식사빵과 떼어놓을 수 없는 조합이 있어요. 슥슥 바르기만 하면 평범한 빵을 특별하게 바꿔주는 재료, 크림치즈입니다. 포비베이글이 만든 크림치즈를 준비했어요. 정직한 재료로 맛있는 베이글을 만드는 포비답게, 크림치즈 역시 재료 고유의 맛을 잘 살려 만들었답니다. 무화과, 토마토, 올리브 등 개성있는 토핑을 사용한 것은 물론, 유기농 설탕과 진한 크림치즈를 사용해 밀도 있는 풍미를 완성했지요. 각기 다른 매력을 지닌 여덟 가지 맛으로 준비했으니 입맛에 따라, 기분에 따라 골라 보세요. ', '일반 택배배송', 2, 1000),

	('네니아','#빵#유기농#잼#딸기#유기농', '[네니아] 유기농 생 딸기잼 600g', '네니아', 17500, 15750, 19, '빵6.jpg',
   '유개농 재료로 만들어 더욱 안심하고 즐길 수 있는 네니아의 유기농 딸기잼을 만나보세요. 싱싱한 국산 유기농 딸기만을 골라 깨끗하게 세척한 뒤, 유기농 설탕을 넣어 완성했답니다. 덕분에 딸기 고유의 자연스러운 단맛과 상큼함이 그대로 살아있지요. 빵이나 크래커에 곁들이는 스프레드는 물론, 요거트의 토핑으로 활용해도 매력만점일 거예요. 온 가족이 즐기는 딸기잼으로 고민 없이 선택해보세요. ', '일반 택배배송', 2, 1000),

	('포비베이글','#빵#베이글', '[포비베이글] 베이글 7종 (택1)', '포비베이글', 3200, 2880, 10, '빵7.jpeg',
   '베이글은 근본에 가까운 빵으로 불리곤 해요. 화려한 기교 없이, 재료 본연의 맛이 정직하게 묻어나기에 더욱 어려운 빵이기도 하지요. 포비베이글은 밀가루와 소금을 더해 베이글을 구워요. 일반적인 베이글보다 오동통한 외관에, 먹음직스럽게 그을린 겉면으로 눈길을 사로잡는데요. 반을 살짝 갈라보면 하얗고 폭신한 속살이 모습을 드러낸답니다. 각기 다른 매력을 지닌 구성으로 다채롭게 준비했으니 입맛에 따라, 기분에 따라 골라 보세요. ', '일반 택배배송', 2, 1000),

	('사층빵집','#빵#마카롱#달달', '[사층빵집] 마카롱 10종 (택1)', '사층빵집', 6500, 6175, 5, '빵8.jpg',
   '눈길을 붙잡는 화려한 색, 쫀득한 꼬끄와 풍성하고 다채로운 맛의 필링. 모두 마카롱을 수식하는 표현이지요. 달콤한 행복을 선사하는 감성적인 과자이지만, 사실 마카롱은 어떤 음식보다도 정밀한 작업을 통해 탄생한답니다. 꼬끄를 만드는 날의 온도와 습도, 필링에 들어가는 재료에 따라 굽는 온도는 물론 건조 시간까지 달라져야 하거든요. 100% 핸드메이드 방식으로 만들어지는 사층빵집의 마카롱은 매일 달라지는 레시피로 항상 균일한 맛과 품질을 유지하기에 맛볼 가치가 충분하답니다. 벨기에산 초콜릿부터 마다가스카르산 바닐라빈, 프랑스산 생크림까지 좋은 품질의 원재료를 사용했기에 고급스러운 풍미를 느낄 수 있어요. 농밀하고 쌉쌀한 단맛의 마카롱부터 오레오와 얼그레이가 들어간 독특한 마카롱까지 총 10종을 준비했으니 취향에 따라 선택해보세요. ', '일반 택배배송', 2, 1000),

	('우드앤브릭','#빵#콩플레#잼#버터', '[우드앤브릭] 빵콩플레', '우드앤브릭', 5500, 4950, 10, '빵9.jpg',
   '바쁜 일상 탓에 아침 식사를 챙기기 어려운 현대인에게 버터나 잼을 곁들여 간단하게 먹을 수 있는 빵은 허기를 채워주고 든든한 하루를 시작할 수 있도록 도와주는 고마운 녀석이죠. 하지만 빵의 풍미를 오롯이 살린 건강한 식사 빵을 찾기란 좀처럼 쉽지 않아요. 그래서 통밀을 넣어 원재료 본연의 맛을 그대로 느낄 수 있게 만든 우드앤브릭의 빵콩플레를 준비했어요. 어디에 곁들여도 좋을 무난함으로 편하게 먹을 수 있는 건강한 식사 빵, 빵콩플레로 한 끼 식사 알차게 챙겨보세요.', '일반 택배배송', 2, 1000),

	('브레댄코','#빵#제리#롤#딸기', '[브레댄코] 돌아온 제리롤 2종 (택1)', '브레댄코', 2300, 1725, 25, '빵10.jpg',
   '온 가족이 함께 즐기기 좋은 브레댄코의 돌아온 제리롤을 만나 보세요. 약간의 밀도가 느껴지는 촉촉한 시트 속에 국산 딸기로 만든 잼을 발라 돌돌 말아냈답니다. 부드러운 풍미와 딸기 특유의 새콤달콤한 맛이 어우러져 누구나 좋아하는 간식이지요. 취향에 따라 우유나 커피, 차를 곁들여 즐겨 보세요. 때로는 든든한 간식으로, 때로는 간단한 아침으로 손색이 없을 거예요. ', '일반 택배배송', 2, 1000),

	('룩트','#빵#스프레드#버터#달콤', '[룩트] 스프레드 버터 90g 4종(택1)', '룩트', 16000, 12500, 21, '빵11.jpg',
   '룩트(lukt)는 아이슬란드어로 등불을 의미합니다. 모든 이의 미식 경험을 환하게 밝히겠다는 의미가 담겨있죠. 이번에는 빵이나 크래커에 곁들이기 좋은 스프레드 버터를 준비했습니다. 프랑스산 버터에 각기 다른 개성을 가진 재료를 더해 색다르게 풀어냈답니다. 4가지 종류 중 취향에 따라 골라보세요.', '일반 택배배송', 2, 1000),
	
--면--
	('데체코','#면#밀#구불구불#마팔디네', '[데체코] 마팔디네 면 500g', '데체코', 6500, 5200, 20, '면1.jpg',
   '작은 여왕들이라는 뜻을 가진 마팔디네 면은 이탈리아 사보이 왕실의 마팔다 공주에게서 이름을 따왔어요. 공주의 머리카락처럼 구불구불한 모양이 돋보이는데요. 작은 틈 사이사이로 소스가 충분히 묻어나 파스타의 풍미를 제대로 즐길 수 있게 해준답니다. 녹진한 풍미를 지닌 소스와 함께 요리해 즐겨 보세요.', '일반 택배배송', 2, 1000),

	('우리농','#면#흑#밀#국수', '[우리농]오월햇살 우리밀아리흑국수', '우리농', 3500, 2975, 15, '면2.jpg',
   '온 가족이 안심하고 먹을 수 있는 국수, 우리농으로 만나보세요. 50여 년간 쌓아 온 국수 제조 노하우로 정성껏 만든 국수를 선보여요. 이번에는 아리흑으로 만든 국수를 소개할게요. 아리흑은 검붉은 빛을 띠는 우리 밀 품종이에요. 다른 첨가물 없이 아리흑 밀가루와 천일염으로 만들어 더욱 믿음직스럽답니다. 밀 본연의 구수하고 담백한 맛은 물론이고요. 쫄깃쫄깃한 식감이 살아있답니다. 국수나 사리 등으로 다양하게 활용해 보세요. ', '일반 택배배송', 2, 1000),

	('윤서울','#면#들기름#들깨', '[윤서울] 생들기름면', '윤서울', 8900, 8200, 7, '면3.jpg',
   '식재료 본연의 편안한 맛을 지향하는 한식 파인 다이닝, 윤서울을 만나보세요. 김도윤 셰프의 시그니처 메뉴인 생들기름면을 준비했습니다. 겉모습은 단정하게만 보이지만, 한 입 맛보면 속에 숨긴 탄탄한 내공을 느낄 수 있어요. 유기농 통밀로 만든 면부터 태안산 소금, 국내산 들깨를 저온 압착한 생들기름까지, 무엇 하나 허투루 고른 것이 없지요. 간장을 사용하지 않고 소금으로 간을 했기에 깔끔한 뒷맛이 특징이랍니다. 마지막 단계에 생들기름을 훌훌 둘러 고소한 향기를 오롯이 누려 보세요.', '일반 택배배송', 2, 1000),

	('테이블마크','#면#우동#사누끼#탱글탱글', '[테이블마크] 사누끼 우동', '테이블마크', 7380, 7380, 0, '면4.jpg',
   '사누끼 우동이라 하면 떠오르는 이미지가 있습니다. 면발의 생김새가 통통하고 매끈하며 실제로 맛을 한번 보면 쫀득쫀득, 부들부들한 식감을 느낄 수 있죠. 사누끼 우동을 합리적인 가격에 넉넉하게 즐길 수 없을까 하는 고민에서 테이블마크의 제품을 엄선했습니다. 손으로 직접 뽑은 고급 면은 아니지만, 수타면에 버금갈 정도로 품질이 뛰어나요. 무엇보다 250g씩 직사각형 모양으로 깔끔하게 면이 말려 있어 하나씩 꺼내어 사용하기 참 편리합니다. 취향에 맞는 육수를 준비해 따끈한 우동 한 그릇을 간편하게 즐겨 보세요.', '일반 택배배송', 2, 1000),

	('데체코','#면#파스타#구르메', '[데체코] 구르메 파스타면 6종', '데체코', 6500, 5200, 20, '면5.jpeg',
   '평소 집에서 파스타를 자주 요리하시는 분이라면 데체코 제품을 한두번쯤 사용해보셨을 거예요. 그만큼 대중적인 브랜드이고, 그 명성만큼이나 품질 또한 일정하지요. 오랜 시간 파스타계의 강자 자리를 지켜온 데체코가 이번엔 구르메 라인으로 오랜 세월 쌓인 노하우를 유감없이 발휘했습니다. 데체코는 산지에 전문가를 파견해 듀럼밀의 품질을 직접 확인한다고 해요. 밀을 선별한 후에는 맷돌을 사용해 전통 방식 그대로 밀을 제분합니다. 차갑고 깨끗한 광천수를 넣어 반죽한 뒤 청동 다이스로 면을 뽑아, 거친 표면 사이사이로 소스가 더 잘 스며들 수 있도록 했죠. 총 여섯 가지의 구르메 파스타면을 소개합니다. 롱 파스타와 숏 파스타 중 쓰임새에 따라 골라보세요.', '일반 택배배송', 2, 1000),

	('면사랑','#면#백도#국산#복숭아', '[면사랑] 쫄면 1kg (200g*5입)', '면사랑', 6480, 5832, 10, '면6.jpg',
   '1993년에 설립된 면 전문 브랜드, 면사랑의 쫄면을 소개합니다. 면사랑의 30년 노하우로 반죽을 적정한 온도와 습도에서 숙성해 쫄깃한 면발을 완성했지요. 삶은 후에도 쉽게 불지 않아 마지막까지 탱글한 식감을 즐길 수 있답니다. 1인분씩 개별 포장해 총 5봉을 담았으니 든든하게 구비해 보세요. 매콤한 소스와 야채를 곁들여도 좋고요. 떡볶이나 순두부찌개의 사리로도 훌륭하답니다.', '일반 택배배송', 2, 1000),

	('칠갑농산','#면#냉면#사리', '[칠갑농산] 냉면사리 900g (180g*5입봉)', '칠갑농산', 5500, 5335, 20, '면7.jpg',
   '칠갑농산은 충남 청양군 칠갑산 자락에 위치한 농산물 가공식품 브랜드예요. 50여 년의 전통과 노하우로 만든 각종 면과 떡, 간편식 등의 제품으로 익히 유명한 곳이죠. 이번에 소개할 제품은 쫄깃한 식감이 돋보이는 냉면사리예요. 볶음메밀가루를 더해 만들었기에 구수한 풍미 또한 느낄 수 있지요. 1인 가구도 부담 없이 즐길 수 있도록, 1인분씩 개별 포장해 5봉을 보내드린답니다. 육수와 고명만 준비해 간편하게 냉면을 완성해보세요. ', '일반 택배배송', 2, 1000),

	('오뚜기','#면#당면#옛날', '[오뚜기] 옛날자른당면 300g', '오뚜기', 4780, 4541, 5, '면8.jpg',
   '한 번 구매해 두면 요긴하게 쓰는 주방 재료로 당면을 빼놓을 수 없어요. 잡채부터 각종 볶음 요리, 국물 요리에 더하는 든든한 사리까지 두루두루 활용하기 그만인 재료이니까요. 지금 소개하는 오뚜기의 당면은 면발을 분리하기 쉽도록 당면을 미리 잘라서 담은 제품이랍니다. 다양한 요리에 쫄깃쫄깃한 매력을 더해 보세요.', '일반 택배배송', 2, 1000),


--유제품--
	('제주우유','#유제품#우유#제주#무항생제', '[제주우유] 제주 목초 우유 무항생제 750mL', '제주우유', 3200, 2780, 15, '유제품1.jpg',
   '언뜻 가볍게까지 느껴지는 산뜻한 우유맛을 좋아하는 분이라면 이 제품이 반가울 거예요. 원유를 72~75℃에서 15초간 살균해 본연의 담백하고 깔끔한 맛을 온전히 살려냈거든요. 원유를 생산하는 과정도 특별합니다. 자가 목초지를 보유한 제주 목장에서 젖소가 먹는 풀과 사료는 물론, 마시는 물까지 세심하게 관리하죠. 무항생제 인증까지 받았으니 매일의 한 잔으로 부족함이 없을 거예요.', '일반 택배배송', 2, 1000),

	('구르메','#유제품#치즈#슬라이스', '[구르메] 에담 슬라이스 150g', '구르메', 5800, 4900, 15, '유제품2.jpg',
   '네덜란드 북쪽의 항구 도시인 에담(Edam) 마을에서 유래된 에담 치즈는 네덜란드를 대표하는 치즈 중 하나인데요. 지금 소개하는 구르메의 에담 슬라이스는 4주 이상 숙성한 에담 치즈를 얇게 슬라이스한 제품이에요. 부드러운 풍미를 지녀 누구나 부담 없이 즐기기 좋답니다. 한 장씩 떼어내어 간식으로 드시거나 샐러드나 샌드위치 재료로 다양하게 활용해 보세요. 하몽, 올리브 등을 곁들여 와인 안주로 즐겨도 좋을 거예요.', '일반 택배배송', 2, 1000),

	('램노스','#유제품#과일#치즈', '[램노스] 과일치즈 5종', '램노스', 5500, 4675, 15, '유제품3.jpg',
   '다양한 종류의 라인업을 자랑하며 많은 사랑을 받고 있는 램노스의 과일치즈를 소개합니다. 녹진한 치즈 속에 고소한 견과류와 상큼한 과일이 콕콕 박혀있는 제품인데요. 입안을 가득 채우는 다채로운 식감과 풍미를 지녀, 치즈 보드를 따로 준비할 필요 없이 와인에 간편하게 곁들이기에 제격이랍니다. 그냥 먹어도 맛있지만, 크래커나 베이글과 함께 즐기면 특별하고 색다른 치즈의 풍미를 느끼실 수 있어요. 풍미와 향이 강한 치즈가 부담스럽다면, 상큼한 과일 치즈로 가볍게 치즈의 세계에 다가가 보세요.', '일반 택배배송', 2, 1000),

	('Fage','#유제품#우유#요거트', '[Fage] 파예 플레이버 요거트 150g 3종 (택1)', 'Fage', 6400, 5500, 14, '유제품4.jpg',
   '파예 그릭요거트는 요거트 본고장 그리스에서 만들어져요. 담백하고 고소하며 고유의 시큼한 맛이 살아 있어 그리스에서도 인정하는 본연의 풍미를 자랑하죠. 세계적으로 그릭요거트가 주목을 받게 된 계기는 가득 찬 영양 덕인데요. 신선한 우유에 유산균을 넣어 농축, 발효했기에 그릭요거트 속 단백질과 칼슘이 일반 우유보다 높답니다. 오로지 단 하나의 걱정은 유지방 역시 높은 비율로 농축된다는 점이지만, 파예는 그릭요거트 속 지방을 말끔히 걷어냈어요. 파예 무지방 그릭요거트는 지속적으로 인기몰이를 하는 중이죠.', '일반 택배배송', 2, 1000),

	('엠보그','#유제품#냉동#치즈', '[엠보그] 냉동 브리 치즈 125g', '엠보그', 6900, 5900, 14, '유제품5.jpg',
   '치즈와 휘핑크림으로 전세계에 명성이 자자한 글로벌 브랜드, 엠보그의 브리 치즈를 소개할게요. 우유처럼 고소하고 부드러운 풍미를 지니고 있어, 초심자도 부담 없이 즐길 수 있는 치즈예요. 냉동 제품이라 더욱 편하게 보관할 수 있답니다. ', '일반 택배배송', 2, 1000),

	('레스큐어','#유제품#버터#AOP', '[레스큐어] AOP 버터 2종', '레스큐어', 8900, 7900, 11, '유제품6.jpg',
   '135년 이상의 역사를 자랑하는 버터 브랜드, 레스큐어의 AOP 버터를 만나 보세요. 프랑스에서 특정 지역의 특산품에만 부여하는 AOP 인증을 받은 제품이랍니다. 고소한 무염 버터와 약간의 짠맛을 더한 가염 버터를 준비했으니 용도에 따라 선택해 보세요.', '일반 택배배송', 2, 1000),

	('제주우유','#유제품#저지방#우유', '[제주우유] 저지우유 750mL', '제주우유', 4990,4480 , 10, '유제품7.jpg',
   '제주에 위치한 다인목장은 목장의 환경부터 젖소의 건강까지, 모든 요소를 세심하게 관리하며 신선한 저지우유를 생산합니다. 저지우유는 고소하고 진한 맛을 지녔을 뿐만 아니라, 부드럽고 크리미해 한층 더 편안하게 마실 수 있어요. 매일 한 잔씩 우유 본연의 풍미를 만끽해 보세요. ', '일반 택배배송', 2, 1000),

	('제주우유','#유제품#치즈#안주#브리', '[프레지덩] 쁘띠 브리', '제주우유', 6300, 5670, 10, '유제품8.jpg',
   '치즈의 왕이라고도 불리는 브리치즈. 명성으로만 보면 치즈 특유의 쿰쿰함이 가득할 것 같지만 전혀 그렇지 않아요. 치즈 특유의 맛과 풍미가 은은하게 풍겨져 치즈 초보자 분들도 부담 없이 먹을 수 있지요. 프레지덩 쁘띠 브리는 보관까지 간편한 치즈예요. 캔에 통조림 형태로 담았기 때문에 오랫동안 보관할 수 있답니다. 캔을 열어주면 겉표면에 덮여있는 새하얀 곰팡이를 볼 수 있는데요. 생유에 렌넷과 발효균을 넣어 제대로 숙성됐다는 증거예요. 치즈 나이프를 이용해 조심스레 잘라주면 껍질의 탄탄한 감촉과 대비되는 촉촉하고 보드라운 내면을 볼 수 있어요. 프레지덩 쁘띠 브리로 간단하면서도 근사한 디저트 혹은 안주를 즐겨보세요.', '일반 택배배송', 2, 1000),

	('무르젤라','#유제품#치즈#부라타#냉장#이탈리아', '[무르젤라] 이탈리아 부라타 120g (냉장)', '무르젤라', 9600, 9100, 5, '유제품9.jpg',
   '모짜렐라 치즈 주머니 속에 크림을 듬뿍 채워 만드는 부라타 치즈는 부드러운 맛도 좋지만 먹기 직전 준비하는 과정에서도 즐거움을 선사하죠.  무르젤라의 부라타 치즈는 속을 가르면 진한 크림이 몽글몽글한 상태로 자리하고 있답니다. 이탈리아 풀리아 지역에서 오랫동안 내려온 노하우를 바탕으로, 손으로 크림 필링을 채워 넣는 전통 방식을 지키고 있죠. 동글동글한 귀여운 모양에 우유의 고소한 맛이 진하게 느껴지는 무르젤라의 부라타는 올리브오일을 살짝 뿌려 드시거나 생과일을 넣은 샐러드와 함께 즐겨보세요. 과일향을 지닌 화이트 와인과도 잘 어울려요. ', '일반 택배배송', 2, 1000),

	('일드프랑스','#유제품#치즈#미니#브리', '[일드프랑스] 미니 브리', '일드프랑스', 9400, 8900, 5, '유제품10.jpg',
   '깊고 넓은 치즈의 세계 속에서 초보자들은 쉽게 길을 잃어요. 향이 강하다는 건 어떤 뜻인지, 부드럽다는 건 어느 정도를 말하는 것인지 알쏭달쏭하기만 하죠. 정통 치즈를 처음 접하시거나 아직 익숙하지 않으신 분들은 우선 브리에서부터 시작해보세요. 브리(brie)는 치즈의 왕이라는 별명으로 불리며 프랑스에서는 마지막으로 하나만 더 먹는다면 브리라는 말이 있을 정도로 사랑받는 치즈입니다. 멸균하지 않는 생우유로 만들기에 신선하고 고소한 향기가 나며, 상온에 두면 속이 크림처럼 변할 정도로 부드러워요. 다양한 브리 치즈 중 일드프랑스의 미니 브리를 소개할게요. 한 입 크기로 개별 포장되어 있으니 부담 없이 시도해보세요. 캠핑이나 피크닉에 가져가기에도 좋습니다.', '일반 택배배송', 2, 1000),

	('빙그레','#유제품#치즈#피자#모짜렐라', '[빙그레] 모짜렐라 피자치즈 2종(택1)', '빙그레', 10900, 10500, 3, '유제품11.jpg',
   '쭈욱 늘어나는 치즈의 퍼포먼스가 더해지면 음식이 한 층 화려해지죠. 빙그레는 자칫 어려워 보일 수 있는 치즈 요리를 보다 간단하게 만들어줄 모짜렐라 피자치즈를 준비했어요. 통 모짜렐라를 작게 분쇄해 담은 슈레드 치즈인데요. 그레이터 등의 특별한 도구 없이 솔솔 뿌리기만 하면 근사한 요리가 완성된답니다. 부담 없이 사용하기 좋은 양의 피자치즈와 합리적인 가격에 넉넉히 즐길 수 있는 대용량 피자치즈를 준비했으니, 취향에 따라 선택해 보세요. ', '일반 택배배송', 2, 1000);




--레시피--
INSERT INTO public.recipe(
   rcp_title, rcp_content, rcp_main_photo, rcp_tag,cook_amount, cook_time, cook_kind, cook_level, member_no)
   VALUES 
   ('솔티드 딸바 크레페','크레이프케이크에 환상적인 카라멜과의 조합으로 달콤한 디저트 시간을 보내요!' ,'recipeBoardImg(1).jpg', 
   '크레이프,카라멜,솔티드,케이크','3인분','15분 이내','디저트','하',1),
   ('차슈 덮밥','식당에서 먹어본 차슈를 집에서도 쉽게 만들 수 있다는 사실을 아시나요? 통삼겹살과 차슈요리양념이면 충분해요. 맛이 잘 배어든 차슈는 덮밥으로 즐기기에 훌륭하지요. 훈연향과 생강향이 어우러진 쯔유 스타일의 차슈요리양념은 차슈 뿐 아니라 다양한 일식 요리의 맛을 살리는데 좋습니다.' ,'recipeBoardImg(2).jpg', 
   '오늘밥상,차슈,삼겹살,집밥,양념','2인분','15분 이내','한식','중',1),
   ('창녕갈릭 삼치 조림','밥도둑 하면 떠오르는 메뉴 중 하나인 생선 조림 레시피를 소개합니다. 창녕마늘이 듬뿍 들어간 창녕갈릭소이소스를 사용하면 생선의 비린 맛은 확실하게 잡고 감칠맛도 더해 준답니다. 꼭 삼치가 아니어도 잘 어울립니다. 간편하게 생선 조림을 즐겨보세요.' ,'recipeBoardImg(3).jpg', 
   '삼치,조림,집밥,반찬,생선,갈릭','3인분','15분 이내','한식','하',1),
   ('돈까스 김밥','바삭하게 튀긴 돈까스를 넣고 잘 말아준 인기만점 김밥! 도톰한 등심 돈까스에 고소한 마요네스와 달짝지근한 돈까스소스가 어우러져 남녀노소 누구나 좋아하는 메뉴에요. 든든한 한 끼로도, 소풍 도시락으로도 최고! 돈까스 김밥에 도전해보세요.' ,'recipeBoardImg(4).jpg', 
   '돈까스,마요네즈,김밥,분식,집밥','2인분','10분 이내','한식','하',1),
   ('감자 짜글이','국물 자작~하게 졸여 즐기는 짜글이의 매력! 입맛 없을 땐 감자 듬뿍 썰어 넣어 감칠맛 가득한 감자 짜글이 어떠세요? 청양고추와 양파, 대파 송송 썰어 넣으면 매콤한 매력까지 추가요! 밥 쓱쓱 비벼 먹으면 밥 도둑이 따로 없어요.' ,'recipeBoardImg(5).jpg', 
   '감자,매콤,찌개,집밥,얼큰','3인분','30분 이내','한식','중',4),
   ('참치 무조림','선물받고 남은 처치곤란 참치캔, 어떻게 먹을지 고민일 때 이렇게 만들면 밥 도둑! 입맛없을 때, 뭐 해먹을지 모를때, 간단하게 해먹을 수 있어요! 남은재료로 만드는 든든한 한끼, 오늘 점심은 참치 무조림 어때요?' ,'recipeBoardImg(6).jpg',
   '참치,무,조림,반찬,집밥','1인분','15분 이내','한식','하',1),
   ('오이 무침','새콤 짭짤! 아삭아삭 씹히는 오이무침에 밥 한술갈, 식감도 맛도 챙기는 건강한 밥반찬 어떠신가요? 저는 두그릇도 먹을 수 있어요!', 'recipeBoardImg(7).jpg',
   '오이,양념,무침,반찬','2인분','10분 이내','한식','하',1),
   ('케일 장아찌','쌈으로만 먹던 케일이 밥 도둑으로 변신! 케일을 장아찌로 드셔보는건 어떠실까요? 새로운 맛에 후회하지는 않을거에요!' , 'recipeBoardImg(8).jpg',
   '케일,장아찌,반찬,집밥','1인분','15분 이내','한식','하',1),
   ('게살 계란찜','초간단 계란찜 만들기! 계란찜에 게살을 넣어 요리의 감칠맛을 더해주어 따뜻하고 맛있는 집밥을 완성해준답니다.','recipeBoardImg(9).jpg',
   '게살,계란찜,집밥,초간단','4인분','10 분이내','한식','하',1),
   ('창녕갈릭 소불고기','창녕마늘이 듬뿍 들어간 창녕갈릭소이소스를 활용하면 감칠맛이 풍부한 소불고기 완성! 불고기는 반찬으로도 좋고 명절에 특별한 메뉴로도 손색 없지요. 기호에 따라 돼지고기를 양념하여 돼지불고기를 만들어도 좋습니다.','recipeBoardImg(10).jpg',
   '불고기,갈릭,집밥,반찬,고기','2인분','15분 이내','한식','중',1),
   ('비어포크','우리남편 영양간식, 술안주 비어포크! 집에서도 즐기는 캠핑장스타일 구이!','recipeBoardImg(11).jpg',
   '비어,삼겹살,반찬,안주,고기','2인분','10분 이내','양식','하',1),
   ('햄마요 덮밥','그냥 구워 먹는 햄이 지겹다면? 고소한 마요네스와 직접 만든 단짠단짠 간장소스를 더해 마요덮밥를 만들어보세요. 햄 대신 참치나 동그랑땡을 사용해도 좋답니다.','recipeBoardImg(12).jpg',
   '햄,마요,간장,덮밥,식사,양념','1인분','10분 이내','양식','하',1),
   ('쭈꾸미 삼겹살 볶음','소위 말하는 쭈삼 레시피! 청양고추를 넣어 칼칼한 매콤함이 일품이에요. 봄이 제출인 쭈꾸미는 피로회복에 좋기로 유명한 타우린이 풍부하게 들어있지요. 특히 돼지고기와 궁합이 좋답니다.' ,'recipeBoardImg(13).jpg',
   '쭈꾸미,삼겹살,양념,매콤,반찬','2인분','15분 이내','한식','중',1),
   ('완자 꼬치','굴림만두로 만들 수 있는 새로운 레시피를 추천해 드릴게요. 데리야끼 소스를 조금 바른 X.O.만두를 꼬치에 꽂아 에어프라이어에서 조리해보세요. 겉은 바삭하면서 속은 촉촉한 겉바속촉 만두 꼬치가 완성된답니다.','recipeBoardImg(14).jpg',
   '만두,꼬치,반찬,안주,간단','1인분','10분 이내','한식','하',1),
   ('삼겹살 순두부 짜글이','얼큰한 국물에 몽글몽글한 식감의 순두부가 가득 들어 있는 순두부찌개는 누구나 좋아하는 음식이죠. 그런데, 삼겹살과 함께 자작하게 끓여낸 순두부 짜글이도 정말 별미란 사실 알고 계셨나요? 쫄깃한 고기와 부드러운 순두부의 찰떡궁합은 집나간 입맛도 돌아오게 해줘요.간단하고 맛있게 끓여낸 순두부 짜글이로 오늘 저녁 어떠세요?','recipeBoardImg(15).jpg'
   ,'삼겹살,순두부,찌개,집밥,얼큰','2인분','30분 이내','한식','중',1),
   ('블루베리소스 목살 스테이크','스테이크에 곁들인 블루베리소스는 버터와 생크림의 고소함과 쨈의 달콤함이 정말 조화로워요. 스테이크 소스 외에도, 여러가지 고기 양념에 블루베리쨈을 조금씩 넣어보세요. 블루베리쨈이 양념의 감칠맛을 더해주면서 고기의 잡내를 없애는 역할도 한답니다.','recipeBoardImg(16).jpg',
   '블루베리,목살,구이,스테이크,기념일','1인분','20분 이내','양식','하',1),
   ('돈까스 샌드위치','요즘 유행하는 카츠산도! 돈까스를 새로운 방식으로 즐기실 수 있는 돈까스샌드위치예요. 갓 튀겨서 육즙 풍부한 돈까스 위에 케챂과 마요네스로 버무린 양배추를 올리고, 돈까스소스 바른 식빵으로 덮으면 완성! 간단하게 만들어 아이들 간식으로도 좋고, 도시락메뉴로도 참 좋아요.','recipeBoardImg(17).jpg',
   '돈까스, 마요네즈,샌드위치,간단,도시락','1인분','20분 이내','양식','하',1),
   ('고추잡채','참 맛있지만 막상 시켜먹으려면 조금 비싼 감이 있는 고추잡채, 다들 공감하실 거에요. 그래서 저렴하면서도 집에서 간단히 만들 수 있는 고추잡채 레시피를 소개해 드릴게요. 꽃빵에 올려 먹어도 좋고, 반찬으로 먹어도 정말 중독성 있는 맛이에요. 고추잡채에 집에 숨어 있는 고량주를 곁들이면, 고급 중식당이 부럽지 않은 한 끼를 즐기실 수 있답니다.','recipeBoardImg(18).jpg',
   '고추,잡채,안주,중식,매콤','3인분','30분 이내','중식','중',1),
   ('고등어 무조림',' 집밥이 생각날 땐 고등어무조림을 만들어보세요. 맛술로 생선의 비린내를 잡아주면서 요리의 감칠맛을 더해주어 따뜻하고 맛있는 집밥을 완성해준답니다.','recipeBoardImg(19).jpg',
   '고등어,무,조림,반찬,집밥','2인분','20분 이내','한식','중',1),
   ('반숙 달걀 장조림','간단하게 숙성하여 먹는 반숙달걀 장조림! 부드럽고 고소한 노른자를 밥에 비벼 먹으면 고소한 풍미가 최고에요. 면 요리의 사이드 메뉴나 짭조롬한 간식으로도 즐겨보세요.','recipeBoardImg(20).jpg',
   '달걀,반숙,조림,반찬','1인분','15분 이내','한식','하',1),
   ('오이 소박이','바로 먹어도 맛있고, 숙성 시켜서 먹으면 더 맛있는 오이소박이! 아삭아삭한 식감이 매력적인 오이소박이를 간편 무침양념으로 완성해보세요.','recipeBoardImg(21).jpg',
   '오이,반찬,양념,김치,집밥','2인분','15분 이내','한식','하',1),
   ('얼걸이 된장 무침','보리밥이 생각나는 국민반찬 얼갈이배추 된장무침입니다. 구수한 맛에 누구나 즐길 수 있는 밑반찬이기도 하죠. 복잡한 계량 없이 시판 소스 된장간편양념으로 간단하게 무침반찬을 완성해보세요.','recipeBoardImg(22).jpg',
   '얼갈이,된장,무침,반찬','1인분','15분 이내','한식','하',1),
   ('사골 김치찌개','김치찌개를 간편하게 업그레이드하는 비법! 옛날 사골곰탕으로 깊고 진~한 맛의 김치찌개를 완성해보세요. 밥 한 공기 뚝딱입니다.','recipeBoardImg(23).jpg',
   '사골,김치,찌개,얼큰,집밥','2인분','20분 이내','한식','중',1),
   ('대패삼겹 숙주볶음','오늘밥상 차슈요리양념으로 만드는 다양한 간편 응용 레시피 시리즈! 이자카야 스타일 숙주볶음으로 오늘의 홈술 안주 완성 기호에 따라 대패삼겹 대신 차돌박이나 해물 등으로 응용해보세요.','recipeBoardImg(24).jpg',
   '삼겹,숙주,볶음,안주,반찬','3인분','20분 이내','한식','중',1),
   ('해물 가지 카레','오늘 저녁 뭐 해먹을지 고민이라면? 부드러운 가지와 쫄깃한 해물이 카레에! 여러가지 식감을 느낄 수 있는 해물 가지 카레 어떠실까요?','recipeBoardImg(25).jpg',
   '해물,가지,카레,집밥,간단','2인분','15분 이내','양식','하',1),
   ('한라봉 라떼','까먹기만 하는 한라봉? 아니요! 한라봉과 감귤의 상큼함과 우유의 부드러움이 동시에 느껴지는 이색 음료!','recipeBoardImg(26).jpg',
   '한라봉,라떼,디저트,카페,우유','1인분','10분 이내','디저트','하',1),
   ('한라봉 소르베','제주산 한라봉, 감귤의 상큼함이 느껴지는 소르베! 디저트로, 파티음식으로 간편하고 맛있게 즐겨보세요.','recipeBoardImg(27).jpg',
   '한라봉,소르베,디저트,카페,아이스크림','1인분','10분 이내','디저트','하',1),
   ('딸기 복숭아 요거트 빙수','더운 여름! 푹푹 찌는 더위에 생각나는 새콤달콤 빙수! 딸기와 복숭아가 만나면 더욱 맛있게 즐길 수 있어요.달콤한 딸기 시럽을 활용한 핑크빛 요거트 빙수로 시원하게 당 충전 UP~','recipeBoardImg(28).jpg',
   '딸기,복숭아,요거트,빙수,디저트,카페','2인분','15분 이내','디저트','하',1),
   ('참깨 다식','미숫가루로 간단하게 다식을 만들어볼수도 있지만, 이번에는 정통 그대로 다식 만드는 레시피를 소개해드릴게요. 흑임자다식을 만들어 함께 즐겨도 좋아요! 차와 함께하면 다식의 단맛과 고소한 풍미를 가득히 느낄 수 있답니다. 다식틀이 없다면, 작은 머핀틀, 컵을 이용하셔도 좋아요.','recipeBoardImg(29).jpg',
   '참깨,전통,디저트,다식,간단','1인분','15분 이내','디저트','하',1),
   ('옥수수 푸딩','옥수수푸딩이라니, 생소한 조합이죠? 일반적으로 생각하는 탱글탱글한 푸딩은 아니에요. 단짠단짠 옥수수 맛이 은은하게 느껴지는 떠먹는 크림디저트랍니다.옥수수스프 가루를 활용한 옥수수크림의 진하고 부드러운 맛과 스위트콘, 과자의 식감이 톡톡튀는 게 참 매력적이에요. 오븐 없이도 만들 수 있는 베이킹 레시피랍니다','recipeBoardImg(30).jpg',
   '옥수수,푸딩,디저트,단짠,크림','1인분','20분 이내','디저트','중',1);
   

INSERT INTO DIVISION(
	div_name,rcp_no
)VALUES('test1',5),('test2',5),('test3',5);
INSERT INTO INGREDIENTS_INFO(
	ingre_name, ingre_amount,ingre_unit,div_no
)VALUES('test1-1',1,'개',1),('test1-2',1,'개',1),('test1-3',1,'개',1),('test2-1',1,'개',2),('test2-2',1,'개',2),('test2-3',1,'개',2),('test3-1',1,'개',3),('test3-2',1,'개',3),('test3-3',1,'개',3);
INSERT INTO COOK_ORDER(
	cook_ord_content,cook_ord_photo,rcp_no
)VALUES('잘 저어서 녹여주세요','5_2.jpg',5),('잘 붙여줍니다. 맛있게 노릇노릇','5_3.jpg',5),('잘딸기,바나나 맛있게 썰어주세요','5_4.jpg',5);
INSERT INTO COOK_TIP(
	cook_tip_content,cook_ord_no
)VALUES
	('양념에는 설탕과 고추장이 들어가요',1),('한 숟갈이면 충분합니다.',1),('양정말정말조아요',1),
	('잘썰어줍니다',2),('채소는 많을수록 맛있습니다.',2)
	,('식용류넣으면 더 맛있어요',3),('팁 테스트3-2',3);

INSERT INTO MEDIA(
	media_type,media_kind,file_path,origin_name,change_name,rcp_no
)VALUES(1,1,'resources/uploadfile/recipe/recipefinal','5_8.jpg','5_8.jpg',5),
	(1,1,'resources/uploadfile/recipe/recipefinal','5_9.jpg','5_9.jpg',5),
	(1,1,'resources/uploadfile/recipe/recipefinal','recipeBoardImg(5).jpg','recipeBoardImg(5).jpg',5);

-- -- 주문  --
-- INSERT INTO public.orders(
--    final_price, order_memo, order_address, address_name,
--    order_phone, recipient_name, shipment_situation, payment_type, order_date, 
--    exp_arrival_date, product_no, member_no)
--    VALUES 
--    (24000 ,'상품파손없이 빠르게 배송부탁드립니다.','서울 강남구 강남대로 320 310호','우리집', 
--    '1234567891','user01','배송중','카드결제', '2000-01-05', '2000-01-07', 1, 5),
--    (24000 ,'상품파손없이 빠르게 배송부탁드립니다.2','서울 강남구 강남대로 320 310호','우리집', 
--    '1234567891','user01','배송완료','카드결제', '2000-01-03', '2000-01-05', 1, 5);



-- 게시글 --
INSERT INTO public.board(
   board_title, board_content, board_tag, board_thumbnail,member_no)
   VALUES 
	('간단하게 육회비빔밥을 만들어 보았어요!', '마트에서 우둔을 싸게 팔고 있길래 후딱 사서 집에서 간단하게 비빔밥을 만들었네요. 레시피 궁금하시면 작성해볼게요!', '#일상','boardThumbnail_1.jpg',5),
   ('첫번째 게시글입니다 여러분 반가워요', '테스트 첫번째 더미데이터입니다. 여러분 반갑습니다.', '#일상','2024052819230192378.jpeg',5 ),
   ('두번째 게시글입니다 여러분 반가워요', '테스트 두번째 더미데이터입니다. 여러분 반갑습니다.', '#노하우','2024052819230192378.jpeg',1 ),
   ('세번째 게시글입니다 여러분 반가워요', '테스트 세번째 더미데이터입니다. 여러분 반갑습니다.', '#일상','2024052819230192378.jpeg',1 ),
   ('네번째 게시글입니다 여러분 반가워요', '테스트 네번째 더미데이터입니다. 여러분 반갑습니다.', '#노하우','2024052819230192378.jpeg',5 ),
   ('다섯번째 게시글입니다 여러분 반가워요', '테스트 다섯번째 더미데이터입니다. 여러분 반갑습니다.', '#일상','2024052819230192378.jpeg',1 ),
   ('여섯번째 게시글입니다 여러분 반가워요', '테스트 여섯번째 더미데이터입니다. 여러분 반갑습니다.', '#일상','2024052819230192378.jpeg' ,5),
   ('일곱번째 게시글입니다 여러분 반가워요', '테스트 일곱번째 더미데이터입니다. 여러분 반갑습니다.', '#노하우','2024052819230192378.jpeg',1 ),
   ('여덟번째 게시글입니다 여러분 반가워요', '테스트 여덟번째 더미데이터입니다. 여러분 반갑습니다.', '#일상','2024052819230192378.jpeg' ,5),
   ('아홉번째 게시글입니다 여러분 반가워요', '테스트 아홉번째 더미데이터입니다. 여러분 반갑습니다.', '#노하우','2024052819230192378.jpeg' ,5),
   ('열번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#노하우','2024052819230192378.jpeg' ,5),
   
	('열한번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#질문','2024052819230192378.jpeg' ,1),
   ('열두번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#꿀팁','2024052819230192378.jpeg' ,1),
   ('열세번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#보관법','2024052819230192378.jpeg' ,1),
   ('열네번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#보관법','2024052819230192378.jpeg' ,1),
   ('열다섯번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#꿀팁','2024052819230192378.jpeg' ,1),
   ('열여섯번째 게시글입니다 여러분 반가워요', '테스트 열번째 더미데이터입니다. 여러분 반갑습니다.', '#질문','2024052819230192378.jpeg' ,1);



--상품옵션--
INSERT INTO public.option_name(
	options_name, main_option, options_normal_price, options_sale_price, options_stock, product_no)
	VALUES ('옵션1','true' , 2000, 500, 1000, 1);
INSERT INTO public.option_name(
	options_name, main_option, options_normal_price, options_sale_price, options_stock, product_no)
	VALUES ('옵션2','true' , 1500, 1000, 1000, 1);

--질의 응답(qna)--
INSERT INTO public.qna(
   qna_content, qna_type, qna_answer_type, qna_photo, product_no, member_no)
   VALUES ('유통기한은 어느정도 인가요?', 1, 1 ,'product_description.png',1,5 );
INSERT INTO public.qna(
   qna_content, qna_type, qna_answer_type, ref_qna_no, product_no, member_no)
   VALUES ('정해진 소비기한은 없지만 2~3일 내로 섭취하는 것을 권장드립니다.', 1, 2 ,1,1,1 );



--장바구니--
INSERT INTO public.product_cart(
	option_quantity, member_no,options_name_no)
	VALUES (3, 5, 1);


-- INSERT INTO public.comments(
-- 	 comment_content,  comment_answer_type, board_no,  member_no)
-- 	VALUES (?, ?, ?, ?, ?, ?, ?, ?);
-- INSERT INTO public.comments(
-- 	comment_content, comment_answer_type,  board_no, ref_comment_no, member_no)
-- 	VALUES (?, ?, ?, ?, ?, ?, ?, ?);

-- --댓글
-- INSERT INTO public.comments(
--     comment_content, board_no, member_no)
--    VALUES ( '정말 이쁘세요! 짱!짱!',1 ,6);
-- INSERT INTO public.comments(
--     comment_content,   board_no, comment_no2, member_no)
--    VALUES ( '감사합니다ㅎ ',1,1,5);




--후기리뷰
INSERT INTO public.review(
   review_content, rating, review_photo, review_type, product_no, member_no)
   VALUES ('너무 신선하고 달아서 다음에도 구매하려구요 짱짱! 굿! ', 5,'product_description.png', 1, 1, 5);
INSERT INTO public.review(
   review_content, rating, review_photo, review_type,rcp_no, member_no)
   VALUES ('너무 신선하고 달아서 다음에도 구매하려구요 짱짱! 굿! ', 3,'product_description.png', 2,5 ,4);
INSERT INTO public.review(
   review_content, rating, review_photo, review_type,rcp_no, member_no)
   VALUES ('너무 신선하고 달아서 다음에도 구매하려구요 짱짱! 굿! ', 4,'product_description.png', 2,5 ,4);

--=====================================================================================================
-- 1번 회원 팔로잉 수 추가
INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 2);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 3);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 4);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 5);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 6);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 7);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 8);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 9);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 10);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (1, 11);

--====================================================

-- 1번 회원 팔로워 추가
INSERT INTO public.follow(
	following_no, follower_no)
VALUES (2, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (3, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (4, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (5, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (6, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (7, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (8, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (9, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (10, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (11, 1);

INSERT INTO public.follow(
	following_no, follower_no)
VALUES (12, 1);

--=================================================
-- 게시글 좋아요
INSERT INTO public.like_board(
	member_no, board_no)
	VALUES (1, 1);

INSERT INTO public.like_board(
	member_no, board_no)
	VALUES (1, 2);

INSERT INTO public.like_board(
	member_no, board_no)
	VALUES (1, 3);

INSERT INTO public.like_board(
	member_no, board_no)
	VALUES (1, 4);

INSERT INTO public.like_board(
	member_no, board_no)
	VALUES (1, 5);


-- 레시피 좋아요
INSERT INTO public.like_recipe(
	member_no, rcp_no)
	VALUES (1, 1);

INSERT INTO public.like_recipe(
	member_no, rcp_no)
	VALUES (1, 2);

INSERT INTO public.like_recipe(
	member_no, rcp_no)
	VALUES (1, 3);

INSERT INTO public.like_recipe(
	member_no, rcp_no)
	VALUES (1, 4);

--==========================================
-- 신고

-- 1번 게시글 신고
INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용1', 1, 9);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용2', 1, 6);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용3', 1, 5);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용4', 1, 4);

-- 2번 게시글 신고 - 
INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용1', 2, 9);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '음란물 입니다.', '신고내용2', 2, 6);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '불법 정보를 포함하고 있습니다.', '신고내용3', 2, 5);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '청소년에게 유해한 내용입니다.', '신고내용4', 2, 4);

-- 3번 게시물 신고
INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '스팸/홍보 도배 게시글입니다.', '신고내용1', 3, 9);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '음란물 입니다.', '신고내용2', 3, 6);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '불법 정보를 포함하고 있습니다.', '신고내용3', 3, 5);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '청소년에게 유해한 내용입니다.', '신고내용4', 3, 4);

INSERT INTO public.report(
	report_no, report_why, report_content, board_no, member_no)
VALUES (nextval('report_report_no_seq'), '욕설/혐오/차별적 표현을 포함한 내용입니다.', '신고내용5', 3, 10);

--=====================================================================================================
-- 스크랩
-- 게시글 스크랩
INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 2);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 3);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 4);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 5);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 6);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 7);

INSERT INTO public.scrap_board(
	member_no, board_no)
	VALUES (1, 8);

-- 상품 스크랩
INSERT INTO public.scrap_product(
	member_no, product_no)
	VALUES (1, 1);

INSERT INTO public.scrap_product(
	member_no, product_no)
	VALUES (1, 2);

INSERT INTO public.scrap_product(
	member_no, product_no)
	VALUES (1, 3);

INSERT INTO public.scrap_product(
	member_no, product_no)
	VALUES (1, 4);

INSERT INTO public.scrap_product(
	member_no, product_no)
	VALUES (1, 5);


-- 레시피 스크랩
INSERT INTO public.scrap_recipe(
	member_no, rcp_no)
	VALUES (1, 1);

INSERT INTO public.scrap_recipe(
	member_no, rcp_no)
	VALUES (1, 2);

INSERT INTO public.scrap_recipe(
	member_no, rcp_no)
	VALUES (1, 4);