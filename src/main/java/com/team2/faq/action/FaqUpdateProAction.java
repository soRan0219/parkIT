package com.team2.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.faq.db.FaqDAO;
import com.team2.faq.db.FaqDTO;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class FaqUpdateProAction implements Action {
	//
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" F : FaqUpdateProAction_execute");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MainMain.park");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보(파라미터) 저장(DTO)
		 FaqDTO dto = new FaqDTO();
			dto.setFaqNo(Integer.parseInt(request.getParameter("faqNo")));
			dto.setFaqTitle(request.getParameter("faqTitle"));
			dto.setFaqContents(request.getParameter("faqContents"));
		
		// DAO 정보수정 메서드 호출 - memberUpdate(dto)
		FaqDAO dao = new FaqDAO();
		
		dao.updatefaq(dto);
		
		
		
		JSForward.alertAndMove(response, "수정완료", "./FaqList.fa");
		return null;
	}

}
