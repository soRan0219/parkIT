package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateAction_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true); // 페이지를 이동할 수 있도록 false가 아닌 true 해줌
			return forward;
		}
		
		// 기존의 회원정보를 가져오기(DB)
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getMember(id);
		//System.out.println(dto);
		
		// 정보저장 (request영역)
		request.setAttribute("dto", dto);
		
		// ./member/updateForm.jsp 출력		
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}