package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.beans.ShopJoinDAO;

public class ShopJoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		ShopJoinDAO dao = new ShopJoinDAO();
		
		// 입력한 값 받아오기
		String sh_id = request.getParameter("sh_id");
		String sh_pw = request.getParameter("sh_pw");
		String sh_no_id = request.getParameter("sh_no_id");
		String sh_name = request.getParameter("sh_name");
		String sh_telephone = request.getParameter("sh_telephone");
		String sh_location = request.getParameter("sh_location");
		String sh_detailAddress = request.getParameter("sh_detailAddress");
		
		System.out.println("입력한 값 받아오기 성공");
		
		// parameter 유효성 검증
		if(sh_id != null && sh_pw != null &&
			sh_no_id != null && sh_name != null &&
			sh_telephone != null && sh_location != null &&
			sh_detailAddress != null && sh_id.trim().length() > 0 && 
			sh_pw.trim().length() > 0 && sh_no_id.trim().length() > 0 &&
			sh_name.trim().length() > 0 && sh_telephone.trim().length() > 0 &&
			sh_location.trim().length() > 0 && sh_detailAddress.trim().length() > 0) {
			
			System.out.println("Parameter 검증 완료");
			try {
				
				cnt =  dao.ShopJoin(sh_id, sh_pw, sh_no_id, sh_name, sh_telephone, sh_location, sh_location_lat, sh_location_lng)
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("회원가입 실패");
		}
		
		/*
		if() {
			request.setAttribute("join_shop", -1);
		} else if() {
			request.setAttribute("join_shop", 0);
		} else {
			request.setAttribute("join_shop", 1);
		}
		*/
	}

}
