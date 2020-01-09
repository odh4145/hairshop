package command.reply;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;
import com.lec.beans.ReplyDTO;
import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class ReViewCommand implements Command, command.cmt.Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));  // 매개변수 검증 필요
		
		
		
		ReplyDAO daos = new ReplyDAO();
		ReplyDTO [] arr2 = null;
       int re_uid = Integer.parseInt(request.getParameter("re_uid"));  // 매개변수 검증 필요
	try {
		arr = dao.selectByUid(co_uid);  // 읽기
		arr2 = daos.selectByUid(re_uid);  // 읽기
		request.setAttribute("list", arr);
		request.setAttribute("lists", arr2);
	} catch (SQLException e) {  
		e.printStackTrace();
	}
} //end execute()
	
} // end Command


