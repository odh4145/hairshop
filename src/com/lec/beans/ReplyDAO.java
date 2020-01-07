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

	
	public class ReplyDAO {
		Connection conn;
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		
		// DAO 객체가 생성될때 Connection 도 생성된다!
		public ReplyDAO() {
			
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
		
		
		// 새글 작성
		// INSERT
		public int insert(ReplyDTO dto) throws SQLException {

			String re_content = dto.getRe_content();
		
			return this.insert(re_content);
		}
			public int insert(String re_content) throws SQLException{
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(A.SQL_RE_INSERT);
				pstmt.setString(1, re_content);
				
				 cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			return cnt;
		}
		
		// ResultSet --> DTO 배열로 변환 리턴
		public ReplyDTO [] createArray(ResultSet rs) throws SQLException {
			ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
			
			while(rs.next()){
				int co_uid = rs.getInt("co_uid");
				int re_uid = rs.getInt("re_uid");
				String re_content = rs.getString("re_content");
				if(re_content == null) re_content = "";
				Date d = rs.getDate("re_regdate");
				Time t = rs.getTime("re_regdate");
				String re_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
								+ new SimpleDateFormat("hh:mm:ss").format(t);
				ReplyDTO dto2 = new ReplyDTO(co_uid,re_uid, re_content,re_regdate);
				list.add(dto2);			
			}
			
			int size = list.size();
			ReplyDTO[] arr2 = new ReplyDTO[size];
			list.toArray(arr2);
			return arr2;
		}
		
		// 글 목록 읽어오기
		// SELECT 
		public ReplyDTO [] select() throws SQLException {
			ReplyDTO[] arr2 = null;
			try {			
				pstmt = conn.prepareStatement(A.SQL_WRITE_SELECT);
				rs = pstmt.executeQuery();
				arr2 = createArray(rs);
			} finally {
				close();
			}		
			return arr2;
		}
		
		// 특정 uid 의 글만 읽어오기
		public ReplyDTO [] selectByUid(int re_uid) throws SQLException {
			ReplyDTO[] arr2 = null;
			
			try {
				pstmt = conn.prepareStatement(A.SQL_RE_SELECT_BY_UID);
				pstmt.setInt(1, re_uid);
				rs = pstmt.executeQuery();
				arr2 = createArray(rs);
			} finally {
				close();
			}	
			
			return arr2;
		}

		
		// 특정 uid 의 글을 삭제하기
		// DELETE
		public int deleteByUid(int re_uid) throws SQLException{
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(A.SQL_RE_DELETE_BY_UID);
				pstmt.setInt(1,re_uid);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			return cnt;
		
		}
		
		// 특정 uid 의 글을 수정하기 --> 제목, 내용
		// UPDATE
		public int update(String re_content) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(A.SQL_RE_UPDATE_BY_UID);
				
				pstmt.setString(1, re_content);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			
			return cnt;
		}
		
		
	
	
	
	}
