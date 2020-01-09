package command.reply;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;

public class ReDeleteCommand implements Command, command.cmt.Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReplyDAO daos = new ReplyDAO();
		
		//입력한 값을 받아오기
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));
		
		try {			
			cnt = daos.deleteByUid(re_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		
	} // end execute()
} // end Command



