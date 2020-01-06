package controller.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.Command_k;

import command.book.ShowBookuserCommand;
import command.info.Command;
import command.info.DesignerListCommand;
import command.info.ServiceListCommand;
import command.info.ShopCommand;


@WebServlet("*.book")
public class bookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public bookController() {
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
		
		Command_k command = null;  // 어떠한 커맨드 수행할지
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
			case "/user/check.book":
//				System.out.println("debug용");
				command = new ShowBookuserCommand();
				command.execute(request, response);
				viewPage = "Book_show_user.jsp";
				break;
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
