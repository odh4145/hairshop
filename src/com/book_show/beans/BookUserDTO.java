package com.book_show.beans;

import common.K;

public class BookUserDTO implements K {
// book
	private int bo_uid; 
	private String bo_service;
	private int bo_stat; 
	private String bo_time;
	private String bo_comment;
// designer----------------------------
	private int de_uid;
	private int sh_uid;
	private String de_name;
	private String de_position;
	private int de_career;
	private String de_major;
	private String de_picture;
// user--------------------------------
	private int use_uid; 
	private String use_id;
	private String use_pw;
	private String use_name;
	private String use_phoneNum;
	private int num_identify;
// service-----------------------------
	private int ser_uid;
	private String ser_name;
	private int ser_price;
	private String ser_time;
	
	public BookUserDTO() {
		super();
	}

	public BookUserDTO(int bo_uid, String bo_service, int bo_stat, String bo_time, String bo_comment, int de_uid,
			int sh_uid, String de_name, String de_position, int de_career, String de_major, String de_picture,
			int use_uid, String use_id, String use_pw, String use_name, String use_phoneNum, int num_identify,
			int ser_uid, String ser_name, int ser_price, String ser_time) {
		super();
		this.bo_uid = bo_uid;
		this.bo_service = bo_service;
		this.bo_stat = bo_stat;
		this.bo_time = bo_time;
		this.bo_comment = bo_comment;
		this.de_uid = de_uid;
		this.sh_uid = sh_uid;
		this.de_name = de_name;
		this.de_position = de_position;
		this.de_career = de_career;
		this.de_major = de_major;
		this.de_picture = de_picture;
		this.use_uid = use_uid;
		this.use_id = use_id;
		this.use_pw = use_pw;
		this.use_name = use_name;
		this.use_phoneNum = use_phoneNum;
		this.num_identify = num_identify;
		this.ser_uid = ser_uid;
		this.ser_name = ser_name;
		this.ser_price = ser_price;
		this.ser_time = ser_time;
	}





	public int getBo_uid() {
		return bo_uid;
	}

	public void setBo_uid(int bo_uid) {
		this.bo_uid = bo_uid;
	}

	public String getBo_service() {
		return bo_service;
	}

	public void setBo_service(String bo_service) {
		this.bo_service = bo_service;
	}

	public int getBo_stat() {
		return bo_stat;
	}

	public void setBo_stat(int bo_stat) {
		this.bo_stat = bo_stat;
	}

	public String getBo_time() {
		return bo_time;
	}

	public void setBo_time(String bo_time) {
		this.bo_time = bo_time;
	}

	public String getBo_comment() {
		return bo_comment;
	}

	public void setBo_comment(String bo_comment) {
		this.bo_comment = bo_comment;
	}

	public int getDe_uid() {
		return de_uid;
	}

	public void setDe_uid(int de_uid) {
		this.de_uid = de_uid;
	}

	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public String getDe_name() {
		return de_name;
	}

	public void setDe_name(String de_name) {
		this.de_name = de_name;
	}

	public String getDe_position() {
		return de_position;
	}

	public void setDe_position(String de_position) {
		this.de_position = de_position;
	}

	public int getDe_career() {
		return de_career;
	}

	public void setDe_career(int de_career) {
		this.de_career = de_career;
	}

	public String getDe_major() {
		return de_major;
	}

	public void setDe_major(String de_major) {
		this.de_major = de_major;
	}

	public String getDe_picture() {
		return de_picture;
	}

	public void setDe_picture(String de_picture) {
		this.de_picture = de_picture;
	}

	public int getUse_uid() {
		return use_uid;
	}

	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}

	public String getUse_id() {
		return use_id;
	}

	public void setUse_id(String use_id) {
		this.use_id = use_id;
	}

	public String getUse_pw() {
		return use_pw;
	}

	public void setUse_pw(String use_pw) {
		this.use_pw = use_pw;
	}

	public String getUse_name() {
		return use_name;
	}

	public void setUse_name(String use_name) {
		this.use_name = use_name;
	}

	public String getUse_phoneNum() {
		return use_phoneNum;
	}

	public void setUse_phoneNum(String use_phoneNum) {
		this.use_phoneNum = use_phoneNum;
	}

	public int getnum_identify() {
		return num_identify;
	}

	public void setnum_identify(int num_identify) {
		this.num_identify = num_identify;
	}

	public int getSer_uid() {
		return ser_uid;
	}

	public void setSer_uid(int ser_uid) {
		this.ser_uid = ser_uid;
	}

	public String getSer_name() {
		return ser_name;
	}

	public void setSer_name(String ser_name) {
		this.ser_name = ser_name;
	}

	public int getSer_price() {
		return ser_price;
	}

	public void setSer_price(int ser_price) {
		this.ser_price = ser_price;
	}

	public String getSer_time() {
		return ser_time;
	}

	public void setSer_time(String ser_time) {
		this.ser_time = ser_time;
	}

	
}
