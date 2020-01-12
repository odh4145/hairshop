package common;

public interface A {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 게시글 관련 쿼리문(작성)
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO comment"
			+ "(use_uid, sh_uid, co_star,co_name,co_title, co_content) "
			+ "VALUES(? ,? ,?, ?, ?, ?)";
	
	//(리스트)
	public static final String SQL_WRITE_SELECT = 
			"select * from comment where sh_uid = ? order by co_uid";

	//(view 상세)
	public static final String SQL_WRITE_SELECT_BY_UID = 
			// sql에 있다 
			"SELECT * FROM ((comment c join user u) join book b) join shop s
			where c.use_uid = u.use_uid and u.use_uid = b.use_uid and s.sh_uid = c.sh_uid and c.co_uid =?";
	
	public static final String SQL_WRITE_DELETE_BY_UID = 
			"DELETE FROM comment WHERE co_uid = ?";

	public static final String SQL_WRITE_UPDATE =
			"UPDATE comment SET  co_star = ?, co_content = ? WHERE co_uid = ?";
	
	// 페이징용 쿼리 준비
		// 쿼리: 글 목록 전체 개수 가져오기
		public static final String SQL_COUNT_ALL = 
				"SELECT count(if(sh_uid=?, sh_uid, null)) FROM comment";
		// 쿼리: from 부터 row 만큼 SELECT : LIMIT 은 0 부터 시작 주의!
		public static final  String SQL_SELECT_FROM_ROW = 
				"select * from comment where sh_uid = ? order by co_uid desc limit ?, ?";
//				"select * from comment order by co_uid DESC LIMIT ?, ?";
	
	
		
	//댓글 구현
	public static final String SQL_RE_INSERT=
			"INSERT INTO reply"
			+ "(co_uid, de_uid, re_content,re_regdate)"
			+ "VALUES(1, 1, ? ,now())";
	
	
	
	public static final String SQL_RE_SELECT_BY_UID=
			"SELECT *,(select de_name from designer) FROM reply WHERE co_uid= ? ORDER BY re_uid =? ASC";
	
//	public static final String SQL_RE_UPDATE_BY_UID=
//			"UPDATE reply SET re_content = ? WHERE re_uid = ?";
	
	public static final String SQL_RE_DELETE_BY_UID =
			"DELETE FROM reply WHERE re_uid = ?";
			
			

}