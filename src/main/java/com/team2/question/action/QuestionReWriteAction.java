package com.team2.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.question.db.QuestionDAO;
import com.team2.question.db.QuestionDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;


public class QuestionReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardWriteAction_execute ");
		
    	// 한글처리
		 request.setCharacterEncoding("UTF-8");
//		System.out.println(" M : 한글처리 필터(web.xml) ");
		
		// 전달정보 저장
		QuestionDTO dto = new QuestionDTO();
		dto.setId(request.getParameter("id"));
		dto.setQuTitle(request.getParameter("quTitle"));
		dto.setQuContents(request.getParameter("quContents"));
		dto.setSelOp(request.getParameter("selOp"));
		dto.setQuNoRe(Integer.parseInt(request.getParameter("quNoRe")));
		
		System.out.println(" M : "+dto);
		
		// DAO 객체 생성 - insertBoard();
		QuestionDAO dao = new QuestionDAO();
		dao.reWriteQuestion(dto);
		
		// 페이지 이동 ( List )
		ActionForward forward = new ActionForward();
		forward.setPath("./QuestionList.qu");
		forward.setRedirect(true);
		return forward;
	}

}
