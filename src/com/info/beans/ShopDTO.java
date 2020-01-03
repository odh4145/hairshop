package com.info.beans;

public class ShopDTO {
	private int sh_uid;
	private String sh_name;
	private String sh_telephone;
	private String sh_location;
	private String sh_hello;
	private String sh_picture1;
	private String sh_picture2;
	private String sh_picture3;
	private int sh_dayoff1;
	private int sh_dayoff2;
	private int sh_starttime;
	private int sh_endtime;
	
	// 기본생성자
	public ShopDTO() {	
		super();
		System.out.println("ShopDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public ShopDTO(int sh_uid, String sh_name, String sh_telephone, String sh_location, 
			String sh_hello, String sh_picture1, String sh_picture2, String sh_picture3, 
			int sh_dayoff1, int sh_dayoff2, int sh_starttime, int sh_endtime) {
		super();
		this.sh_uid = sh_uid;
		this.sh_name = sh_name;
		this.sh_telephone = sh_telephone;
		this.sh_location = sh_location;
		this.sh_hello = sh_hello;
		this.sh_picture1 = sh_picture1;
		this.sh_picture2 = sh_picture2;
		this.sh_picture3 = sh_picture3;
		this.sh_dayoff1 = sh_dayoff1;
		this.sh_dayoff2 = sh_dayoff2;
		this.sh_starttime = sh_starttime;
		this.sh_endtime = sh_endtime;
		System.out.println("sh_uid : " + this.sh_uid + " 객체 생성");
	}
	
	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}

	public String getSh_telephone() {
		return sh_telephone;
	}

	public void setSh_telephone(String sh_telephone) {
		this.sh_telephone = sh_telephone;
	}
	
	public String getSh_loacation() {
		return sh_location;
	}

	public void setSh_location(String sh_location) {
		this.sh_location = sh_location;
	}
	
	public String getSh_hello() {
		return sh_hello;
	}

	public void setSh_hello(String sh_hello) {
		this.sh_hello = sh_hello;
	}
	
	public String getSh_picture1() {
		return sh_picture1;
	}

	public void setSh_picture1(String sh_picture1) {
		this.sh_picture1 = sh_picture1;
	}

	public String getSh_picture2() {
		return sh_picture2;
	}

	public void setSh_picture2(String sh_picture2) {
		this.sh_picture2 = sh_picture2;
	}

	public String getSh_picture3() {
		return sh_picture3;
	}

	public void setSh_picture3(String sh_picture3) {
		this.sh_picture3 = sh_picture3;
	}

	public int getSh_dayoff1() {
		return sh_dayoff1;
	}

	public void setSh_dayoff1(int sh_dayoff1) {
		this.sh_dayoff1 = sh_dayoff1;
	}

	public int getSh_dayoff2() {
		return sh_dayoff2;
	}

	public void setSh_dayoff2(int sh_dayoff2) {
		this.sh_dayoff2 = sh_dayoff2;
	}

	public int getSh_starttime() {
		return sh_starttime;
	}

	public void setSh_starttime(int sh_starttime) {
		this.sh_starttime = sh_starttime;
	}

	public int getSh_endtime() {
		return sh_endtime;
	}

	public void setSh_endtime(int sh_endtime) {
		this.sh_endtime = sh_endtime;
	}

	// 디버깅용
	@Override
	public String toString() {
		return "ShopDTO ] " + sh_uid + ":" + sh_name + ":" + sh_telephone + ":" +  
				sh_picture1 + ":" + sh_picture2 + ":" + sh_picture3 +  ":" + 
				sh_location + ":" + sh_hello + ":" + sh_dayoff1 + ":" +  
				sh_dayoff2 + ":" + sh_starttime + ":" + sh_endtime;
	}
	
}








