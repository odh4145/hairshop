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
			+ "(bo_service, bo_service, bo_start, bo_time, bo_endtime, bo_comment, use_id, de_uid, ser_uid, sh_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	// use_uid로 book 확인
	public static final String SQL_BOOK_SELECT_BY_USER = 
			"SELECT * FROM BOOK WHERE use_uid = ? ORDER BY bo_time DESC";
	
	// sh_uid로 book 확인
	public static final String SQL_BOOK_SELECT_BY_DE_UID = 
			"SELECT * FROM book WHERE de_uid = ?";
	// bo_uid로 book 확인
	public static final String SQL_BOOK_SELECT_BY_BO_UID =
			"SELECT * FROM BOOK WHERE bo_uid = ?";
	// UPDATE --> stat (매장)
	public static final String SQL_BOOK_UPDATE_STAT_BY_SH_UID=
			"UPDATE BOOK SET STAT = ? WHERE sh_uid = ?";
	//DELETE --> USER입장
	public static final String SQL_BOOK_DELETE=
			"DELETE FROM BOOK WHERE bo_uid = ?";
	
	//JOIN 결과 => use_uid 에 따라 받아옴
	public static final String SQL_BOOK_JOIN_=
			"SELECT * FROM book b NATURAL JOIN designer d NATURAL JOIN shop s NATURAL JOIN service c WHERE b.use_uid = ?";
			 
	
}
