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
import common.K;

public class BookShopDAO implements K {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookShopDAO() {

		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("BooKuserDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

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
	
	public BookShopDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookShopDTO> list = new ArrayList<BookShopDTO>();

		while (rs.next()) {
			String bo_service = rs.getString("bo_service");
			
			int bo_uid = rs.getInt("bo_uid");
			int bo_stat = rs.getInt("bo_stat");
			int sh_uid = rs.getInt("sh_uid");
			Date date_time = rs.getDate("bo_time");
			Time time_time = rs.getTime("bo_time");
			String bo_time = new SimpleDateFormat("yyyy-MM-dd").format(date_time) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(time_time);

			BookShopDTO dto = new BookShopDTO(bo_uid, bo_time, bo_service,
					bo_stat, sh_uid);
			list.add(dto);
		}
		int size = list.size();
		
		BookShopDTO[] arr = new BookShopDTO[size];
		list.toArray(arr);

		return arr;
	}
	// 매장uid로 예약 확인
	public BookShopDTO[] select_by_shop (int shop_uid) throws SQLException{
		BookShopDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_SELECT_BY_SHOP);
			pstmt.setInt(1, shop_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		}finally {
			close();
		}
		return arr;
	};
	
	//stat 변경하기
	public int update_stat (int sh_uid, int stat) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_UPDATE_STAT_BY_SH_UID);
			pstmt.setInt(1, stat);
			pstmt.setInt(2, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
}
