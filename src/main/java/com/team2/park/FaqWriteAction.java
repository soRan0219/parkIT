package com.team2.park;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSFoward;
import com.team2.notice.db.NoticeDAO;
import com.team2.notice.db.NoticeDTO;
import com.team2.notice.db.faqDAO;
import com.team2.notice.db.faqDTO;

public class FaqWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : FaqWriteAction_execute() ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 세션정보 제어(로그인 + 관리자일때만 사용)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
				
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MemberLogin.park");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보 저장 - FaqDTO 생성
		faqDTO dto = new faqDTO();
		dto.setFaqTitle(request.getParameter("title"));
		dto.setFaqContents(request.getParameter("contents"));
		dto.setFaqDate(new Date(System.currentTimeMillis()));
		
		// FaqDAO 객체생성
		faqDAO dao = new faqDAO();
		int result = dao.insertFaq(dto);
		
		// 페이지 이동
		forward = new ActionForward();
				
		if(result == 1) { // 글 1개 작성 완료
			forward.setPath("./noticeList.park");
			forward.setRedirect(true);
					
		}else {
					
			// 에러 상황
			JSFoward.alertAndBack(response, "오류가 발생했습니다.");
		}
			return forward;
	}

}


