package com.login.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class LoginDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public LoginDAO() {
		try {
			Class.forName(loginInterface.DRIVER);
			conn = DriverManager.getConnection(loginInterface.URL, loginInterface.USERID, loginInterface.USERPW);
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
	}
	
	public int chkLogin(LoginDTO dto) throws SQLException{
		String use_id = dto.getUse_id();
		String use_pw = dto.getUse_pw();
		
		return this.chkLogin(use_id, use_pw);
	}
	
	public int chkLogin(String use_id, String use_pw) throws SQLException{
		String dbPw;
		int cnt = -1;
		
		try {
			pstmt = conn.prepareStatement(loginInterface.FIND_PASSWORD_SELECT);
			pstmt.setString(1, "use_id");
			rs = pstmt.executeQuery();
			
			
			dbPw = rs.getString("use_pw");
			if(dbPw == null) {
				cnt = -1;
			}
			if(dbPw.equals(use_pw)) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		} finally {
			close();
		}
		
		return cnt;

	}
	
}







//// ResultSet --> DTO 배열로 변환 리턴
//public LoginDTO [] createArray(ResultSet rs) throws SQLException {
//	ArrayList<LoginDTO> list = new ArrayList<LoginDTO>();
//		
//	while(rs.next()){
//		int use_uid = rs.getInt("use_uid");
//		String use_id = rs.getString("use_id");
//		String use_pw = rs.getString("use_pw");
//		String use_name = rs.getString("use_name");
//		String use_phoneNum = rs.getString("use_phoneNum");
//		
//		LoginDTO dto = new LoginDTO(use_uid, use_id, use_pw);
//		list.add(dto);
//	}
//	
//	int size = list.size();
//	LoginDTO [] arr = new LoginDTO[size];
//	list.toArray(arr);
//	return arr;
//}
//
//// 손님 로그인
//// 아이디, 비밀번호
//public LoginDTO [] select(String use_id, String use_pw) throws SQLException {
//	LoginDTO [] arr = null;
//	
//	try {
//		pstmt = conn.prepareStatement(loginInterface.LOGIN_USER_SELECT);
//		pstmt.setString(1, use_id);
//		pstmt.setString(2, use_pw);
//		rs = pstmt.executeQuery();
//		
//		if(rs.next()) {
//			String use_name = rs.getString("use_name");
//			String use_phoneNum = rs.getString("use_phoneNum");
//			
//		}
//		
//		arr = createArray(rs);
//		
//	} finally {
//		close();
//	}
//	return arr;
//}








// https://m.blog.naver.com/PostView.nhn?blogId=bignose7171&logNo=30137417773&proxyReferer=https%3A%2F%2Fwww.google.com%2F
