	package com.team2.notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

/**
 *  컨트롤러 : 서블릿 구현
 *    Model-View 연결동작 처리
 */
public class NoticeFrontController  extends HttpServlet{

	// 일반 클래스를  서블릿을 상속해서 컨트롤러 역활 할수있도록 설정
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess() 호출 (페이지 GET/POST방식 모두 사용호출)");
		
		//1. 주소 매핑
		System.out.println("--------------@ 주소 매핑 @-------------");
		// requestURI : /Model2JSP7/test.me
		// 프로젝트명 + 주소
		String requestURI = request.getRequestURI();
		System.out.println(" requestURI : " + requestURI);
	
		// contextPath : /Model2JSP7
		// 프로젝트명
		String contextPath = request.getContextPath();
		System.out.println(" contextPath : " + contextPath);
	
		// 가상주소
		// /test.me
		String command = requestURI.substring(contextPath.length());
		System.out.println(" command(가상주소) : " + command);
	
		
		//2. 주소비교 후 처리
		System.out.println("--------------@ 주소 비교 후 처리 @-------------");
		Action action = null;
		ActionForward forward = null;
		
		//end of 주소비교후처리(command)
		
		
		//3. 페이이지이동
		System.out.println("-----------------@ 페이지 이동 @--------------");
		if(forward != null){ // 이동할 정보(setPath과setRedirect)가 있는 경우
			if(forward.isRedirect()){ //True면 sendRedirect이동방식, False면 forward이동 방식
				//true면 sendRedirect방식으로 이동
				//사용처: 주소와 화면의 전환이 동시에 일어날때 (가상주소 `.bo` -> 가상주소로 `.bo`)
				System.out.println("컨트롤러: "+forward.getPath()+"로 이동(sendRedirect이동방식)");
				response.sendRedirect(forward.getPath());
			}else{
				//false면  forward방식으로 이동
				//사용처: 주소는 그대로인데 화면이 바뀔때 (가상주소 `.bo`에서 request객체정보를 가지고 이동하면서 `.jsp`를 보여줌)
				//RequestDispatcher dis = new RequestDispatcher(forward.getPath()); 인터페이스이므로 new연산자를 이용한 객체생성 불가
				System.out.println("컨트롤러: "+forward.getPath()+"로 이동(forward이동방식)");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		
	}//end of doProcess
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost호출");
		doProcess(request, response);
	}

}
