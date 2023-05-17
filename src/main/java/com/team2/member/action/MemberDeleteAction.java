package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.member.db.MemberDAO;

public class MemberDeleteAction implements Action {
	//
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberDeleteAction_execute() 호출");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			
			return forward;
		}
		
		String pw = request.getParameter("pw");
		
		// 회원탈퇴 - DAO 객체 - deleteMember()
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(id, pw);
		
		// 삭제 결과에 따른 페이지 이동(JS)
		if(result == -1) {
			JSForward.alertAndBack(response, "회원 정보가 없습니다.");
			return null;
		}
		if(result == 0) {
			JSForward.alertAndBack(response, "비밀번호 오류입니다.");
			return null;
		}
		session.invalidate();
		
		JSForward.alertAndMove(response, "회원 탈퇴를 했습니다", "./Main.park");
		
		return null;
	}

}