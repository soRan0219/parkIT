package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberInfoAction_execute()");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if( id == null) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true);
			
			return forward;
		}
		
		// MemberDAO 객체 생성 - 회원정보 조회메서드 getMember()
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getMember(id);
		
		// 회원정보 저장
		request.setAttribute("dto", dto);
		
		// 페이지 이동 + 정보 출력(패턴3)
		forward.setPath("./member/memberInfo.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}

}
