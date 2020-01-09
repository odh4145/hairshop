package command.login;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.beans.LoginDAO;
import com.login.beans.LoginDTO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		LoginDAO dao = new LoginDAO();
		
		String use_id = request.getParameter("use_id");
		String use_pw = request.getParameter("use_pw");
		
		if(use_id != null && use_pw != null &&
				use_id.trim().length() > 0 && use_pw.trim().length() > 0) {
			try {
				cnt = dao.chkLogin(use_id, use_pw);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		
		}
		
		
		request.setAttribute("login_user", cnt);
	}

}
