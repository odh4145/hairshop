package com.book_show.beans;

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

import com.info.beans.BookDTO;

import common.K;

public class BookUserDAO implements K {

	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookUserDAO() {

		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("BooKuserDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("BookUserDAO에서 Exception발생 확인");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}

	// ResultSet => BookUserDTO의 배열로 변환해서 보내주는 메소드
	public BookUserDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookUserDTO> list = new ArrayList<BookUserDTO>();

		while (rs.next()) {
			
			String bo_service = rs.getString("bo_service");
			String bo_comment = rs.getString("bo_comment");
			String ser_name = rs.getString("ser_name");
			String de_name = rs.getString("de_name");
			String de_position = rs.getString("de_position");
			String de_major = rs.getString("de_major");
			String de_picture = rs.getString("de_picture");
			String use_id = rs.getString("use_id");
			String use_pw = rs.getString("use_pw");
			String use_name = rs.getString("use_name");
			String use_phoneNum = rs.getString("use_phoneNum");
			int bo_uid = rs.getInt("bo_uid");
			int bo_stat = rs.getInt("bo_stat");
			int use_uid = rs.getInt("use_uid");
			int de_uid = rs.getInt("de_uid");
			int ser_uid = rs.getInt("ser_uid");
			String ser_time = rs.getString("ser_time");
			int ser_price = rs.getInt("ser_price");
			int sh_uid = rs.getInt("sh_uid");
			int de_career = rs.getInt("de_career");
			int num_identify = rs.getInt("num_identify");

			Date d_time = rs.getDate("bo_time");
			Time t_time = rs.getTime("bo_time");
			String bo_time = new SimpleDateFormat("yyyy-MM-dd").format(d_time) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t_time);

			BookUserDTO dto = new BookUserDTO(bo_uid, bo_service, bo_stat, bo_time, bo_comment, 
					de_uid, sh_uid, de_name, de_position, de_career, de_major, de_picture,
					use_uid, use_id, use_pw, use_name, 
					use_phoneNum, num_identify, ser_uid, ser_name, ser_price, ser_time);
			list.add(dto);
		}
		int size = list.size();
		BookUserDTO[] arr = new BookUserDTO[size];
		list.toArray(arr);

		return arr;
	}
	
	
	// 예약확인하기 (user)
		public BookUserDTO[] select_by_use_uid(int use_uid) throws SQLException {
			BookUserDTO[] arr = null;

			try {
					pstmt = conn.prepareStatement(K.SQL_BOOK_JOIN_);
					pstmt.setInt(1, use_uid);
					rs = pstmt.executeQuery();
					arr = createArray(rs);
			} finally {
				close();
			}

			return arr;
		};
}
