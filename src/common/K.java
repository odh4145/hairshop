package common;

public interface K {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// BOOK 관련 쿼리문
	// 에약을 만들 때 
	public static final String SQL_BOOK_INSERT = 
			"INSERT INTO BOOK"
			+ "(bo_service, bo_time, bo_stat, use_id, sh_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?, ?)";

	// bo_uid 로 book 확인
	public static final String SQL_BOOK_SELECT_BY_BO_UID =
			"SELECT * FROM BOOK WHERE bo_uid = ?";
	// UPDATE --> stat (매장)
	public static final String SQL_BOOK_UPDATE_STAT_BY_SH_UID=
			"UPDATE BOOK SET bo_stat = 2 WHERE bo_uid = ?";
	// sh_uid로 book 확인
	public static final String SQL_BOOK_SELECT_BY_SHOP=
			"SELECT * FROM book WHERE sh_uid = ?;";
	// use_uid book 확인
	public static final String SQL_BOOK_JOIN_=
			"SELECT * FROM book b NATURAL JOIN shop WHERE use_uid = ?";
	//DELETE
	public static final String SQL_BOOK_DELETE_BO_UID=
			"DELETE FROM BOOK WHERE bo_uid = ?";
	// 매장이 취소시 bo_comment update
	/*
	 * public static final String SQL_BOOK_UPDATE_BO_COMMENT=
	 * "UPDATE book SET bo_comment = ? WHERE bo_uid = ?";
	 */
	
}
