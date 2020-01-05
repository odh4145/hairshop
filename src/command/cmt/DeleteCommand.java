package command.cmt;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		//입력한 값을 받아오기
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));
		
		try {			
			cnt = dao.deleteByUid(co_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		
	} // end execute()
} // end Command


