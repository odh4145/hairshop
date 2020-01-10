package com.lec.beans;

public class WriteDTO {
	
	private int co_uid; //co_uid
	private int co_star; //co_star
	private int bo_uid; //bo_uid
	private String co_content; // co_content
	private String co_name; // co_name
	private String co_regdate; // co_regdate
	private String co_title; //co_title
	private String de_name; //de_name
	private String bo_service; //bo_service
	private int sh_uid;
	private int use_uid;
	
//	private int re_uid;
//	private int de_uid;
//	private String re_content;
//	private String re_regdate;
//	
	
	
	// 기본생성자
	public WriteDTO() {	
		super();
		System.out.println("WriteDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
//	public WriteDTO(int co_uid, int bo_uid, int co_star, String co_name, String co_title, String co_content,  String co_regdate,String de_name, String bo_service,int re_uid, int de_uid, String re_content, String re_regdate ) {
	public WriteDTO(int co_uid, int bo_uid, int co_star, String co_name, String co_title, String co_content,  String co_regdate,String de_name, String bo_service, int use_uid, int sh_uid ) {
		super();
		this.co_uid = co_uid;
		this.co_star = co_star;
		this.co_content = co_content;
		this.co_name = co_name;
		this.bo_uid = bo_uid;
		this.co_regdate = co_regdate;
		this.co_title = co_title;
	    this.de_name = de_name;
		this.bo_service =bo_service;
		this.use_uid= use_uid;
		this.sh_uid = sh_uid;
//		this.re_uid =re_uid;
//		this.de_uid=de_uid;
//		this.re_content= re_content;
//		this.re_regdate =re_regdate;
//		
		System.out.println("WriteDTO() 객체 생성");
	}
	

//	public int getre_uid() {
//		return re_uid;
//	}
//
//	public void setre_uid(int re_uid) {
//		this.re_uid = re_uid;
//	}
//
//	public int getde_uid() {
//		return de_uid;
//	}
//
//	public void setde_uid(int de_uid) {
//		this.de_uid = de_uid;
//	}
//
//	public String getre_content() {
//		return re_content;
//	}
//
//	public void setre_content(String re_content) {
//		this.re_content = re_content;
//	}
//
//	public String getre_regdate() {
//		return re_regdate;
//	}
//
//	public void setre_regdate(String re_regdate) {
//		this.re_regdate = re_regdate;
//	}

	// getter /setter
	public int getco_uid() {
		return co_uid;
	}

	public void setco_uid(int co_uid) {
		this.co_uid = co_uid;
	}

	public int getco_star() {
		return co_star;
	}

	public void setco_star(int co_star) {
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

	public String getco_regdate() {
		return co_regdate;
	}

	public void setco_regdate(String co_regdate) {
		this.co_regdate = co_regdate;
	}
	
	public String getco_title() {
		return co_title;
	}

	public void setco_title(String co_title) {
		this.co_title = co_title;
	}
	
	public String getde_name() {
		return de_name;
	}

	public void setde_name(String de_name) {
		this.de_name = de_name;
	}
	public String getbo_service() {
		return bo_service;
	}

	public void setbo_service(String bo_service) {
		this.bo_service = bo_service;
	}


	public int getsh_uid() {
		return sh_uid;
	}

	public void setsh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public int getuse_uid() {
		return use_uid;
	}

	public void setuse_uid(int use_uid) {
		this.use_uid = use_uid;
	}

	
	
}










