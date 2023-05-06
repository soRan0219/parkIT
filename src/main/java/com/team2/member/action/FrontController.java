package com.team2.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

//@WebServlet("*.park")
public class FrontController extends HttpServlet {
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
		if(command.equals("/MemberJoin.park")) {
			System.out.println(" C : ./MemberJoin.park 실행");
			System.out.println(" C : DB사용X, view 페이지 이동 (패턴1)");

			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoin.jsp");
			forward.setRedirect(false);
		}
		
		
		// 약관동의자세히 - ./MemberJoinAgree.park
		else if(command.equals("/MemberJoinAgree.park")) {
			System.out.println(" C : ./MemberJoinAgree.park 실행");
			System.out.println(" C : DB 사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoinAgree.jsp");
			forward.setRedirect(false);
		}
		
		
		
		// 회원가입 - ./MemberJoinAction.park
		else if(command.equals("/MemberJoinAction.park")) {
			System.out.println(" C : /MemberJoinAction.park 호출");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberJoinAction 객체 생성
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MemberLogin.park")) {
			System.out.println(" C : /MemberLogin.park 호출");
			System.out.println(" C : DB사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberLogin.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/MemberLoginAction.park")) {
			System.out.println(" C : /MemberLoginAction.park 호출");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
		
			// MemberLoginAction() 객체 생성
			action = new MemberLoginAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/Main.park")) {
			System.out.println(" C : /Main.park 호출");
			System.out.println(" C : DB사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);
			
		}
		
		else if(command.equals("/MainMain.park")) {
			System.out.println(" C : /MainMain.park 호출");
			System.out.println(" C : DB사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("mainindex.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/MemberLogout.park")) {
			System.out.println(" C : /MemberLogout.park 호출");
			System.out.println(" C : 처리작업, 페이지 이동 (패턴2)");
			
			// MemberLogoutAction() 객체
			action = new MemberLogoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/MemberInfo.park")) {
			System.out.println(" C : /MemberInfo.park 호출");
			System.out.println(" C : DB 사용 O, view 이동 & 출력 (패턴3)");
			
			// MemberInfoAction() 객체 생성
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MemberUpdate.park")) {
			System.out.println(" C : /MemberUpdate.park 호출");
			System.out.println(" C : DB 사용 O, view 이동 & 출력 (패턴3)");
			
			// MemberUpdateAction() 객체
				action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/MemberUpdateProAction.park")) {
			System.out.println(" C : /MemberUpdateProAction.park 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberUpdateProAction() 객체
			action = new MemberUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MemberDelete.park")) {
			System.out.println(" C : /MemberDelete.me 호출 ");
			System.out.println(" C : DB사용 X, view 페이지 이동 O (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/MemberDeleteAction.park")) {
			System.out.println(" C : /MemberDeleteAction.park 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberDeleteAction() 객체
			action = new MemberDeleteAction();
			
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