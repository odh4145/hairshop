SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS REPLY;
DROP TABLE IF EXISTS COMMENT;
DROP TABLE IF EXISTS BOOK;
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
	use_uid int NOT NULL,
	de_uid int NOT NULL,
	ser_uid int NOT NULL,
	PRIMARY KEY (bo_uid)
);


CREATE TABLE COMMENT
(
	co_uid int NOT NULL AUTO_INCREMENT,
	co_star int NOT NULL,
	co_content text NOT NULL,
	co_name varchar(40) NOT NULL,
	bo_uid int NOT NULL,
	co_regdate datetime NOT NULL DEFAULT now(),
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
	sh_uid int NOT NULL,
	PRIMARY KEY (de_uid)
);


CREATE TABLE REPLY
(
	re_uid int NOT NULL AUTO_INCREMENT,
	re_content text NOT NULL,
	co_uid int NOT NULL,
	re_regdate datetime NOT NULL DEFAULT now(),
	PRIMARY KEY (re_uid)
);


CREATE TABLE SERVICE
(
	ser_uid int NOT NULL AUTO_INCREMENT,
	ser_name varchar(40) NOT NULL,
	ser_price int,
	ser_time time NOT NULL,
	sh_uid int NOT NULL,
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
	sh_picture1 varchar(40),
	sh_picture2 varchar(40),
	sh_picture3 varchar(40),
	sh_dayoff1 int CHECK (sh_dayoff1 >=1 and  sh_dayoff1 <= 7),
	sh_dayoff2 int CHECK(sh_dayoff2>= 1 AND sh_dayoff2<=7),
	sh_starttime int DEFAULT 9,
	sh_endtime int DEFAULT 21,
	num_identify int DEFAULT 2,
	PRIMARY KEY (sh_uid),
	UNIQUE (sh_id),
	UNIQUE (sh_no_id)
);


CREATE TABLE USER
(
	use_uid int NOT NULL AUTO_INCREMENT,
	use_id varchar(40) NOT NULL,
	use_pw varchar(15) NOT NULL,
	use_name varchar(40) NOT NULL,
	use_phoneNum varchar(11) NOT NULL,
	num_identify int DEFAULT 1,
	PRIMARY KEY (use_uid),
	UNIQUE (use_id),
	UNIQUE (use_phoneNum)
);



/* Create Foreign Keys */

ALTER TABLE COMMENT
	ADD FOREIGN KEY (bo_uid)
	REFERENCES BOOK (bo_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (co_uid)
	REFERENCES COMMENT (co_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOOK
	ADD FOREIGN KEY (de_uid)
	REFERENCES DESIGNER (de_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOOK
	ADD FOREIGN KEY (ser_uid)
	REFERENCES SERVICE (ser_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DESIGNER
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SERVICE
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOOK
	ADD FOREIGN KEY (use_uid)
	REFERENCES USER (use_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

/** Sample Data **/
INSERT INTO USER(
	use_id,
	use_pw,
	use_name,
	use_phoneNum
)
VALUES('test01', '1234', '손님용', '01000000000');

INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_hello
)
VALUES('store01', '1234', 1111111111, '매장용', '070-1111-1111', '서울시 강남구 역삼동 1',
'저희 매장을 찾아주셔서 감사합니다. 항상 좋은 서비스로 보답하겠습니다.');

INSERT INTO DESIGNER
(
	de_name,
	de_position,
	de_career,
	de_major,
	de_picture,
	sh_uid
)
VALUES('디자이너1', '점장님', 15, '염색', '1', 1);

INSERT INTO DESIGNER
(
	de_name,
	de_career,
	de_major,
	de_picture,
	sh_uid
)
VALUES('디자이너2', 3, '커트', '1', 1);

INSERT INTO SERVICE
(
	ser_name,
	ser_price,
	ser_time,
	sh_uid
)
VALUES('염색', 100000, 30000, 1);



INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_location_lat,
	sh_location_lng
)
VALUES('store03', '1234', 33333333333, '건대좌표', '07011111111','보라매동 969-20','37.5434924','127.0733933');



INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_location_lat,
	sh_location_lng
)
VALUES('store04', '1234', 4444444444, '신림좌표', '07011111111','봉천로7길','37.490259','126.916320');



INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_location_lat,
	sh_location_lng
)
VALUES('store05', '1234', 55555555, '신림좌표', '07011111111','봉천로7길','37.487159','126.932628');


INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_location_lat,
	sh_location_lng
)
VALUES('store06', '1234', 66666666666, '신림좌표', '07011111111','봉천로7길','37.491858','126.927779');

INSERT INTO SHOP(
	sh_id,
	sh_pw,
	sh_no_id,
	sh_name,
	sh_telephone,
	sh_location,
	sh_location_lat,
	sh_location_lng
)
VALUES('store12', '1234', 71231117, '역삼좌표', '07011111111','봉천로7길','37.511016','127.034426'),
('store08', '1234', 888888888, '역삼좌표', '07011111111','봉천로7길','37.521016','127.099426'),
('store09', '1234', 99999999, '역삼좌표', '07011111111','봉천로7길','37.531016','127.032626'),
('store10', '1234', 101010101, '역삼좌표', '07011111111','봉천로7길','37.525516','127.036626'),
('store11', '1234', 111111112, '역삼좌표', '07011111111','봉천로7길','37.518816','127.039926');

INSERT INTO SERVICE
(
	ser_name,
	ser_price,
	ser_time,
	sh_uid
)
VALUES('커트', 30000, 10000, 1);
select * from shop;
select * from service;
select * from designer;
select * from user;
insert into book (
bo_service, bo_stat, bo_time, bo_comment, use_uid, de_uid, ser_uid
) values ('test_01', 1, now(), 'bo_comment_test_01', 1, 1, 1) ;


select * from `user`;
/*testdata_book*/
insert into book 
(
	bo_service,
	bo_stat,
	bo_time,
	bo_comment,
	use_uid,
	de_uid,
	ser_uid
)
values('test 서비스', 1, now(), 'test comment', 1, 1, 1);
insert into book 
(
	bo_service,
	bo_stat,
	bo_time,
	bo_comment,
	use_uid,
	de_uid,
	ser_uid
)
values('test 서비스2', 2, now(), 'test comment2', 1, 1, 1);
insert into book 
(
	bo_service,
	bo_stat,
	bo_time,
	bo_comment,
	use_uid,
	de_uid,
	ser_uid
)
values('test 서비스3', 3, now(), 'test comment3', 1, 1, 1);


select * from book;
SELECT * FROM DESIGNER WHERE sh_uid=1;
select * from book b natural join shop where b.use_uid = 1;
select * from book b natural join designer d natural join user u natural join service s where b.use_uid = 1 ;
select * from book b natural join designer d natural join shop s  natural join service c where b.use_uid =1;
/* 왜 안뜨는지 모르겠지만 따로 뺴서 해야하나 확인할것 TODO*/
select * from book b 
join designer d on b.de_uid = d.de_uid
join user u on b.use_uid = u.use_id
join service s on b.ser_uid = s.ser_uid
join shop sh on d.sh_uid = sh.sh_uid;
/*de_picture가 null로 들어가니 쿼리문에서 실행 문제가 생김*/

select * from user;

select * from shop;

select * from user where user.use_id = 'test01';

SELECT * FROM USER WHERE use_id='test01';

-- delete from user where use_uid = 3;

-- 특정 id 로 회원 가입을 하려 할때
-- user 의  use_id  이어서도 안되고
-- ship 의  sh_id 이어서도 암됨

-- select
-- 	(select count() from user where use_id = 'store01'),
-- 	(select count() from shop where sh_id = 'store01');

-- select
-- 	(select count() from user where use_phoneNum = '01000000000'),
-- 	(select count() from shop where sh_telephone = 'store01');

select * from user where use_id='test01';


UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]


uid >> 2
uid2인사람의 비밀번호 바꾸기 

-- update user set use_pw = '?' where use_uid = '?';

select * from user where use_uid=2;
	
update user set use_pw = ? where use_uid = ?
