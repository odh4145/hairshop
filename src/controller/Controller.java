package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AjaxListCommand;
import command.BookingCommand;
import command.ChangeUserInfoCommand;
import command.Command;
import command.DeleteBookshopCommand;
import command.DeleteBookuserCommand;
import command.DeleteCommand;
import command.DesignerAddCommand;
import command.DesignerDeleteCommand;
import command.DesignerListCommand;
import command.DesignerUpdateCommand;
import command.ListCommand;
import command.MyLocationCommand;
import command.ReListCommand;
import command.ReWriteCommand;
import command.ServiceAddCommand;
import command.ServiceDeleteCommand;
import command.ServiceListCommand;
import command.ServiceUpdateCommand;
import command.ShopCommand;
import command.ShopJoinCommand;
import command.ShopLoginCommand;
import command.ShowBookshopCommand;
import command.ShowBookuserCommand;
import command.SorttingCommand;
import command.StoreInfoUpdateCommand;
import command.StorepicUpdateCommand;
import command.UpdateBookShopCommand;
import command.UpdateCommand;
import command.UpdateOkCommand;
import command.UserJoinCommand;
import command.UserLoginCommand;
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

		// 손님-예약하기
		case "/info/booking.bbq":
			command = new ShopCommand();
			command.execute(request, response);
			command = new DesignerListCommand();
			command.execute(request, response);
			command = new ServiceListCommand();
			command.execute(request, response);
			viewPage = "booking.jsp";
			break;
		case "/info/bookingOk.bbq":
			command = new BookingCommand();
			command.execute(request, response);
			viewPage = "bookingOk.jsp";
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
		case "/jm/list.bbq":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/jm/list.jsp";
			break;

		case "/jm/sortlist.bbq":
			command = new SorttingCommand();
			command.execute(request, response);
			viewPage = "/jm/list.jsp";
			break;

		// 손님-후기작성
		case "/jm/write.bbq":
			viewPage = "/jm/write.jsp";
			break;
		case "/jm/writeOk.bbq":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/jm/writeOk.jsp";
			break;

		// 손매-답글작성
		case "/jm/reWrite.bbq":
			viewPage = "reWrite.jsp";
			break;
		case "/jm/reWriteOk.bbq":
			command = new ReWriteCommand();
			command.execute(request, response);
			viewPage = "reWriteOk.jsp";
			break;

		// 손님-후기 상세
		case "/jm/view.bbq":
			command = new ViewCommand();
			command.execute(request, response);
			command = new ReListCommand();
			command.execute(request, response);
			viewPage = "view.jsp";
			break;

		// 손님-후기 수정
		case "/jm/update.bbq":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "update.jsp";
			break;
		case "/jm/updateOk.bbq":
			command = new UpdateOkCommand();
			command.execute(request, response);
			viewPage = "updateOk.jsp";
			break;

		// 손님-후기 삭제
		case "/jm/deleteOk.bbq":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
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
			command = new ShopJoinCommand();
			command.execute(request, response);
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

		// 매장-기본정보변경
		case "/info/storeInfoUpdate.bbq":
			command = new StoreInfoUpdateCommand();
			command.execute(request, response);
			viewPage = "storeInfoUpdate.jsp";
			break;

		// 매장-사진목록
		case "/info/storepicList.bbq":
			command = new ShopCommand();
			command.execute(request, response);
			viewPage = "storepicList.jsp";
			break;
			
		// 매장-사진변경
		case "/info/storepicUpdate.bbq":
			command = new StorepicUpdateCommand();
			command.execute(request, response);
			viewPage = "storepicUpdate.jsp";
			break;
			
		// 매장-디자이너 추가
		case "/info/designerAdd.bbq":
			command = new DesignerAddCommand();
			command.execute(request, response);
			viewPage = "designerAdd.jsp";
			break;

		// 매장-디자이너 수정
		case "/info/designerUpdate.bbq":
			command = new DesignerUpdateCommand();
			System.out.println("디자이너 업데이트 커맨드 만들기 성공");
			command.execute(request, response);
			viewPage = "designerUpdate.jsp";
			break;

		// 매장-디자이너 삭제
		case "/info/designerDelete.bbq":
			command = new DesignerDeleteCommand();
			command.execute(request, response);
			viewPage = "designerDelete.jsp";
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
			command = new DeleteBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/deleteOk.jsp";
			break;

		case "/book/shopdeleteOk.book":
			command = new DeleteBookuserCommand();
			command.execute(request, response);
			viewPage = "/book/deleteOk.jsp";
			break;

		case "/book/shop.bbq":
			command = new ShowBookshopCommand();
			command.execute(request, response);
			viewPage = "/book/shoptest.jsp";
			break;

		case "/book/shopdelete.book.bbq":
			command = new DeleteBookshopCommand();
			command.execute(request, response);
			viewPage = "/book/deletebookshop.jsp";
			break;
			
			//예약 stat변경 --> 매장입장
		case "/book/shopupdate.book.bbq":
			command = new UpdateBookShopCommand();
			command.execute(request, response);
			viewPage = "/book/updateOk.jsp";
			break;
			}	


		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
