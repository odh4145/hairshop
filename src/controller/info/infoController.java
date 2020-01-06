package controller.info;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.info.Command;
import command.info.DesignerListCommand;
import command.info.ServiceListCommand;
import command.info.ShopCommand;

@WebServlet("*.bbq")
public class infoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public infoController() {
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
		
		Command command = null;  // 어떠한 커맨드 수행할지
		String viewPage = null;  // 어떠한 페이지
		
		// URL로 부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력		
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);
		
		// 1. command 객체 수행
		switch(com) {
			case "/info/storeInfo.bbq":
				command = new ShopCommand();
				command.execute(request, response);
				command = new DesignerListCommand();
				command.execute(request, response);
				command = new ServiceListCommand();
				command.execute(request, response);
				viewPage = "storeInfo.jsp";
				break;
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
