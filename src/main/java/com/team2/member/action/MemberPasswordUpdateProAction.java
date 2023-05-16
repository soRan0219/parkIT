package com.team2.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberPasswordUpdateProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberPasswordUpdateProAction_execute");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보(파라미터) 저장(DTO)
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		dto.setNewpw(request.getParameter("newpw"));
		
		// DAO 정보수정 메서드 호출 - memberUpdate(dto)
		MemberDAO dao = new MemberDAO();
		
		int result = dao.MemberPasswordUpdate(dto);
		
		System.out.println(" M : 정보 수정 결과: "+result);
		
		// 수정 처리 결과에 따른 페이지 이동
		if (result == 1 && dto.getNewpw() != null) {
		    // 비밀번호 업데이트 성공
		    JSForward.alertAndMove(response, "비밀번호가 변경되었습니다.", "./Main.park");
		    return null;
		} else if (result == 0) {
		    // 기존 비밀번호가 일치하지 않음
		    JSForward.alertAndBack(response, "기존 비밀번호가 일치하지 않습니다.\\n다시 입력해주세요.");
		    return null;
		} else {
		    // 해당 ID의 회원이 존재하지 않음
		    JSForward.alertAndMove(response, "존재하지 않는 회원입니다.", "./MemberPasswordUpdateAction.me");
		    return null;
		}
	}
}

