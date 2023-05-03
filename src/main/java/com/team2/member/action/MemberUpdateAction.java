package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberUpdateAction implements Action {
	//
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateAction_execute() ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if( id == null) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true);
			
			return forward;
		}
		
		// 기존의 회원정보 가져오기
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		// 정보저장 (request영역)
		request.setAttribute("dto", dto);
		
		// ./member/memberUpdate.jsp 출력
		forward.setPath("./member/memberUpdate.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보수정 완료!");
		
		return forward;
	}

}
