package command.reply;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;


public class ReUpdateCommand implements Command, command.cmt.Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReplyDAO daos = new ReplyDAO();
		
		//입력한 값을 받아오기
		String re_content = request.getParameter("re_content");
		
		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(re_content != null && re_content.trim().length() > 0){			
			try {			
				cnt = daos.update(re_content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		request.setAttribute("result", cnt);
	} // end execute()
} // end Command






























//
//public class UpdateCommand implements Command {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		int cnt = 0;
//		ReplyDAO dao = new ReplyDAO();
//		
//		//입력한 값을 받아오기
//		String co_name = request.getParameter("co_name");
//		int co_star = Integer.parseInt(request.getParameter("co_star"));
//		String co_content = request.getParameter("co_content");
//		
//		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
//		if(co_content != null && co_content.trim().length() > 0){			
//			try {			
//				cnt = dao.update(co_name, co_star, co_content);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		} // end if
//		
//		request.setAttribute("result", cnt);
//	} // end execute()
//} // end Command