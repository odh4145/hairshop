package command;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;


public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		//입력한 값을 받아오기
		int co_star = Integer.parseInt(request.getParameter("co_star"));
		String co_content = request.getParameter("co_content");
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));
		
		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(co_content != null && co_content.trim().length() > 0){			
			try {			
				cnt = dao.update(co_star,co_content,co_uid);
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
//		WriteDAO dao = new WriteDAO();
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



























//
//public class UpdateCommand implements Command {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		int cnt = 0;
//		WriteDAO dao = new WriteDAO();
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