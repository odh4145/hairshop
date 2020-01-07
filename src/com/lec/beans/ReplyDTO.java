package com.lec.beans;

public class ReplyDTO {
	private int re_uid;
	private int co_uid;
	private String re_content;
	private String re_regdate;
	
	
	public ReplyDTO() {
		super();
		System.out.println("ReplyDTO() 객체 생성");
	}

	public ReplyDTO(int re_uid, int co_uid, String re_content, String re_regdate) {
		super();
		this.re_uid = re_uid;
		this.co_uid = co_uid;
		this.re_content = re_content;
		this.re_regdate = re_regdate;
	}

	public int getRe_uid() {
		return re_uid;
	}

	public void setRe_uid(int re_uid) {
		this.re_uid = re_uid;
	}

	public int getCo_uid() {
		return co_uid;
	}

	public void setCo_uid(int co_uid) {
		this.co_uid = co_uid;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	

}
