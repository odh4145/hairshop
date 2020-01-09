package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;
import com.lec.beans.ReplyDTO;
import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class ReViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		ReplyDAO dao2 = new ReplyDAO();
		WriteDTO [] arr = null;
		ReplyDTO [] arr2 = null;
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));  // 매개변수 검증 필요
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));  // 매개변수 검증 필요
	try {
		arr = dao.selectByUid(co_uid);  // 읽기
		arr2 = dao2.selectByUid(re_uid);  // 읽기
		request.setAttribute("list", arr);
		request.setAttribute("list", arr2);
	} catch (SQLException e) {  
		e.printStackTrace();
	}
} //end execute()
	
} // end Command
