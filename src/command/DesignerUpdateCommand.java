package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.DesignerDAO;
import com.info.beans.DesignerDTO;

public class DesignerUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		DesignerDAO dao = new DesignerDAO();
		int cnt = 0;
		String uid = request.getParameter("de_uid");
		System.out.println(uid);
		int de_uid = Integer.parseInt(request.getParameter("de_uid"));

		try {
			String name = request.getParameter("de_name");
			String position = request.getParameter("de_position");
			String career = request.getParameter("de_career");
			String major = request.getParameter("de_major");
			String picture = request.getParameter("de_picture");

			cnt = dao.update(de_uid, name, position, career, major, picture);
			
			request.setAttribute("designer", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
