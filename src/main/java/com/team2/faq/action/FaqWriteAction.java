package com.team2.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.faq.db.FaqDAO;
import com.team2.faq.db.FaqDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class FaqWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardWriteAction_execute ");
		
    	// 한글처리
		// request.setCharacterEncoding("UTF-8");
		System.out.println(" M : 한글처리 필터(web.xml) ");
		
		// 전달정보 저장
		FaqDTO dto = new FaqDTO();
		dto.setFaqTitle(request.getParameter("faqTitle"));
		dto.setFaqContents(request.getParameter("faqContents"));
		
		System.out.println(" M : "+dto);
		
		// DAO 객체 생성 - insertBoard();
		FaqDAO dao = new FaqDAO();
		dao.insertFaq(dto);
		
		// 페이지 이동 ( List )
		ActionForward forward = new ActionForward();
		forward.setPath("./FaqList.park");
		forward.setRedirect(true);
		return forward;
	}

}
