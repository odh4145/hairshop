package com.location.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.loc.Command;
import command.loc.MyLocationCommand;


@WebServlet("*.loc")
public class Locationcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Locationcontroller() {
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
		
		
		// 1. 커맨드 객체 수행
		switch(com) {
		
		case "/aaa.loc":
			command = new MyLocationCommand();
			command.execute(request, response); 
			viewPage = "location/aaa.jsp";
			break;
		case "/location/Mylocation.loc":
			
			
			
			break;
		}
		
		
		// 2. View(*.jsp) 선택
		
		// 위에서 결정된 view에 forward해줌 >> URL주소 변경없이 보이는 화면을 바까주는거
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	}
}
