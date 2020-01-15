SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS REPLY;
DROP TABLE IF EXISTS COMMENT;
DROP TABLE IF EXISTS DESIGNER;
DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS SHOP;
DROP TABLE IF EXISTS USER;




/* Create Tables */

CREATE TABLE BOOK
(
   bo_uid int NOT NULL AUTO_INCREMENT,
   bo_service varchar(80) NOT NULL,
   bo_stat int NOT NULL DEFAULT 1,CHECK(bo_stat>=1 and bo_stat<=3),
   bo_time datetime NOT NULL default now(),
   bo_comment varchar(80),
   use_uid int,
   sh_uid int,
   PRIMARY KEY (bo_uid)
);


CREATE TABLE COMMENT
(
   co_uid int NOT NULL AUTO_INCREMENT,
   co_star int NOT NULL,
   co_content text NOT NULL,
   co_name varchar(40) NOT NULL,
   co_regdate datetime NOT NULL DEFAULT now(),
   use_uid int,
   sh_uid int,
   co_title varchar(20) NOT NULL,
   PRIMARY KEY (co_uid)
);


CREATE TABLE DESIGNER
(
   de_uid int NOT NULL AUTO_INCREMENT,
   de_name varchar(40) NOT NULL,
   de_position varchar(20) NOT NULL DEFAULT '디자이너',
   de_career int NOT NULL,
   de_major varchar(40) NOT NULL,
   de_picture varchar(40),
   sh_uid int,
   PRIMARY KEY (de_uid)
);


CREATE TABLE REPLY
(
   re_uid int NOT NULL AUTO_INCREMENT,
   re_content text NOT NULL,
   co_uid int,
   re_regdate datetime NOT NULL DEFAULT now(),
   PRIMARY KEY (re_uid)
);


CREATE TABLE SERVICE
(
   ser_uid int NOT NULL AUTO_INCREMENT,
   ser_name varchar(40) NOT NULL,
   ser_price int,
   ser_time time NOT NULL,
   sh_uid int,
   PRIMARY KEY (ser_uid)
);


CREATE TABLE SHOP
(
   sh_uid int NOT NULL AUTO_INCREMENT,
   sh_id varchar(40) NOT NULL,
   sh_pw varchar(15) NOT NULL,
   sh_no_id double NOT NULL,
   sh_name varchar(20) NOT NULL,
   sh_telephone varchar(30) NOT NULL,
   sh_location varchar(80),
   sh_location_lat varchar(40),
   sh_location_lng varchar(40),
   sh_hello varchar(200),
   sh_picture1 varchar(400),
   sh_picture2 varchar(400),
   sh_picture3 varchar(400),
   sh_starttime int DEFAULT 9,
   sh_endtime int DEFAULT 21,
   num_identify int DEFAULT 2,
   sh_star double,
   PRIMARY KEY (sh_uid),
   UNIQUE (sh_id),
   UNIQUE (sh_no_id)
);


CREATE TABLE USER
(
   use_id varchar(40) NOT NULL,
   use_uid int NOT NULL AUTO_INCREMENT,
   use_pw varchar(15) NOT NULL,
   use_name varchar(40) NOT NULL,
   use_phoneNum varchar(11) NOT NULL,
   num_identify int DEFAULT 1,
   PRIMARY KEY (use_uid),
   UNIQUE (use_id),
   UNIQUE (use_phoneNum)
);

/* Create Foreign Keys */

ALTER TABLE REPLY
   ADD FOREIGN KEY (co_uid)
   REFERENCES COMMENT (co_uid)
   ON UPDATE RESTRICT
   ON DELETE cascade
;


ALTER TABLE BOOK
   ADD FOREIGN KEY (sh_uid)
   REFERENCES SHOP (sh_uid)
   ON UPDATE RESTRICT
   ON DELETE set null
;


ALTER TABLE COMMENT
   ADD FOREIGN KEY (sh_uid)
   REFERENCES SHOP (sh_uid)
   ON UPDATE RESTRICT
   ON DELETE set null
;


ALTER TABLE DESIGNER
   ADD FOREIGN KEY (sh_uid)
   REFERENCES SHOP (sh_uid)
   ON UPDATE RESTRICT
   ON DELETE cascade
;


ALTER TABLE SERVICE
   ADD FOREIGN KEY (sh_uid)
   REFERENCES SHOP (sh_uid)
   ON UPDATE RESTRICT
   ON DELETE cascade
;


ALTER TABLE BOOK
   ADD FOREIGN KEY (use_uid)
   REFERENCES USER (use_uid)
   ON UPDATE RESTRICT
   ON DELETE set null
;


ALTER TABLE COMMENT
   ADD FOREIGN KEY (use_uid)
   REFERENCES USER (use_uid)
   ON UPDATE RESTRICT
   ON DELETE set null
;


/* 샘플데이터 */

insert into USER (use_id,use_pw,use_name,use_phoneNum) values 
('userId01','1234','임민교','01011111111'),
('userId02','1234','최현진','01022222222'),
('userId03','1234','오다현','01033333333'),
('userId04','1234','강경근','01044444444'),
('userId05','1234','고정민','01055555555');


insert into SHOP (sh_id,sh_pw,sh_no_id,sh_name,sh_telephone,sh_location,
sh_location_lat,sh_location_lng,sh_hello,sh_starttime,sh_endtime) values 
('ShopId1','1234',1111111111,'헤네시스미용실','01022222222','빅토리아아일랜드',
37.490239,126.91232,'최선을 다하는 헤네시스 미용실입니다.',9,19),
('ShopId02','1234',2222222222,'커닝시티미용실','01011111111','빅토리아아일랜드',
37.590259,126.41632,'최선을 다하는 커닝시티 미용실입니다.',9,22),
('ShopId03','1234',3333333333,'페리온미용실','01011122234','빅토리아아일랜드',
37.590289,126.81632,'최선을 다하는 페리온 미용실입니다.',9,22),
('ShopId04','1234',4444444444,'슬리피우드미용실','01033333333','빅토리아아일랜드',
37.49049,126.93632,'최선을 다하는 슬리피우드 미용실입니다.',9,20),
('ShopId05','1234',5555555555,'엘리니아미용실','01044444444','빅토리아아일랜드',
37.440279,126.99632,'최선을 다하는 엘리니아 미용실입니다.',9,21),
('ShopId06','1234',6666666666,'좌표용','01044444444','빅토리아아일랜드',
37.424279,126.98732,'최선을 다하는 엘리니아 미용실입니다.',9,21),
('ShopId07','1234',7777777777,'좌표용','01044444444','빅토리아아일랜드',
37.488279,126.98632,'최선을 다하는 엘리니아 미용실입니다.',9,21),
('ShopId08','1234',8888888888,'좌표용','01044444444','빅토리아아일랜드',
37.478279,126.98332,'최선을 다하는 엘리니아 미용실입니다.',9,21)
;


insert into COMMENT (co_star,co_content,co_name,co_title,use_uid,sh_uid) values 
('4','민교 머리잘랐다 ~','임민교','엘리니아 미용실-컷트',1,1),
('4','민교 머리 두번자른다','임민교','커닝시티 미용실 - 컷트',1,2),
('5','민교 머리 염색한다','임민교','엘리니아 미용실 - 염색',2,1),
('5','민교 머리 볶았다ㅏㅏ','임민교','커닝시티 미용실 - 파마',2,2),
('4','민교 머리 풤~햇다','임민교','엘리니아 미용실 - 파마',1,1)
;

INSERT INTO DESIGNER
(de_name,de_position,de_career,de_major,de_picture,sh_uid)
VALUES('디자이너1', '점장', 15, '염색', '1', 1),
('디자이너2','디자이너', 3, '커트', '1', 1),
('디자이너2','원장', 30, '파마', '1', 1);


INSERT INTO SERVICE
(ser_name,ser_price,ser_time,sh_uid)
VALUES('염색', 100000, 3, 1),
('파마', 100000, 4, 1),
('컷트', 100000, 1, 1);


insert into book ( bo_service,bo_stat,bo_comment,use_uid,sh_uid)
values
('test01_service',1,'취소사유01',1,1),
('test02_service',1, '취소사유02',1, 2),
('test03_service',1, '취소사유02',1, 2),
('test04_service',1, '취소사유02',1, 2),
('test05_service',2, '취소사유02',1, 2),
('test06_service',2, '취소사유02',1, 2),
('test07_service',2, '취소사유02',1, 2),
('test08_service',2, '취소사유02',1, 2),
('test09_service',3, '취소사유02',1, 2),
('test10_service',3, '취소사유02',1, 2),
('test11_service',3, '취소사유02',1, 2),
('test12_service',3, '취소사유02',1, 2)
;

/*페이징 위해서 코멘트양 늘리기*/


INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

select * from shop;

select * from user;


