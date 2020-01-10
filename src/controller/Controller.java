package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AjaxListCommand;
import command.ChangeUserInfoCommand;
import command.Command;
import command.DeleteCommand;
import command.DesignerListCommand;
import command.UserJoinCommand;
import command.DesignerUpdateCommand;
import command.UserJoinCommand;
import command.ListCommand;
import command.MyLocationCommand;
import command.SelectCommand;
import command.ServiceListCommand;
import command.ServiceUpdateCommand;
import command.ShopCommand;
import command.ShopLoginCommand;
import command.ShowBookuserCommand;
import command.UpdateCommand;
import command.UserLoginCommand;
import command.ViewCommand;
import command.WriteCommand;
import command.DeleteBookshopCommand;
import command.DeleteBookuserCommand;
import command.ShowBookshopCommand;
import command.ServiceAddCommand;
import command.ServiceDeleteCommand;

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
		System.out.println("------------------------------");

		switch (com) {
		case "/index.bbq":
			viewPage = "/index.jsp";
			break;
//////////////////////////////////////////////////////////// 손님 //////////////////////////////////////////////////////
		// 손님-회원가입
		case "/join/join_user.bbq":
			viewPage = "join_user.jsp";
			break;
		case "/join/join_user_ok.bbq":
			command = new UserJoinCommand();
			command.execute(request, response);
			viewPage = "join_user_ok.jsp";
			break;

		// 손님-로그인
		case "/login/login_user.bbq":
			viewPage = "login_user.jsp";
			break;
		case "/login/login_user_ok.bbq":
			command = new UserLoginCommand();
			command.execute(request, response);
			viewPage = "login_user_ok.jsp";
			break;
			
		// 손님-로그아웃
		case "/logout/Userlogout.bbq":
			viewPage = "/logout/Userlogout.jsp";
			break;

		// 손님-주변매장
		case "/location/Location2.bbq":
			viewPage = "Location2.jsp";
			break;

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
		case "/comment/list.bbq":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/comment/list.jsp";
			break;

		// 손님-후기작성
		case "/comment/write.bbq":
			viewPage = "/comment/write.jsp";
			break;
		case "/comment/writeOk.bbq":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/comment/writeOk.jsp";
			break;

		// 손님-후기 상세
		case "/comment/view.bbq":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "/comment/view.jsp";
			break;

		// 손님-후기 수정
		case "/comment/update.bbq":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "/comment/update.jsp";
			break;
		case "/comment/updateOk.bbq":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "/comment/updateOk.jsp";
			break;

		// 손님-후기 삭제
		case "/comment/deleteOk.bbq":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/comment/deleteOk.jsp";
			break;
			
		// 손님 - 개인정보 변경
		case "/changeinfo/changeUserInfo.bbq":
			viewPage = "/changeinfo/changeUserInfo.jsp";
			break;
		case "/changeinfo/changeUserInfo_ok.bbq":
			command = new ChangeUserInfoCommand();
			command.execute(request, response);
			viewPage = "/changeinfo/changeUserInfo_ok.jsp";
			break;

//////////////////////////////////////////////////////////// 매장 //////////////////////////////////////////////////////
		// 매장-회원가입
		case "/join/join_shop.bbq":
			viewPage = "join_shop.jsp";
			break;
		case "/join/join_shop_ok.bbq":
			viewPage = "join_shop_ok.jsp";
			break;
			
		// 매장-로그인
		case "/login/login_shop.bbq":
			viewPage = "login_shop.jsp";
			break;
		case "/login/login_shop_ok.bbq":
			command = new ShopLoginCommand();
			command.execute(request, response);
			viewPage = "login_shop_ok.jsp";
			break;

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
		case "/info/designerUpdate.bbq":
			command = new DesignerUpdateCommand();
			command.execute(request, response);
			viewPage = "designerUpdate.jsp";
			break;

		// 매장-서비스 추가
		case "/info/serviceAdd.bbq":
			command = new ServiceAddCommand();
			command.execute(request, response);
			viewPage = "serviceAdd.jsp";
			break;
			
		// 매장-서비스 수정
		case "/info/serviceUpdate.bbq":
			command = new ServiceUpdateCommand();
			command.execute(request, response);
			viewPage = "serviceUpdate.jsp";
			break;
			
		// 매장-서비스 삭제
		case "/info/serviceDelete.bbq":
			command = new ServiceDeleteCommand();
			command.execute(request, response);
			viewPage = "serviceDelete.jsp";
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
///////////////////////////////////////////////////BOOK////////////////////////////////////////////////////////////////
		case "/book/user.bbq":
			System.out.println("debug용");
			command = new ShowBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/usertest.jsp";
			break;
		
		case "/book/delete.book.bbq":
			System.out.println("debug용");
			System.out.println("bo_uid 의 값은 : " + request.getParameter("bo_uid"));
			command = new DeleteBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/deleteOk.jsp";
			break;
		
		case "/book/shopdeleteOk.book":
			System.out.println("bo_uid 의 값은 : " + request.getParameter("bo_uid"));
			//TODO
			command = new DeleteBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/deleteOk.jsp";
			break;
		
		case "/book/shop.book":
			System.out.println("debug용 shop");
			command = new ShowBookshopCommand();
			command.execute(request, response);
			System.out.println("테스트용 shoptest.book컨트롤러");
			viewPage = "/book/shoptest.jsp";
			break;	
			
		case "book/shopdelete.book":
			System.out.println("매장용 삭제 페이지 연결");
			command = new DeleteBookshopCommand();
			command.execute(request, response);
			//TODO
			viewPage = "/book/.jsp";
			break;
			
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
