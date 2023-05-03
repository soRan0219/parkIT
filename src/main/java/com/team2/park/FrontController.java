package com.team2.park;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.member.action.MemberDeleteAction;
import com.team2.member.action.MemberInfoAction;
import com.team2.member.action.MemberLogoutAction;
import com.team2.member.action.MemberUpdateAction;
import com.team2.member.action.MemberUpdateProAction;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.action.MemberJoinAction;
import com.team2.member.action.MemberLoginAction;

@WebServlet("*.park")
public class FrontController extends HttpServlet {

	//http://localhost:8088/Team2/Main.park
	
	protected void doProcess(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess()");
		
		/************************* 가상주소 계산 *****************************/
		System.out.println("1. 가상주소 계산 - 시작");
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI: " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath: " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("command: " + command);
		 
		System.out.println("1. 가상주소 계산 - 끝");
		System.out.println("\n");
		/************************* 가상주소 계산 *****************************/
		
		/************************* 가상주소 매핑 *****************************/
		System.out.println("2. 가상주소 매핑 - 시작");
		
		Action action = null;
		ActionForward forward = null;
		
		//------------------------------------------------------------------
		// 회원가입-./MemberJoin.park
		if(command.equals("/MemberJoin.park")) { // command는 1단계 수행한 값
			System.out.println(" C : /MemberJoin.park실행 "); // .은 ctxPath : /MVC7를 의미
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoin.jsp");
			forward.setRedirect(false);			
		}
		// 회원가입-./MemberJoinAction.park
		else if(command.equals("/MemberJoinAction.park")) {
			System.out.println(" C : /MemberJoinAction.park 호출 ");
			
			// MemberJoinAction 객체 생성
			//MemberJoinAction joinAction = new MemberJoinAction(); 
			action = new MemberJoinAction(); 
			// try&catch 수행 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
			
			
		//----------------------------------------------------------------------------	
		// 약관동의자세히 - ./MemberJoinAgree.park
		if(command.equals("/MemberJoinAgree.park")) {
			System.out.println(" C : /MemberJoinAgree.park 실행");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoinAgree.jsp");
			forward.setRedirect(false);
		}	
			
			
			
		//----------------------------------------------------------------------------	
		// 로그인
		} else if(command.equals("/MemberLogin.park")) { // 로그인-정보 입력(패턴1 -> 패턴3 -> 패턴2)
			System.out.println(" C : /MemberLogin.park 호출 ");
			
			forward = new ActionForward();
			forward.setPath("./member/memberLogin.jsp");
			forward.setRedirect(false); 
		}
		else if(command.equals("/MemberLoginAction.park")) { // 비교되는 주소에는 . 이 없다, 1번에서 다 비교함
			System.out.println(" C : /MemberLoginAction.park 호출 ");
			
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
			
			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);
			
		}	
			
		
		
		
		//----------------------------------------------------------------------------	
		// 로그아웃
		else if(command.equals("/MemberLogout.park")) {
			System.out.println(" C : ./MemberLogout.park 호출 ");
			
			// MemberLogoutAction() 객체
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		//----------------------------------------------------------------------------	
		// MemberInfo 회원 정보 조회
		else if(command.equals("/MemberInfo.park")) {
			System.out.println(" C : /MemberInfo.park 호출 ");
			
			// MemberInfoAction() 객체
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		
		
		
		
		//----------------------------------------------------------------------------	
		// 회원 정보 수정
		else if(command.equals("/MemberUpdate.park")) {
			System.out.println(" C : ./MemberUpdate.park 호출 ");
			
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
			
			// MemberUpdateProAction() 객체
			action = new MemberUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		//----------------------------------------------------------------------------	
		// 회원 정보 삭제
		else if(command.equals("/MemberDelete.park")) {
			System.out.println(" C : /MemberDelete.park 호출 ");
			
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false); 
		}
		else if(command.equals("/MemberDeleteAction.park")) {
			System.out.println(" C : /MemberDeleteAction.park 호출 ");
			
			// MemberDeleteAction() 객체생성
			action = new MemberDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
			
		System.out.println("2. 가상주소 매핑 - 끝");
		System.out.println("\n");
		/************************* 가상주소 매핑 *****************************/
		
		/************************* 가상주소 이동 *****************************/
		System.out.println("3. 가상주소 이동 - 시작");
		
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("redirect 방식 이동 - " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("forward 방식 이동 - " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		} //if(null 아닐때)
		
		System.out.println("3. 가상주소 이동 - 끝");
		System.out.println("\n");
		/************************* 가상주소 이동 *****************************/
		
		
	} //doProcess()
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		doProcess(request, response);
	} //doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		doProcess(request, response);
	} //doPost()
	
} //FrontController
