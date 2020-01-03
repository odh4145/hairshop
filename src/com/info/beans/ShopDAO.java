package com.info.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.info.beans.*;

public class ShopDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ShopDAO() {
		try {
			Class.forName(infoInterface.DRIVER);
			conn = DriverManager.getConnection(infoInterface.URL, infoInterface.USERID, infoInterface.USERPW);
			System.out.println("ShppDAO 객체 생성, 데이터베이스 연결");
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
	
	// ResultSet --> DTO 배열로 변환 리턴
	public ShopDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ShopDTO> list = new ArrayList<ShopDTO>();
		
		while(rs.next()){
			int sh_uid = rs.getInt("sh_uid");
			String sh_name = rs.getString("sh_name");
			String sh_telephone = rs.getString("sh_telephone");
			String sh_location = rs.getString("sh_location");
			String sh_hello = rs.getString("sh_hello");
			String sh_picture1 = rs.getString("sh_picture1");
			String sh_picture2 = rs.getString("sh_picture2");
			String sh_picture3 = rs.getString("sh_picture3");
			int sh_dayoff1 = rs.getInt("sh_dayoff1");
			int sh_dayoff2 = rs.getInt("sh_dayoff2");
			int sh_starttime = rs.getInt("sh_starttime");
			int sh_endtime = rs.getInt("sh_endtime");
			
			ShopDTO dto = new ShopDTO(sh_uid, sh_name, sh_telephone, 
					sh_location, sh_hello, sh_picture1, sh_picture2, sh_picture3,
					sh_dayoff1, sh_dayoff2, sh_starttime, sh_endtime);
			list.add(dto);			
		}
		
		int size = list.size();
		ShopDTO [] arr = new ShopDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 매장정보 읽어오기 
	public ShopDTO [] select(int sh_uid) throws SQLException {
		ShopDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(infoInterface.STORE_SELECT_BY_UID);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}			
		return arr;
	}
	
	// 매장정보 수정하기
	public int update(int sh_uid, String sh_name, String sh_telephone, String sh_location, 
				String sh_hello, String sh_picture1, String sh_picture2, String sh_picture3,
				int sh_dayoff1, int sh_dayoff2, int sh_starttime, int sh_endtime) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.STORE_UPDATE);
			pstmt.setString(1, sh_name);
			pstmt.setString(2, sh_telephone);
			pstmt.setString(3, sh_location);
			pstmt.setString(4, sh_hello);
			pstmt.setString(5, sh_picture1);
			pstmt.setString(6, sh_picture2);
			pstmt.setString(7, sh_picture3);
			pstmt.setInt(8, sh_dayoff1);
			pstmt.setInt(9, sh_dayoff2);
			pstmt.setInt(10, sh_starttime);
			pstmt.setInt(11, sh_endtime);
			pstmt.setInt(12, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
} // end class






