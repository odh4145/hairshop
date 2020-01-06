package com.info.beans;

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
import com.info.beans.DesignerDAO;

public class BookDAO implements K {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookDAO() {

		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("WriteDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
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

	// ResultSet => DTO_book의 배열로 변환해서 보내주는 메소드
	public BookDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();

		while (rs.next()) {
			int bo_uid = rs.getInt("bo_uid");
			String service = rs.getString("bo_service");
			int stat = rs.getInt("bo_stat");
			String comment = rs.getString("bo_comment");
			int use_uid = rs.getInt("use_uid");
			int de_uid = rs.getInt("de_uid");
			int ser_uid = rs.getInt("ser_uid");

			Date d_time = rs.getDate("bo_time");
			Time t_time = rs.getTime("bo_time");
			String time = new SimpleDateFormat("yyyy-MM-dd").format(d_time) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t_time);

			BookDTO dto = new BookDTO(bo_uid, service, stat, time, comment, use_uid, de_uid, ser_uid);
			list.add(dto);
		}
		int size = list.size();
		BookDTO[] arr = new BookDTO[size];
		list.toArray(arr);

		return arr;
	}

	public int insert(BookDTO dto) throws SQLException {

		String service = dto.getBo_service();
		int stat = dto.getBo_stat();
		String time = dto.getBo_time();
		String comment = dto.getBo_comment();
		int use_uid = dto.getUse_uid();
		int de_uid = dto.getDe_uid();
		int ser_uid = dto.getSer_uid();

		return this.insert(service, stat, time, comment, use_uid, de_uid, ser_uid);
	}

	// 예약하기
	public int insert(String service, int stat, String time, String comment, int use_uid, int de_uid, int ser_uid)
			throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_INSERT);
			pstmt.setString(1, service);
			pstmt.setInt(2, stat);
			pstmt.setString(3, time); // TODO
			pstmt.setString(4, comment);
			pstmt.setInt(5, use_uid);
			pstmt.setInt(6, de_uid);
			pstmt.setInt(7, ser_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	// 예약확인하기 (user)
	public BookDTO[] select_by_user(int use_uid) throws SQLException {
		BookDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_SELECT_BY_USER);
			pstmt.setInt(1, use_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	};

	// 예약확인하기(shop)

	public BookDTO[] select_by_shop(int sh_uid) throws SQLException {
		// 매장의 디자이너 목록 읽어와서 배열에 입력
		DesignerDAO des = new DesignerDAO();
		DesignerDTO[] arr_des = des.list(sh_uid);
		BookDTO[] arr_book = null;

		try {
			for (int i = 0; i < arr_des.length; i++) {
				pstmt = conn.prepareStatement(K.SQL_BOOK_SELECT_BY_DE_UID);
				pstmt.setInt(1, arr_des[i].getDe_uid());
				rs = pstmt.executeQuery();
				arr_book = createArray(rs);
			}
		} finally {
			close();
		}

		return arr_book;
	};

	// 예약 STAT 변경하기
	public int update(int bo_stat, int sh_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_UPDATE_STAT_BY_SH_UID);
			pstmt.setInt(1, bo_stat);
			pstmt.setInt(2, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	};
}
