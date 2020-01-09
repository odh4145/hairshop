package command.reply;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;
import com.lec.beans.ReplyDTO;

public class ReSelectCommand implements Command, command.cmt.Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReplyDAO daos = new ReplyDAO();
		ReplyDTO [] arr2 = null;
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));  // 매개변수 검증 필요
		
		try {
			arr2 = daos.selectByUid(re_uid);  // 읽기 only
			request.setAttribute("lists", arr2);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}
	} //end execute()
} // end Command
