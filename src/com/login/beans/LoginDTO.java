package com.login.beans;

public class LoginDTO {
	private int use_uid;
	private String use_id;
	private String use_pw;
	
	
	// 기본 생성자
	public LoginDTO() {
		super();
	}

	// 매개변수 받는 생성자
	public LoginDTO(int use_uid, String use_id, String use_pw) {
		super();
		this.use_uid = use_uid;
		this.use_id = use_id;
		this.use_pw = use_pw;
	}

	// getter / setter
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

	// 디버깅용
	@Override
	public String toString() {
		return "LoginDTO ]" + use_uid + " : " + use_id + " : " + use_pw;
	}
	
	
	
	
}
