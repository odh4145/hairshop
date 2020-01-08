package command.cmt;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		// 입력한 값 받아오기
	
		int co_star = (Integer.parseInt(request.getParameter("co_star")));
//		int bo_uid = Integer.parseInt(request.getParameter("bo_uid"));
		String co_title = request.getParameter("co_title");
		String co_name = request.getParameter("co_name");
		String co_content = request.getParameter("co_content");
		
		// parameter 유효성 검증
//		if(co_name != null && co_content != null && 
//				co_name.trim().length() > 0 && co_content.trim().length() > 0) 
		{
			try {
				cnt = dao.insert(co_star, co_name, co_title, co_content);
//				cnt = dao.insert(bo_uid,co_star, co_name, co_title, co_content);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);

	}
	

}



