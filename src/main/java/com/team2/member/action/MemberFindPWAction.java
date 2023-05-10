package com.team2.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberFindPWAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberFindPWAction_execute() 실행");
		
		HttpSession session = request.getSession();
		
		// MemberDTO 객체 생성
		MemberDTO dto = new MemberDTO();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("email"));
		
		// 전달된 정보 저장
		dto.setId(request.getParameter("id"));
		dto.setEmail(request.getParameter("email"));
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 일치 시 메서드 호출 => 결과 확인
		String result = dao.memberFindpw(dto);
		
		// 회원 비밀번호가 있는경우, 세션에 저장
		if(result != null) {
			session.setAttribute("pw", result);
		}else { // 일치하지 않을 경우 경고창
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('일치하는 정보가 없습니다.');");
			out.print("history.back()");
			out.print("</script>");
			out.close();
			
			return null;
		}
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberFindPWafter.me");
		forward.setRedirect(true);
		
		System.out.println(" M : 비밀번호 찾기(액션) "+session.getAttribute("pw"));
		
		return forward;
	}

}