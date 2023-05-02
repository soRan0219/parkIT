package com.team2.park;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.member.action.MemberJoinAction;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

@WebServlet("*.park")
public class FrontController extends HttpServlet {

	//http://localhost:8088/Team2/Main.park
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess()");
		
		/************************* 가상주소 계산 *****************************/
		System.out.println("가상주소 계산 - 시작");
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI: " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath: " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("command: " + command);
		 
		System.out.println("가상주소 계산 - 끝");
		/************************* 가상주소 계산 *****************************/
		
		/************************* 가상주소 매핑 *****************************/
		System.out.println("가상주소 매핑 - 시작");
		
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
			System.out.println(" C : /MemberJoinAction.me 호출 ");
			
			// MemberJoinAction 객체 생성
			//MemberJoinAction joinAction = new MemberJoinAction(); 
			action = new MemberJoinAction(); 
			// try&catch 수행 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
		//------------------------------------------------------------------
		// 예약
		} if(command.equals("/Main.park")) {
			System.out.println("C: /Main.park 호출");
			
			forward = new ActionForward();
			forward.setPath("./reservation/main.jsp");
			forward.setRedirect(false);
			
		}//if(Main)
		else if(command.equals("/Reservation.park")) {
			System.out.println("C: /Reservation.park 호출");
			
			forward = new ActionForward();
			forward.setPath("./reservation/reservationForm.jsp");
			forward.setRedirect(false);
			
		} //if(Reservation.park)
		// 예약페이지
		else if(command.equals("/ReservationAction.park")) {
			System.out.println("C: /ReservationAction.park 호출");
			
			//action = new ReservationAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} //try
			
		}//if(ReservationAction)
		
		
		System.out.println("가상주소 매핑 - 끝");
		/************************* 가상주소 매핑 *****************************/
		
		/************************* 가상주소 이동 *****************************/
		System.out.println("가상주소 이동 - 시작");
		
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
		
		System.out.println("가상주소 이동 - 끝");
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
