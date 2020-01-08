package controller.join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.join.Command;
import command.join.JoinCommand;

@WebServlet("*.bbqJoin")
public class joinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public joinController() {
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
		
		request.setCharacterEncoding("utf-8");
		
		Command command = null;
		String viewPage = null;
		
		//URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
				
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		
		// 1. command 객체 수행
		switch(com) {
		case "/join/join_user.bbqJoin":
			viewPage = "join_user.jsp";
			break;
		case "/join/join_user_ok.bbqJoin":
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "join_user_ok.jsp";
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
















