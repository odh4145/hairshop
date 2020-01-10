package com.join.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ShopJoinDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public ShopJoinDAO() {
		try {
			Class.forName(UserJoinInterface.DRIVER);
			conn = DriverManager.getConnection(ShopJoinInterface.URL, ShopJoinInterface.USERID, ShopJoinInterface.USERPW);
			System.out.println("ShopJoinDAO 객체 생성, 데이터베이스 연결");
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
	
	// 매장 회원가입
	// 아이디, 비밀번호, 사업자번호, 매장이름, 매장 전화번호, 매장주소, 위도, 경도
	// INSERT
	public int ShopJoin(ShopJoinDTO dto) throws SQLException {
		String sh_id = dto.getSh_id();
		String sh_pw = dto.getSh_pw();
		String sh_no_id = dto.getSh_no_id();
		String sh_name = dto.getSh_name();
		String sh_telephone = dto.getSh_telephone();
		String sh_location = dto.getSh_location();
		String sh_location_lat = dto.getSh_location_lat();
		String sh_location_lng = dto.getSh_location_lng();
		
		return this.ShopJoin(sh_id, sh_pw, sh_no_id, sh_name, sh_telephone, sh_location, sh_location_lat, sh_location_lng);
	}

	public int ShopJoin(String sh_id, String sh_pw, String sh_no_id, String sh_name, String sh_telephone,
			String sh_location, String sh_location_lat, String sh_location_lng) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(ShopJoinInterface.JOIN_SHOP_INSERT);
			pstmt.setString(1, sh_id);
			pstmt.setString(2, sh_pw);
			pstmt.setString(3, sh_no_id);
			pstmt.setString(4, sh_name);
			pstmt.setString(5, sh_telephone);
			pstmt.setString(6, sh_location);
			pstmt.setString(7, sh_location_lat);
			pstmt.setString(8, sh_location_lng);
			
			System.out.println("정보 저장 성공");
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return cnt;
	}
	
	
	

	
	
	
}
	
	
	
	
	
	
	
	
	
	
