package com.team2.member.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberFindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberFindIDAction_execute() 실행 ");
			
		
			// 한글처리
			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			
			// MemberDTO 객체 생성
			MemberDTO dto = new MemberDTO();
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("email"));
			
			// 전달된 정보 저장
			dto.setMemname(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			
//			System.out.println(" M : "+dto);
			
			// MemberDAO 객체 생성
			MemberDAO dao = new  MemberDAO();
			
			// 일치 시 메서드 호출 => 결과 확인 
			String result = dao.memberFindid(dto);
			
			// 회원 아이디가 있는 경우, 세션에 저장
			if (result != null) {
				session.setAttribute("id", result);
			}else { // 일치하지 않을 경우 경고창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('일치하는 정보가 없습니다.');");
				out.print("history.back();");
				out.print("</script>");
				out.close();
				
				return null;
			}
			
			System.out.println("액션"+session.getAttribute("id"));
			
			
			// 페이지이동
			ActionForward forward = new ActionForward();
			forward.setPath("./MemberFindIDafter.park");
			forward.setRedirect(true);
//			forward.setRedirect(false);
//			request.setAttribute("id", result);
			
			System.out.println(" M : 아이디 찾기(액션) "+ session.getAttribute("id"));
		
			return forward;
	}

}