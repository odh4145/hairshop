package com.info.beans;

public interface infoInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 매장 정보
	public static final String STORE_SELECT_BY_UID = 
			"SELECT * FROM SHOP WHERE sh_uid=?";
	
	public static final String STORE_UPDATE = 
			"UPDATE SHOP SET"
			+ "sh_name = ?,"
			+ "sh_telephone = ?,"
			+ "sh_location = ?,"
			+ "sh_hello = ?,"
			+ "sh_picture1 = ?,"
			+ "sh_picture2 = ?,"
			+ "sh_picture3 = ?,"
			+ "sh_dayoff1 = ?,"
			+ "sh_dayoff2 = ?,"
			+ "sh_starttime = ?,"
			+ "sh_endtime = ? "
			+ "WHERE sh_uid = ?";
	
	// 디자이너 
	public static final String DESIGNER_INSERT = 
			"INSERT INTO DESIGNER"
			+ "(de_name, de_position, de_career, de_major, de_picture, sh_uid)"
			+ "VALUES"
			+ "(?, ?, ?, ?, ?, ?)";
	
	// 선택된 디자이너의 정보를 보기 위해
	public static final String DESIGNER_SELECT_BY_UID = 
			"SELECT * FROM DESIGNER WHERE de_uid=?";
	
	// 매장별 디자이너 목록 보기위해
	public static final String DESIGNER_SELECT_BY_SH_UID = 
			"SELECT * FROM DESIGNER WHERE sh_uid=?";
	
	public static final String DESIGNER_SELECT_PICTURE = 
			"SELECT de_picture FROM DESIGNER WHERE de_uid=?";
	
	public static final String DESIGNER_DELETE = 
			"DELETE FROM DESIGNER WHERE de_uid = ?";

	public static final String DESIGNER_UPDATE =
			"UPDATE DESIGNER SET "
			+ "de_name = ?,"
			+ "de_position = ?,"
			+ "de_career = ?,"
			+ "de_major = ?,"
			+ "de_picture = ?"
			+ "WHERE de_uid = ?";
	
	// 시술목록
	public static final String SERVICE_INSERT = 
			"INSERT INTO SERVICE"
			+ "(ser_name, ser_price, ser_time, sh_uid)"
			+ "VALUES"
			+ "(?, ?, ?, ?)";
	
	public static final String SERVICE_SELECT_BY_UID =
			"SELECT * FROM SERVICE WHERE ser_uid=?";
		
	public static final String SERVICE_SELECT_BY_SH_UID = 
			"SELECT * FROM SERVICE WHERE sh_uid=?";
		
	public static final String SERVICE_DELETE = 
			"DELETE FROM SERVICE WHERE ser_uid = ?";

	public static final String SERVICE_UPDATE =
			"UPDATE SERVICE SET"
			+ "ser_name = ?,"
			+ "ser_price = ?,"
			+ "ser_time = ? "
			+ "WHERE de_uid = ?";
}


