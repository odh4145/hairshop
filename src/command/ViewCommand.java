package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.*;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));  // 매개변수 검증 필요

		// 페이징
		int page = 1;
		String param = request.getParameter("page");
		if(param != null) page = Integer.parseInt(param);
		
		
		

		try {
			arr = dao.selectByUid(co_uid);   // 읽기
			request.setAttribute("list", arr);
			request.setAttribute("page", page); // 페이징
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}
	} //end execute()
} // end Command
