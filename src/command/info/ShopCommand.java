package command.info;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.DesignerDAO;
import com.info.beans.DesignerDTO;
import com.info.beans.ServiceDAO;
import com.info.beans.ServiceDTO;
import com.info.beans.ShopDAO;
import com.info.beans.ShopDTO;

public class ShopCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		ShopDAO dao1 = new ShopDAO();
		ShopDTO [] arr1 = null;
		
		DesignerDAO dao2 = new DesignerDAO();
		DesignerDTO [] arr2 = null;
		
		ServiceDAO dao3 = new ServiceDAO();
		ServiceDTO [] arr3 = null;
		
		if(sh_uid != 0) {
			try {
				arr1 = dao1.select(sh_uid);
				request.setAttribute("info", arr1);
				
				arr2 = dao2.list(sh_uid);
				request.setAttribute("designer", arr2);
				
				arr2 = dao2.list(sh_uid);
				request.setAttribute("service", arr2);
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}
	}

}
