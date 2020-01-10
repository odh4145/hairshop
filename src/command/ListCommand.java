package command;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;





public class ListCommand implements Command {
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		// 입력한 값 받아오기
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));		
		int page = 1; // 현재 페이지 (디폴트 1 page)
		int writePages = 10; // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
		int pageRows = 8; // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
		int totalPage = 0; // 총 몇 '페이지' 분량인가?
		int cnt = 0; // 글은 총 몇개인가?
		
		// 현재 몇 페이지?
		String param = request.getParameter("page");
		if(param != null && !param.trim().equals("")) {
			try {
				page = Integer.parseInt(param);
			}catch(NumberFormatException e) {
				// 별도의 처리는 안함
			}
		}
		
		 
		try {
			
			// 글 전체 개수 구하기
			cnt = dao.countAll(sh_uid);
			System.out.println(cnt);
			// 총 몇페이지 분량인가?
			totalPage = (int)Math.ceil(cnt / (double)pageRows);
			
			// 몇번재 row 부터?
			int fromRow = (page - 1) * pageRows;  // MySQL 은 0 부터 시작 !
			
			dao = new WriteDAO();
			arr = dao.selectFromRow(sh_uid,fromRow, pageRows);			
			request.setAttribute("list", arr);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	

}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		WriteDAO dao = new WriteDAO();
//		WriteDTO [] arr = null;
//		
//		try {
//			arr = dao.select();
//			request.setAttribute("list", arr);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//
//}
