package com.team2.main.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

@WebServlet("*.park")
public class MainFrontController extends HttpServlet {
	//
	// http://localhost:8088/TEAM2/itwill.park
	
	protected void doProcess(HttpServletRequest request, 
						HttpServletResponse response) throws ServletException, IOException{
		
		/***********************1. 가상주소 계산***************************/
		System.out.println("1. 계산 시작 ");
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : "+requestURI);
		
		String ctxPath = request.getContextPath(); 
		System.out.println("ctxPath : "+ctxPath);
		
		String command = requestURI.substring(ctxPath.length()); 
		System.out.println("command : "+command);
		
		System.out.println("1. 계산 끝 ");
		/***********************1. 가상주소 계산***************************/
		
		
		/***********************2. 가상주소 매핑***************************/
		System.out.println("2. 매핑 시작 ");
		
		ActionForward forward = null;
		Action action = null;
		
		// 회원가입 - ./MemberJoin.park
		if(command.equals("/Main.park")) {
			System.out.println(" C : /Main.park 호출");
			System.out.println(" C : DB사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("mainindex.jsp");
			forward.setRedirect(false);
		}
		
		//회사 소개 페이지
		else if(command.equals("/Introduction.park")) {
			System.out.println("C: /Introduction.park 호출");
			
			action = new IntroAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
		
		
		System.out.println("2. 매핑 끝 ");
		/***********************2. 가상주소 매핑***************************/
		
		
		/***********************3. 가상주소 이동***************************/
		System.out.println("3. 이동 시작");
		
		if(forward != null) {
			
			// true
			if(forward.isRedirect()) {
				System.out.println("C : sendRedirect방식 - "+forward.getPath()+"이동");
				response.sendRedirect(forward.getPath());
			}
			// false
			else {
				System.out.println("C : forward방식 - "+forward.getPath()+"이동");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
		System.out.println("3. 이동 끝");
		/***********************3. 가상주소 이동***************************/
		
		System.out.println("doProcess - 끝(컨트롤러 종료)");

	}// doProcess
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

}