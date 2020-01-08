package controller.cmt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.cmt.Command;
import command.cmt.DeleteCommand;
import command.cmt.ListCommand;
import command.cmt.ReViewCommand;
import command.cmt.ReWriteCommand;
import command.cmt.SelectCommand;
import command.cmt.UpdateCommand;
import command.cmt.ViewCommand;
import command.cmt.WriteCommand;

@WebServlet("*.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = null; // 어떠한 커맨드 수행할지.
		String viewPage = null;  // 어떠한 페이지(view)
		
		//URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		
		// 1.커맨드 객체 수행
		switch(com) {
		case "/comment/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/comment/list.jsp";
			break;
			
		case "/comment/write.do":
			viewPage = "/comment/write.jsp";
			break;
		case "/comment/writeOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/comment/writeOk.jsp";
			break;
			
		case "/comment/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "/comment/view.jsp";
			break;
		
		case "/comment/update.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "/comment/update.jsp";
			break;  
			
		case "/comment/updateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "/comment/updateOk.jsp";
			break; 
		case "/comment/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/comment/deleteOk.jsp";
			break;
			
		case "/reply/re_list.do":
			command = new ListCommand();
			command.execute(request,response);
			viewPage ="/reply/re_list.jsp";
			break;
			
			
		case "/reply/re_view.do":
			command = new ReViewCommand();
			command.execute(request,response);
			viewPage ="/reply/re_view.jsp";
			break;
		
		case "/reply/reWrite.do":
			command = new ReWriteCommand();
			command.execute(request, response);
			viewPage = "/reply/view.jsp";
			break;
		}
		
		
		// 2.View(*.jsp) 선택
		
		// 위에서 결졍된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
	

}










