package command.loc;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.location.beans.LocDAO;
import com.location.beans.LocDTO;

import command.loc.Command;

public class MyLocationCommand implements Command {

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) {
			LocDAO dao = new LocDAO();
			LocDTO [] arr = null;
			
			String loc_lat = (request.getParameter("lat"));  
			String loc_lng = (request.getParameter("lng"));
			
			System.out.println("고객 lat"+loc_lat);
			System.out.println("고객 lng"+loc_lng);
			dao.toString();
			try {
				arr = dao.selectByLoc(loc_lat, loc_lng); 
				request.setAttribute("shoplist", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
				e.printStackTrace();
			}
		} //end execute()

}
