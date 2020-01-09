package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AjaxListCommand;
import command.Command;
import command.DeleteCommand;
import command.DesignerListCommand;
import command.DesignerOkCommand;
import command.ListCommand;
import command.MyLocationCommand;
import command.ReViewCommand;
import command.ReWriteCommand;
import command.SelectCommand;
import command.ServiceListCommand;
import command.ShopCommand;
import command.ShowBookuserCommand;
import command.UpdateCommand;
import command.ViewCommand;
import command.WriteCommand;

@WebServlet("*.bbq")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() 호출");

		request.setCharacterEncoding("UTF-8");

		Command command = null; // 어떠한 커맨드 수행할지
		String viewPage = null; // 어떠한 페이지

		// URL로 부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// 테스트 출력
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		switch (com) {
		case "/index.bbq":
			viewPage = "/index.jsp";
			break;
//////////////////////////////////////////////////////////// 손님 //////////////////////////////////////////////////////
		// 손님-예약내역
		case "/usertest.bbq":
			System.out.println("debug용");
			command = new ShowBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/usertest.jsp";
			break;

		// 손님-매장정보
		case "/info/storeInfo.bbq":
			command = new ShopCommand();
			command.execute(request, response);
			command = new DesignerListCommand();
			command.execute(request, response);
			command = new ServiceListCommand();
			command.execute(request, response);
			viewPage = "storeInfo.jsp";
			break;

		// 손님-후기목록
		case "/comment/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/comment/list.jsp";
			break;

		// 손님-후기작성
		case "/comment/write.do":
			viewPage = "/comment/write.jsp";
			break;
		case "/comment/writeOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/comment/writeOk.jsp";
			break;

		// 손님-후기 상세
		case "/comment/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "/comment/view.jsp";
			break;

		// 손님-후기 수정
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

		// 손님-후기 삭제
		case "/comment/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/comment/deleteOk.jsp";
			break;
			
//////////////////////////////////////////////////////////// 매장 //////////////////////////////////////////////////////
		// 매장-매장정보
		case "/info/storeUpdate.bbq":
			command = new ShopCommand();
			command.execute(request, response);
			command = new DesignerListCommand();
			command.execute(request, response);
			command = new ServiceListCommand();
			command.execute(request, response);
			viewPage = "storeUpdate.jsp";
			break;

		// 매장-디자이너 관리
		case "/info/designer.bbq":
			command = new DesignerListCommand();
			command.execute(request, response);
			viewPage = "designer.jsp";
			break;

		// 매장-디자이너 수정
		case "/info/designerOk.bbq":
			command = new DesignerOkCommand();
			command.execute(request, response);
			viewPage = "designerOk.jsp";
			break;
								
//////////////////////////////////////////////////////////// Ajax //////////////////////////////////////////////////////			
		// Ajax용 컨트롤
		case "/shop.bbq":
			command = new MyLocationCommand();
			command.execute(request, response);
			// shoplist받아와서
			command = new AjaxListCommand();
			command.execute(request, response);
			// ajax로 쏴주기
			break;
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}