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
	bo_time datetime NOT NULL,
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
	co_content text,
	co_name varchar(40) NOT NULL,
	bo_uid int NOT NULL,
	co_regdate datetime NOT NULL DEFAULT now(),
	PRIMARY KEY (co_uid)
);


CREATE TABLE DESIGNER
(
	de_uid int NOT NULL AUTO_INCREMENT,
	de_name varchar(40) NOT NULL,
	de_career int NOT NULL,
	de_major varchar(40) NOT NULL,
	de_pictuer varchar(40),
	sh_uid int NOT NULL,
	PRIMARY KEY (de_uid),
	UNIQUE (sh_uid)
);


CREATE TABLE REPLY
(
	re_uid int NOT NULL AUTO_INCREMENT,
	re_content text,
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
	sh_telephone varchar(11) NOT NULL,
	sh_location varchar(80),
	sh_location_lat varchar(40),
	sh_location_lng varchar(40),
	sh_picture1 varchar(40),
	sh_picture2 varchar(40),
	sh_picture3 varchar(40),
	sh_picture4 varchar(40),
	sh_picture5 varchar(40),
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
	sh_telephone
)
VALUES('store01', '1234', 1111111111, '매장용', '07011111111');

INSERT INTO DESIGNER
(
	de_name,
	de_career,
	de_major,
	sh_uid
)
VALUES('디자이너1', 5, '염색', 1);

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
VALUES('store03', '1234', 33333333333, '매장', '07011111111','보라매동 969-20','37.488356','126.931162');

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
VALUES('store04', '1234', 4444444444, '매장', '07011111111','봉천로7길','37.490859','126.926320');




"SELECT * FROM shop WHERE sh_lat>= 37.470859 and sh_location_lat<= 37.510859 and sh_lng>=126.906320 and sh_lng<= 126.946320"

"SELECT * FROM shop WHERE sh_location_lat>=37.4894413 and sh_location_lat<=37.5294413 and sh_location_lng>=126.926320 and sh_location_lng<=126.966320";

