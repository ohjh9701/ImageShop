CREATE TABLE CODE_GROUP(
    GROUP_CODE VARCHAR2(3) NOT NULL,
    GROUP_NAME VARCHAR2(30) NOT NULL,
    USE_YN VARCHAR2(1) DEFAULT 'Y',
    REG_DATE DATE DEFAULT SYSDATE,
    UPD_DATE DATE DEFAULT SYSDATE, 
    PRIMARY KEY (GROUP_CODE)
);

SELECT group_code, group_name, use_yn, reg_date FROM code_group ORDER BY group_code DESC, reg_date DESC;

SELECT user_no, user_id, user_pw, user_name, 
		(SELECT code_name FROM code_detail WHERE group_code = 'A00' AND code_value = job) AS job, coin, reg_date 
		FROM member ORDER BY reg_date DESC;
        


CREATE TABLE CODE_DETAIL(
    GROUP_CODE VARCHAR2(3) NOT NULL,
    CODE_VALUE VARCHAR2(3) NOT NULL,
    CODE_NAME VARCHAR2(30) NOT NULL,
    SORT_SEQ NUMBER NOT NULL,
    USE_YN VARCHAR2(1) DEFAULT 'Y',
    REG_DATE DATE DEFAULT SYSDATE,
    UPD_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (GROUP_CODE, CODE_VALUE)
);

Update CODE_GROUP set GROUP_CODE = 'B00' where GROUP_NAME = 'IT';
commit;

delete from CODE_DETAIL;


CREATE TABLE MEMBER(
    USER_NO NUMBER(5) NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    USER_PW VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(100) NOT NULL,
    JOB VARCHAR2(3) DEFAULT '00',
    COIN NUMBER(10) DEFAULT 0,
    REG_DATE DATE DEFAULT SYSDATE,
    UPD_DATE DATE DEFAULT SYSDATE,
    ENABLED VARCHAR2(1) DEFAULT '1',
    PRIMARY KEY (USER_NO)
);

SELECT COUNT(*) FROM member;

CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1;

SELECT * from member_auth;

CREATE TABLE MEMBER_AUTH(
    USER_NO NUMBER(5) NOT NULL,
    AUTH VARCHAR2(50) NOT NULL
);

ALTER TABLE MEMBER_AUTH ADD CONSTRAINT FK_MEMBER_AUTH_USER_NO
FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO);


CREATE TABLE PERSISTENT_LOGINS
( USERNAME VARCHAR2(64) NOT
NULL,SERIES VARCHAR2(64) NOT
NULL, TOKEN VARCHAR2(64) NOT
NULL,
LAST_USED DATE NOT NULL,
PRIMARY KEY (SERIES)
);



-- 회원 게시판
CREATE TABLE BOARD (
    BOARD_NO NUMBER NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(3000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (BOARD_NO)
);

CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BY 1;

select * from board;

SELECT board_no, title, content, writer, reg_date
			FROM (select board_no, title, content, writer, reg_date, rownum as rnum from (select board_no, title, content, writer, reg_date from board order by board_no asc))
			WHERE rnum between 10*1-9 and 10*1
			ORDER BY board_no DESC, reg_date DESC;
            
select board_no, title, content, writer, reg_date, rownum as rnum from (select board_no, title, content, writer, reg_date from board order by board_no asc);

SELECT board_no, title, content, writer, reg_date, rnum
FROM (
    SELECT board_no, title, content, writer, reg_date, ROWNUM as rnum 
    FROM (
        /* 1. 먼저 최신순(내림차순)으로 전체 데이터를 정렬합니다 */
        SELECT board_no, title, content, writer, reg_date 
        FROM board 
        ORDER BY board_no DESC
    )
    /* 2. 정렬된 결과에 rnum을 부여하되, 페이지 끝 번호까지만 가져와서 성능을 높입니다 */
    WHERE ROWNUM <= 10 * 22  -- (getSizePerPage * page)
)
/* 3. 마지막으로 rnum의 시작 범위를 지정하여 해당 페이지 분량만 추출합니다 */
WHERE rnum >= (10 * 22) - 9;

commit;

SELECT board_no, title, content, writer, reg_date, ROWNUM as rnum 
    FROM (
        /* 1. 먼저 최신순(내림차순)으로 전체 데이터를 정렬합니다 */
        SELECT board_no, title, content, writer, reg_date 
        FROM board 
        ORDER BY board_no DESC
    )
    /* 2. 정렬된 결과에 rnum을 부여하되, 페이지 끝 번호까지만 가져와서 성능을 높입니다 */
    WHERE ROWNUM <= 10 * 22;

SELECT board_no, title, content, writer, reg_date 
        FROM board 
        ORDER BY board_no DESC;

INSERT INTO board (board_no, title, content, writer)
		VALUES (board_seq.NEXTVAL, '페이징테스트', '페이징테스트', 'ohjh9701');

CREATE TABLE NOTICE(
    NOTICE_NO NUMBER NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(3000),
    REG_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (NOTICE_NO)
);

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1;



CREATE TABLE ITEM(
    ITEM_ID NUMBER(10) NOT NULL,
    ITEM_NAME VARCHAR2(30) NOT NULL,
    PRICE NUMBER(7) NOT NULL,
    DESCRIPTION VARCHAR2(500) NOT NULL,
    PICTURE_URL VARCHAR2(200),
    PREVIEW_URL VARCHAR2(200),
    PRIMARY KEY (ITEM_ID)
);

CREATE SEQUENCE ITEM_SEQ
START WITH 1
INCREMENT BY 1;



-- 코인 충전 내역 테이블
CREATE TABLE CHARGE_COIN_HISTORY(
    HISTORY_NO NUMBER(10) NOT NULL,
    USER_NO NUMBER(10) NOT NULL,
    AMOUNT NUMBER(10) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (HISTORY_NO)
);

CREATE SEQUENCE CHARGE_COIN_HISTORY_SEQ
START WITH 1
INCREMENT BY 1;



CREATE TABLE USER_ITEM (
    USER_ITEM_NO NUMBER(10) NOT NULL,
    USER_NO NUMBER(10) NOT NULL,
    ITEM_ID NUMBER(10) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (USER_ITEM_NO)
);

CREATE SEQUENCE USER_ITEM_SEQ
START WITH 1
INCREMENT BY 1;



CREATE TABLE PAY_COIN_HISTORY(
    HISTORY_NO NUMBER(10) NOT NULL,
    USER_NO NUMBER(10) NOT NULL,
    ITEM_ID NUMBER(10) NOT NULL,
    AMOUNT NUMBER(10) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (HISTORY_NO)
);

CREATE SEQUENCE PAY_COIN_HISTORY_SEQ
START WITH 1
INCREMENT BY 1;



/* 댓글기능 추가 */



