package command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book_show.beans.BookUserDAO;
import com.book_show.beans.BookUserDTO;
import com.info.beans.BookDAO;
import com.info.beans.BookDTO;
import com.info.beans.Command_k;


public class ShowBookuserCommand implements Command_k{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int use_uid = Integer.parseInt(request.getParameter("use_uid"));
		BookUserDAO dao = new BookUserDAO();
		BookUserDTO[] arr = null;

		try {
			arr=dao.select_by_use_uid(use_uid);
			request.setAttribute("book", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}
