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
	PRIMARY KEY (de_uid)
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
	sh_id int NOT NULL,
	sh_no_id int NOT NULL,
	sh_location varchar(80) NOT NULL,
	sh_location_lat varchar(40) NOT NULL,
	sh_location_lng varchar(40) NOT NULL,
	sh_picture1 varchar(40),
	sh_picture2 varchar(40),
	sh_picture3 varchar(40),
	sh_picture4 varchar(40),
	sh_picture5 varchar(40),
	sh_dayoff1 int CHECK (sh_dayoff1 >=1 and  sh_dayoff1 <= 7),
	sh_dayoff2 int CHECK(sh_dayoff2>= 1 AND sh_dayoff2<=7),
	sh_starttime int NOT NULL,
	sh_endtime int NOT NULL,
	num_identify int DEFAULT 2,
	PRIMARY KEY (sh_uid),
	UNIQUE (sh_id),
	UNIQUE (sh_no_id)
);


CREATE TABLE USER
(
	use_uid int NOT NULL AUTO_INCREMENT,
	use_id varchar(40) NOT NULL,
	use_pw varchar(40) NOT NULL,
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

/* Sample Data */
INSERT INTO USER(
use_id,
use_pw,
use_name,
use_phoneNum
)
VALUES('test01', '1234', '손님1', '01000000000');

SELECT * FROM USER;

