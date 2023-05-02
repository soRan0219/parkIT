package com.team2.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.admin.action.AdminMemberAction;
import com.team2.admin.action.AdminResAction;
import com.team2.admin.db.MemberDAO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;


/**
 *  컨트롤러 : 서블릿 구현
 *    Model-View 연결동작 처리
 */
@WebServlet("*.park")
public class FrontController extends HttpServlet { //test용 주석

	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 페이지 정보 전달방식에 상관없이 한번에 처리하는 메서드
		System.out.println("doProcess() 호출!");
		
		// URL : http://localhost:8088/parkIT/adminMain.park
		
		/**********************1. 가상주소 계산****************************/
		System.out.println(" 1. 가상주소 계산 - 시작 ");
		
		String requestURI = request.getRequestURI();
		System.out.println(" requestURI : "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" ctxPath : "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" command : "+command);
		
		System.out.println(" 1. 가상주소 계산 - 끝 ");
		/**********************1. 가상주소 계산****************************/
		
		/**********************2. 가상주소 매핑****************************/
		System.out.println("\n");
		System.out.println(" 2. 가상주소 매핑 - 시작 ");
		
		Action action = null;
		ActionForward forward = null;
		
		
		
		// URL : http://localhost:8088/Team2/adminMain.park
		// 관리자 메인페이지
		if(command.equals("/adminMain.park")) {
			System.out.println(" C : /adminMain.park실행 ");
			
			
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./admin/adminMain.jsp");
			forward.setRedirect(false);			
		} // 관리자 메인페이지
		
		
		
		// 관리자 예약정보 관리
		else if(command.equals("/AdminRes.park")) {
			System.out.println(" C : /AdminRes.park호출 ");
			
			MemberDAO dao = new MemberDAO();
			
			dao.resList();
			
			request.getAttribute("resList"); // AdminResAction에 set 있음, request 영역에 정보 저장
			
			// 페이지 이동
			action = new AdminResAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} // 관리자 예약정보 관리
		
		
		// 관리자 회원정보 관리
		else if(command.equals("/AdminMember.park")) {
			System.out.println(" C : /AdminMember.park호출 ");
			
			MemberDAO dao = new MemberDAO();
			
			dao.memberList();
			
			request.getAttribute("memberList");
			// 페이지 이동
			action = new AdminMemberAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} // 관리자 회원정보 관리
		
		
		
		
		
		
		
		System.out.println(" 2. 가상주소 매핑 - 끝 ");
		System.out.println("\n");
		/**********************2. 가상주소 매핑****************************/
		
		/**********************3. 가상주소 이동****************************/
		System.out.println(" 3. 가상주소 이동 - 시작 ");
		if(forward != null) { //이동정보가 있을때
			if(forward.isRedirect()) {
				// 페이지 이동방식 - true
				System.out.println(" C : sendRedirect방식 - "+forward.getPath()+"이동");
				response.sendRedirect(forward.getPath());
			}else {							
				// 페이지 이동방식 - false
				System.out.println(" C : forward방식 - "+forward.getPath()+"이동");
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}			
		}		
		
		System.out.println(" 3. 가상주소 이동 - 끝 ");
		/**********************3. 가상주소 이동****************************/
		
		System.out.println(" doProcess - 끝(컨트롤러 종료) ");
	}// doProcess
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() 호출!");
		doProcess(request, response);		
	}
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST() 호출!");
		doProcess(request, response);
	}

}
