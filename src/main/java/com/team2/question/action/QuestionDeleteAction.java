package com.team2.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.question.db.QuestionDAO;

public class QuestionDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" D : QuestionDeleteAction_execute() 호출 ");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
//		if(id == null) {
//			forward.setPath("./MainMain.park");
//			forward.setRedirect(true);
//			return forward;
//		}
		// 정보 저장(id,pw)
		int quNo = Integer.parseInt(request.getParameter("quNo"));
		System.out.println("quNO : " + quNo);
		
		request.setCharacterEncoding("UTF-8");
		
		// 회원탈퇴 - DAO 객체 - deleteMemember()
		QuestionDAO dao = new QuestionDAO();
		int result = dao.deleteQuestion(quNo);
		
		// 삭제 결과에 따른 페이지 이동(JS)
		// JSFoward jsFoward = new JSFoward(); 
		// result == 1

		JSForward.alertAndMove(response, "글 삭제 완료!", "./QuestionList.qu");
		
		return null;
	}

}
