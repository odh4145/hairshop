package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.beans.JoinDAO;
import com.join.beans.JoinDTO;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt1 = 0, cnt2 = 0, cnt3 = 0;
		JoinDAO dao = new JoinDAO();
		JoinDTO [] arr = null;
		
		// 입력한 값 받아오기
		String use_id = request.getParameter("use_id");
		String use_pw = request.getParameter("use_pw");
		String use_name = request.getParameter("use_name");
		String use_phoneNum = request.getParameter("use_phoneNum");
		System.out.println("입력한 값 받아오기");
		
		// parameter 유효성 검증
		if(use_id != null && use_pw != null &&
			use_name != null && use_phoneNum != null &&
			use_id.trim().length() > 0 && use_pw.trim().length() > 0 &&
			use_name.trim().length() > 0 && use_phoneNum.trim().length() > 0) {
			System.out.println("Parameter 검증 완료");
			
			try {
				cnt1 = dao.chkID(use_id);
				if(cnt1 == 1) {
					dao = new JoinDAO();
					cnt2 = dao.chkNUM(use_phoneNum);
					if(cnt2 == 1) {
						dao = new JoinDAO();
						cnt3 = dao.insert(use_id, use_pw, use_name, use_phoneNum);
					}
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("회원가입 실패 ");
		}
		
		if(cnt1 == 0) {
			request.setAttribute("join_user", -1);
		} else if(cnt2 == 0) {
			request.setAttribute("join_user", 0);
		} else {
			request.setAttribute("join_user", 1);
		}
		
		//request.setAttribute("join_user", cnt);
	}

}
