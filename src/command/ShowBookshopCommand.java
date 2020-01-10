package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book_show.beans.BookShopDAO;
import com.book_show.beans.BookShopDTO;
import com.info.beans.Command_k;

public class ShowBookshopCommand implements Command_k, Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookShopDAO dao = new BookShopDAO();
		BookShopDTO [] arr = null;
		
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		try {
			arr=dao.select_by_shop(sh_uid);
			
			request.setAttribute("book_sh", arr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
