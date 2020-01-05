package com.lec.beans;

public class WriteDTO {
	
	private int co_uid; //co_uid
//	private int co_star; //co_star
	private String co_star; //co_star
	private int bo_uid; //bo_uid
	private String co_content; // co_content
	private String co_name; // co_name
	private String co_regDate; // co_regdate
	private String dName; //de_name
	private String boService; //bo_service
	
	
	// 기본생성자
	public WriteDTO() {	
		super();
		System.out.println("WriteDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public WriteDTO(int co_uid, String co_star, String co_content, String co_name, int bo_uid, String co_regDate, String dName, String boService) {
		super();
		this.co_uid = co_uid;
		this.co_star = co_star;
		this.co_content = co_content;
		this.co_name = co_name;
		this.bo_uid = bo_uid;
		this.co_regDate = co_regDate;
		this.dName = dName;
		this.boService =boService;
		System.out.println("WriteDTO() 객체 생성");
	}
	
	// getter /setter
	public int getco_uid() {
		return co_uid;
	}

	public void setco_uid(int co_uid) {
		this.co_uid = co_uid;
	}

//	public int getco_star() {
//		return co_star;
//	}
//
//	public void setco_star(int co_star) {
//		this.co_star = co_star;
//	}
	public String getco_star() {
		return co_star;
	}

	public void setco_star(String co_star) {
		this.co_star = co_star;
	}

	
	public String getco_content() {
		return co_content;
	}

	public void setco_content(String co_content) {
		this.co_content = co_content;
	}

	public String getco_name() {
		return co_name;
	}

	public void setco_name(String co_name) {
		this.co_name = co_name;
	}
	public int getbo_uid() {
		return bo_uid;
	}
	
	public void setBUid(int bo_uid) {
		this.bo_uid=bo_uid;
	}

	public String getco_regDate() {
		return co_regDate;
	}

	public void setco_regDate(String co_regDate) {
		this.co_regDate = co_regDate;
	}
	public String getDName() {
		return dName;
	}

	public void setDName(String dName) {
		this.dName = dName;
	}
	public String getBoService() {
		return boService;
	}

	public void setBoService(String boService) {
		this.boService = boService;
	}


}










