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

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	// http://localhost:8088/TEAM2/itwill.me
	
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
		
		// --------------------------------------------------------------------------------
		// 회원가입 - ./MemberJoin.me
		if(command.equals("/MemberJoin.me")) {
			System.out.println(" C : ./MemberJoin.me 실행");
			System.out.println(" C : DB사용X, view 페이지 이동 (패턴1)");

			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoin.jsp");
			forward.setRedirect(false);
		}
		
		// --------------------------------------------------------------------------------
		// 아이디 중복검사
		else if(command.equals("/MemberConfirmIdAction.me")) {
			System.out.println("C : /MemberConfirmId.me 호출");
			
			action = new MemberConfirmIdAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		// --------------------------------------------------------------------------------
		// 약관동의자세히 - ./MemberJoinAgree.me
		else if(command.equals("/MemberJoinAgree.me")) {
			System.out.println(" C : ./MemberJoinAgree.me 실행");
			System.out.println(" C : DB 사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberJoinAgree.jsp");
			forward.setRedirect(false);
		}
		
		
		
		
		
		// --------------------------------------------------------------------------------
		// 회원가입 - ./MemberJoin.me
		else if(command.equals("/MemberJoinAction.me")) {
			System.out.println(" C : /MemberJoinAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberJoinAction 객체 생성
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		// --------------------------------------------------------------------------------
		// 로그인 - ./MemberLogin.me
		else if(command.equals("/MemberLogin.me")) {
			System.out.println(" C : /MemberLogin.me 호출");
			System.out.println(" C : DB사용 X, view 페이지 이동 (패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/memberLogin.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/MemberLoginAction.me")) {
			System.out.println(" C : /MemberLoginAction.me 호출");
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
			forward.setPath("mainindex.jsp");
			forward.setRedirect(false);
			
		}
		
		
		
		// --------------------------------------------------------------------------------
		// 로그아웃 - ./MemberLogout.me
		else if(command.equals("/MemberLogout.me")) {
			System.out.println(" C : /MemberLogout.me 호출");
			System.out.println(" C : 처리작업, 페이지 이동 (패턴2)");
			
			// MemberLogoutAction() 객체
			action = new MemberLogoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
	///////아이디 찾기 / 비밀번호 찾기 메뉴 /////////////
			else if(command.equals("/MemberFindPW.me")) {
				System.out.println(" C : ./MemberFindPW.me 실행");
				System.out.println(" C : DB X , view 페이지 이동(패턴1)");
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberFindPW.jsp");
				forward.setRedirect(false);
			}
			
			///////아이디 찾기 / 비밀번호 찾기 메뉴 /////////////
			
			
			//////////////////////////////////////////////////////////////////
			
			// 아이디찾기 -./MemberFindID.me
			else if(command.equals("/MemberFindID.me")) {
				System.out.println(" C : ./MemberFindID.me 실행");
				System.out.println(" C : DB X , view 페이지 이동(패턴1)");
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberFindID.jsp");
				forward.setRedirect(false);
				
			}
			
			// 아이디찾기
			else if(command.equals("/MemberFindIDAction.me")) {
				System.out.println(" C : /MemberFindIDAction.me 호출");
				System.out.println(" C : DB 사용 O, 페이지 이동 O (패턴2)");
				
				// MemberFindIDAction() 객체
				action = new MemberFindIDAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			// 아이디찾기 후
			else if(command.equals("/MemberFindIDafter.me")) {
				System.out.println(" C : ./MemberFindIDafter.me 실행");
				System.out.println(" C : DB X , view 페이지 이동(패턴1)");
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberFindIDafter.jsp");
				forward.setRedirect(false);
			}
			
			// 로그인화면으로 돌아가기
			else if(command.equals("/MemberLogin.me")) {
				System.out.println();
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberLogin.jsp");
				forward.setRedirect(false);
			}
		
			
			////////////////////////////////////////////////////////////////
			
			
			//////////////////////////////////////////////////////////////////
			
			// 비번 찾기 -./MemberFindPW.me
			else if(command.equals("/MemberFindPW.me")) {
				System.out.println(" C : ./MemberFindPW.me 실행");
				System.out.println(" C : DB X , view 페이지 이동(패턴1)");
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberFindPW.jsp");
				forward.setRedirect(false);
				
			}
			
			// 비번찾기
			else if(command.equals("/MemberFindPWAction.me")) {
				System.out.println(" C : /MemberFindPWAction.me 호출");
				System.out.println(" C : DB 사용 O, 페이지 이동 O (패턴2)");
				
				// MemberFindIDAction() 객체
				action = new MemberFindPWAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			// 비번찾기 후
			else if(command.equals("/MemberFindPWafter.me")) {
				System.out.println(" C : ./MemberFindPWafter.me 실행");
				System.out.println(" C : DB X , view 페이지 이동(패턴1)");
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberFindPWafter.jsp");
				forward.setRedirect(false);
			}
			
			// 로그인화면으로 돌아가기
			else if(command.equals("/MemberLogin.me")) {
				System.out.println();
				
				// 페이지 이동
				forward = new ActionForward();
				forward.setPath("./member/memberLogin.jsp");
				forward.setRedirect(false);
			}
		
			
			////////////////////////////////////////////////////////////////
		
		
		// --------------------------------------------------------------------------------
		// 이메일 인증
		// URL : http://localhost:8088/zemailTest/Main.me
				// 관리자 메인페이지
				if(command.equals("/Main.park")) {
					System.out.println(" C : /Main.park");
					
					
					forward = new ActionForward();
					forward.setPath("./member/memberJoin.jsp");
					forward.setRedirect(false);
					
					
				} // .jsp
				
				else if(command.equals("/SendEmailAction.me")) {
					System.out.println(" C : /SendEmailAction.me");
					
					action = new SendEmailAction();
					
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
				}
				
				else if(command.equals("/VerifyEmailAction.me")) {
					System.out.println("C : /VerifyEmailAction.me");
					
					action = new VerifyEmailAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	
		
		
		
		
		// --------------------------------------------------------------------------------
		// 내 정보 보기 및 수정 - ./MemberUpdate.me
		else if(command.equals("/MemberUpdate.me")) {
			System.out.println(" C : /MemberUpdate.me 호출");
			System.out.println(" C : DB 사용 O, view 이동 & 출력 (패턴3)");
			
			// MemberUpdateAction() 객체
				action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/MemberUpdateProAction.me")) {
			System.out.println(" C : /MemberUpdateProAction.me 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberUpdateProAction() 객체
			action = new MemberUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		

		// --------------------------------------------------------------------------------
		// 비밀번호 변경
		else if(command.equals("/MemberPasswordUpdate.me")) {
			System.out.println(" C : /MemberPasswordUpdate.me 호출");
			System.out.println(" C : DB 사용 O, view 이동 & 출력 (패턴3)");
			
			// MemberPasswordUpdateAction() 객체
				action = new MemberPasswordUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/MemberPasswordUpdateProAction.me")) {
			System.out.println(" C : /MemberPasswordUpdateProAction.me 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberPasswordUpdateProAction() 객체
			action = new MemberPasswordUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		// --------------------------------------------------------------------------------
		// 회원 탈퇴 - ./MemberDelete.me
		else if(command.equals("/MemberDelete.me")) {
			System.out.println(" C : /MemberDelete.me 호출 ");
			System.out.println(" C : DB사용 X, view 페이지 이동 O (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/MemberDeleteAction.me")) {
			System.out.println(" C : /MemberDeleteAction.me 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동 O (패턴2)");
			
			// MemberDeleteAction() 객체
			action = new MemberDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		else if(command.equals("/Main.me")) {
					System.out.println(" C : /Main.me");
					
					
					forward = new ActionForward();
					forward.setPath("./member/main.jsp");
					forward.setRedirect(false);
					
					
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