package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberPasswordUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberPasswordUpdateAction_execute() ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if( id == null) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true);
			
			return forward;
		}
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보(파라미터) 저장(DTO)
		 MemberDTO dto = new MemberDTO();
		
		dto.setPw(request.getParameter("pw"));
		dto.setPw(request.getParameter("newpw"));
		
		// DAO 정보수정 메서드 호출 - memberUpdate(dto)
		MemberDAO dao = new MemberDAO();
		
		int result = dao.memberUpdate(dto);
		
		System.out.println(" M : 정보 수정 결과: "+result);
		
		// 수정 처리 결과에 따른 페이지 이동
		if(result == -1) {
			JSForward.alertAndBack(response, "아이디없음");
			return null;
		}
		if(result == 0) {
			JSForward.alertAndBack(response, "비밀번호 오류");
			return null;
		}
		
		JSForward.alertAndMove(response, "수정완료", "./Main.park");
		return null;
	}

}