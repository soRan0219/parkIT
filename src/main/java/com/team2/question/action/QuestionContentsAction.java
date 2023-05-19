package com.team2.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.question.db.QuestionDAO;
import com.team2.question.db.QuestionDTO;

public class QuestionContentsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : QuestionContentAction_execute() ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		int quNo = Integer.parseInt(request.getParameter("quNo"));
		String pageNum = request.getParameter("pageNum");
		
		// NoticeDAO 객체 생성
		QuestionDAO dao = new QuestionDAO();
		
		
		// 특정 번호에 해당하는 글 정보 가져오기
		QuestionDTO dto = dao.getqu(quNo);
		
		// 리퀘스트영역에 정보 저장
		request.setAttribute("dto", dto);
		
		// pageNum 전달
		request.setAttribute("pageNum", pageNum);
		
//		if(dao.getNotice(50)!=null) {
//		NoticeDTO dtoTest = dao.getNotice(50);
//		}
		// 이전글----------------------------------------------------------------------------------------------------
		
		while(quNo > 1) {
			
			quNo --;
			
			if(dao.getqu(quNo) != null) {
				QuestionDTO dtoPre = dao.getqu(quNo);
				request.setAttribute("dtoPre", dtoPre);
				break;
			}
		}
		
		// ----------------------------------------------------------------------------------------------------
		
		// 다음글----------------------------------------------------------------------------------------------------
		
		quNo = Integer.parseInt(request.getParameter("quNo")); // 위에서 noticeNo 값이 바꼈으니 다시 받아와서 원래대로
		
		int noticeCount = dao.getquCount();
		
		int maxNoticeCount = dao.getMaxQuestionCount();
		
		request.setAttribute("maxNoticeCount", maxNoticeCount);
		
		while(quNo <= noticeCount) {
			
			quNo ++;
			
			if(dao.getqu(quNo) != null) {
				QuestionDTO dtoNext = dao.getqu(quNo);
				request.setAttribute("dtoNext", dtoNext);
				break;
			}
		}
		
		// ----------------------------------------------------------------------------------------------------
		
		// 화면 출력하는 뷰페이지(.jsp)로 전달
		ActionForward forward = new ActionForward();
		forward.setPath("./question/quContents.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
