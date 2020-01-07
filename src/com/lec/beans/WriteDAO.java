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
//		int bo_uid = dto.getbo_uid();
		int co_star = dto.getco_star();
		String co_name = dto.getco_name();
		String co_title = dto.getco_title();
		String co_content = dto.getco_content();
		
		
//		return this.insert(bo_uid,co_star,co_name,co_title, co_content);
		return this.insert(co_star,co_name,co_title, co_content);
	}
		public int insert(int co_star, String co_name, String co_title, String co_content) throws SQLException{
//			public int insert( int bo_uid, int co_star, String co_name, String co_title, String co_content) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_WRITE_INSERT);
//			pstmt.setInt(1, bo_uid);
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
//			String de_name = rs.getString("de_name");
//			String bo_service = rs.getString("bo_service");
			WriteDTO dto = new WriteDTO(co_uid,bo_uid, co_star, co_name,co_title, co_content,co_regdate);
			list.add(dto);			
		}
		
		int size = list.size();
		WriteDTO [] arr = new WriteDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기
	// SELECT 
	public WriteDTO [] select() throws SQLException {
		WriteDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(A.SQL_WRITE_SELECT);
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
	
	
	
} // end class

















