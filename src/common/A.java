package common;

public interface A {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 게시글 관련 쿼리문
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO comment"
			+ "(bo_uid, co_star,co_name,co_title, co_content) "
			+ "VALUES( 1, ?, ?, ?, ?)";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM comment ORDER BY co_uid DESC";
	
	public static final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT * FROM comment WHERE co_uid=?";
	
	public static final String SQL_WRITE_DELETE_BY_UID = 
			"DELETE FROM comment WHERE co_uid = ?";

	public static final String SQL_WRITE_UPDATE =
			"UPDATE comment SET  co_star = ?, co_content = ? WHERE co_uid = ?";
	
	public static final String SQL_RE_INSERT=
			"INSERT INTO reply"
			+ "(co_uid, re_uid, re_content,re_regdate)"
			+ "VALUES(1, 1,?,now())";
	
	public static final String SQL_RE_SELECT_BY_UID=
			"SELECT * FROM reply WHERE co_uid= ? ORDER BY re_uid ASC";
	
	public static final String SQL_RE_UPDATE_BY_UID=
			"UPDATE re_content SET reply = ? WHERE re_uid = ?";
	
	public static final String SQL_RE_DELETE_BY_UID =
			"DELETE FROM reply WHERE re_uid = ?";
			
			

}