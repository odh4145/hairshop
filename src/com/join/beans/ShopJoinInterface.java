package com.join.beans;

public interface ShopJoinInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 매장 회원가입
	public static final String JOIN_SHOP_INSERT = 
			"INSERT INTO SHOP"
			+ "(sh_id, sh_pw, sh_no_id, sh_name, sh_telephone, sh_location, "
			+ "sh_location_lat, sh_location_lng)"
			+ "VALUES"
			+ " (?, ?, ?, ?, ?, ?, ?, ?)";
}
