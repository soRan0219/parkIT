package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberDeleteAction_execute() 호출 ");

		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true);
			return forward;
		}


		// 정보 저장(히든으로 가져온 id, pw)
		String pw = request.getParameter("pw");

		// 회원탈퇴 - DAO 객체 - deleteMember()
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(id, pw);

		// 삭제 결과에 따른 페이지 이동(JS)
		if(result == -1) {
			JSForward.alertAndBack(response, "회원 정보 없음(삭제 불가)");
			return null;
		}
		if(result == 0) {
			JSForward.alertAndBack(response, "비밀번호 오류(삭제 불가)");
		}

		// result == 1
		session.invalidate();

		JSForward.alertAndMove(response, "회원정보 탈퇴 성공!", "./Main.park");

		return null;
	}

}