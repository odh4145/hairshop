package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.A;



public class WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public WriteDAO() {
		
		try {
			Class.forName(A.DRIVER);
			conn = DriverManager.getConnection(A.URL, A.USERID, A.USERPW);
			System.out.println("WriteDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// 새글 작성 <-- 제목, 내용, 작성자
	// INSERT
	public int insert(WriteDTO dto) throws SQLException {
		int co_star = dto.getco_star();
		String co_name = dto.getco_name();
		String co_title = dto.getco_title();
		String co_content = dto.getco_content();
		
		
		return this.insert(co_star,co_name,co_title, co_content);
	}
		public int insert(int co_star, String co_name, String co_title, String co_content) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_WRITE_INSERT);
			pstmt.setInt(1, co_star);
			pstmt.setString(2, co_name);
			pstmt.setString(3, co_title);
			pstmt.setString(4, co_content);
			
			 cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// ResultSet --> DTO 배열로 변환 리턴
	public WriteDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()){
			int co_uid = rs.getInt("co_uid");
			int co_star = rs.getInt("co_star");
			String co_name = rs.getString("co_name");
			String co_title = rs.getString("co_title");
			String co_content = rs.getString("co_content");
			if(co_content == null) co_content = "";
			int bo_uid = rs.getInt("bo_uid");
			Date d = rs.getDate("co_regdate");
			Time t = rs.getTime("co_regdate");
			String co_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
							+ new SimpleDateFormat("hh:mm:ss").format(t);
			String de_name = rs.getString("de_name");
			String bo_service = rs.getString("bo_service");
			int use_uid = rs.getInt("use_uid");
			int sh_uid = rs.getInt("sh_uid");
//			int re_uid = rs.getInt("re_uid");
//			int de_uid = rs.getInt("de_uid");
//			String re_content = rs.getString("re_content");
//			if(re_content == null) re_content = "";
//			Date d2 = rs.getDate("re_regdate");
//			Time t2 = rs.getTime("re_regdate");
//			String re_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
//							+ new SimpleDateFormat("hh:mm:ss").format(t);
//			
//			WriteDTO dto = new WriteDTO(co_uid,bo_uid, co_star, co_name,co_title, co_content,co_regdate, de_name,bo_service,re_uid, de_uid, re_content,re_regdate);
			WriteDTO dto = new WriteDTO(co_uid,bo_uid, co_star, co_name,co_title, co_content,co_regdate, de_name,bo_service,use_uid, sh_uid);
			list.add(dto);			
		}
		
		int size = list.size();
		WriteDTO [] arr = new WriteDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기
	// SELECT 
	public WriteDTO [] select(int sh_uid) throws SQLException {
		WriteDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(A.SQL_WRITE_SELECT);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	}
	
	// 특정 uid 의 글만 읽어오기
	public WriteDTO [] selectByUid(int co_uid) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, co_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}	
		
		return arr;
	}

	
	// 특정 uid 의 글을 삭제하기
	// DELETE
	public int deleteByUid(int co_uid) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(A.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, co_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	
	}
	
	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int co_star, String co_content, int co_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(A.SQL_WRITE_UPDATE);
			pstmt.setInt(1, co_star);
			pstmt.setString(2, co_content);
			pstmt.setInt(3, co_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}


	
//	// 페이징 
//	
	// 몇번째 from  부터 몇개 rows 를 SELECT
	public WriteDTO [] selectFromRow(int sh_uid, int from, int rows) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SELECT_FROM_ROW);			
			pstmt.setInt(1, sh_uid);
			pstmt.setInt(2, from);
			pstmt.setInt(3, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		} finally {
			close();
		}
		return arr;
	}
	
	// 총 몇개의 글이 있는지 계산
	public int countAll(int sh_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(A.SQL_COUNT_ALL);		
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			rs.next();  // 첫번째 행의
			cnt = rs.getInt(1);
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	
	
	
//	// 새글 작성
//	// INSERT
//	public int reinsert(WriteDTO dto) throws SQLException {
//
//		String re_content = dto.getre_content();
//	
//		return this.reinsert(re_content);
//	}
//		public int reinsert(String re_content) throws SQLException{
//		int cnt = 0;
//		
//		try {
//			pstmt = conn.prepareStatement(A.SQL_RE_INSERT);
//			pstmt.setString(1, re_content);
//			
//			 cnt = pstmt.executeUpdate();
//		} finally {
//			close();
//		}
//		return cnt;
//	}
//	
//
//		
//	
//	
//	// 특정 uid 의 글만 읽어오기
//	public WriteDTO [] reselectByUid(int co_uid) throws SQLException {
//		WriteDTO[] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(A.SQL_RE_SELECT_BY_UID);
//			pstmt.setInt(1, co_uid);
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		}	
//		
//		return arr;
//	}
//
//	
//	// 특정 uid 의 글을 삭제하기
//	// DELETE
//	public int redeleteByUid(int re_uid) throws SQLException{
//		int cnt = 0;
//		try {
//			pstmt = conn.prepareStatement(A.SQL_RE_DELETE_BY_UID);
//			pstmt.setInt(1,re_uid);
//			cnt = pstmt.executeUpdate();
//		} finally {
//			close();
//		}
//		return cnt;
//	
//	}
//	
//	// 특정 uid 의 글을 수정하기 --> 제목, 내용
//	// UPDATE
//	public int reupdate(String re_content, int re_uid) throws SQLException {
//		int cnt = 0;
//		try {
//			pstmt = conn.prepareStatement(A.SQL_RE_UPDATE_BY_UID);
//			
//			pstmt.setString(1, re_content);
//			pstmt.setInt(2, re_uid);
//			
//			cnt = pstmt.executeUpdate();
//		} finally {
//			close();
//		}
//		
//		return cnt;
//	}
//	
	




	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	} // end class



















