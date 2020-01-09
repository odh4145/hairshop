package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;
import com.lec.beans.WriteDAO;
public class ReWriteCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReplyDAO dao = new ReplyDAO();
		
		// 입력한 값 받아오기
	
		String re_content = request.getParameter("re_content");
		
		// parameter 유효성 검증
//		if(co_name != null && co_content != null && 
//				co_name.trim().length() > 0 && co_content.trim().length() > 0) 
		{
			try {
				cnt = dao.insert(re_content);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);

	}
	

}

