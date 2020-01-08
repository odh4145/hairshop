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
	private String de_picture;
// shop--------------------------------
	private String sh_name;
// service-----------------------------
	private String ser_name;
	private int ser_price;
	private String ser_time;
	
	public BookUserDTO() {
		super();
	}

	public BookUserDTO(int bo_uid, String bo_service, int bo_stat, String bo_time, String bo_comment, int de_uid,
			int sh_uid, String de_name, String de_picture, String sh_name, String ser_name, int ser_price,
			String ser_time) {
		super();
		this.bo_uid = bo_uid;
		this.bo_service = bo_service;
		this.bo_stat = bo_stat;
		this.bo_time = bo_time;
		this.bo_comment = bo_comment;
		this.de_uid = de_uid;
		this.sh_uid = sh_uid;
		this.de_name = de_name;
		this.de_picture = de_picture;
		this.sh_name = sh_name;
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

	public String getDe_picture() {
		return de_picture;
	}

	public void setDe_picture(String de_picture) {
		this.de_picture = de_picture;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
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
