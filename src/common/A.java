package common;

public interface A {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 게시글 관련 쿼리문
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO comment"
			+ "(co_name, co_star, co_content) "
			+ "VALUES( ?, ?, ?)";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM comment,book,designer ORDER BY co_uid DESC";
	
	public static final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT * FROM comment,book,designer WHERE co_uid=?";
	
	public static final String SQL_WRITE_DELETE_BY_UID = 
			"DELETE FROM comment WHERE co_uid = ?";

	public static final String SQL_WRITE_UPDATE =
			"UPDATE comment SET co_name =?, co_star = ?, co_content = ? WHERE co_uid = ?";

}