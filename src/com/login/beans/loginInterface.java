package com.login.beans;

public interface loginInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 손님 로그인
	public static final String LOGIN_USER_SELECT = 
			"SELECT * FROM USER WHERE use_id=? AND use_pw=?";
	
	
	public static final String FIND_PASSWORD_SELECT = 
			"SELECT use_pw from USER WHERE use_id=?";
}
