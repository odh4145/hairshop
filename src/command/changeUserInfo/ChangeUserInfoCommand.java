package command.changeUserInfo;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.change.beans.ChangeDAO;
import com.change.beans.ChangeDTO;

public class ChangeUserInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session;
		
		ChangeDAO dao = new ChangeDAO();
		ChangeDTO [] arr = null;
		
		int use_uid = ((Integer)(session.getAttribute("user")));
		
		String use_pw = request.getParameter("use_pw");
		String use_pw2 = request.getParameter("use_pw2");
		
		if(use_pw != null && use_pw2 != null 
				&& use_pw.trim().length() > 0 && use_pw2.trim().length() > 0) {
			try {
				arr = dao.chkPw(use_uid, use_pw2);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("비밀번호 변경 실패");
		}
		
		if() {
			request.setAttribute("change_user_info", -1);
		} else if() {
			request.setAttribute("change_user_info", 0);
		} else {
			request.setAttribute("change_user_info", 1);
		}
		
	}

}
