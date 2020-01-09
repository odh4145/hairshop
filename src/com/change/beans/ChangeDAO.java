package com.change.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChangeDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public ChangeDAO() {
		try {
			Class.forName(changeUserInterface.DRIVER);
			conn = DriverManager.getConnection(changeUserInterface.URL, changeUserInterface.USERID, changeUserInterface.USERPW);
			System.out.println("JoinDAO 객체 생성, 데이터베이스 연결");
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
		System.out.println("DB 자원반납");
	}
	
	public ChangeDTO [] chkPw(ChangeDTO dto) throws SQLException {
		int use_uid = dto.getUse_uid();
		String use_pw = dto.getUse_pw();
		
		return this.chkPw(use_uid, use_pw);
	}

	public ChangeDTO[] chkPw(int use_uid, String use_pw) throws SQLException {
		ChangeDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(changeUserInterface.CHANGE_USER_INFO);
			pstmt.setInt(1, use_uid);
			rs = pstmt.executeQuery();
			System.out.println("쿼리문 실행");
			arr = createArray(rs);
			
		} finally {
			close();
		}
		
		return arr;
	}
	
	public ChangeDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ChangeDTO> list = new ArrayList<ChangeDTO>();
		
		while(rs.next()) {
			int use_uid = rs.getInt("use_uid");
			String use_id = rs.getString("use_id");
			String use_pw = rs.getString("use_pw");
			String use_name = rs.getString("use_name");
			
			ChangeDTO dto = new ChangeDTO(use_uid, use_id, use_pw, use_name);
			list.add(dto);
		}
		int size = list.size();
		ChangeDTO [] arr = new ChangeDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	
	
	
	
	
	
	
	
	
	
}
