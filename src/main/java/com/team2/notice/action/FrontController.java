package com.team2.notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;


@WebServlet("*.no")
	
	public class FrontController extends HttpServlet {

		//http://localhost:8088/parkIT/noticeList.no	
	
		protected void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// 페이지 정보 전달방식에 상관없이 한번에 처리하는 메서드
			System.out.println("doProcess() 호출!");
			
			
			
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
			

	        System.out.println("\n\n"); // 칸 띄우기
			System.out.println(" 2. 가상주소 매핑 - 시작 ");
			
			Action action = null;
			ActionForward forward = null;
			
			
			if(command.equals("/noticeList.no")) {
				System.out.println(" C : /noticeList.no 주소 요청 ");
				
				action = new NoticeListAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			else if(command.equals("/noticeWriteForm.no")) {
				System.out.println(" C : /NoticeWriteForm.no 주소 요청 ");
				forward = new ActionForward();
				forward.setPath("./notice/noticeWriteForm.jsp");
				forward.setRedirect(false);
				System.out.println(" C : ./notice/noticeWriteForm.jsp로 이동준비완료 ");
				
			}
			
			
			else if(command.equals("/noticeWriteAction.no")) {
				System.out.println("C : /noticeWriteAction.no 주소 요청");
				action = new NoticeWriteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			// 제목누르면 글 내용 나오게
			else if(command.equals("/noticeContent.no")) {
				System.out.println(" C : /noticeContent.no 주소 요청");
				action = new NoticeContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			// 글 삭제
			else if(command.equals("/noticeDeleteAction.no")) {
				System.out.println(" C : noticeDelete.no 주소 요청 ");
				action = new NoticeDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
			// 글 수정해서 작성
			else if(command.equals("/noticeUpdateForm.no")) {
				System.out.println(" C : /noticeUpdateForm.no 주소 요청 ");
				
				action = new NoticeUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}	
			
			
			// 글 수정 완료
			else if(command.equals("/noticeUpdateAction.no")) {
				System.out.println(" C : /noticeUpdateAction.no 주소 요청 ");
				
				action = new NoticeUpdateAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
			
			
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


