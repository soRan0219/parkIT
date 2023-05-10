package com.team2.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.notice.db.NoticeDAO;
import com.team2.notice.db.NoticeDTO;

public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeContentAction_execute() ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String pageNum = request.getParameter("pageNum");
		
		// NoticeDAO 객체 생성
		NoticeDAO dao = new NoticeDAO();
		
		// 조회수 1증가
		dao.updateNoticeRc(noticeNo);
		
		// 특정 번호에 해당하는 글 정보 가져오기
		NoticeDTO dto = dao.getNotice(noticeNo);
		
		// 리퀘스트영역에 정보 저장
		request.setAttribute("dto", dto);
		
		// pageNum 전달
		request.setAttribute("pageNum", pageNum);
		
//		if(dao.getNotice(50)!=null) {
//		NoticeDTO dtoTest = dao.getNotice(50);
//		}
		// 이전글----------------------------------------------------------------------------------------------------
		
		while(noticeNo > 1) {
			
			noticeNo --;
			
			if(dao.getNotice(noticeNo) != null) {
				NoticeDTO dtoPre = dao.getNotice(noticeNo);
				request.setAttribute("dtoPre", dtoPre);
				break;
			}
		}
		
		// ----------------------------------------------------------------------------------------------------
		
		// 다음글----------------------------------------------------------------------------------------------------
		
		noticeNo = Integer.parseInt(request.getParameter("noticeNo")); // 위에서 noticeNo 값이 바꼈으니 다시 받아와서 원래대로
		
		int noticeCount = dao.getNoticeCount();
		
		int maxNoticeCount = dao.getMaxNoticeCount();
		
		request.setAttribute("maxNoticeCount", maxNoticeCount);
		
		while(noticeNo <= noticeCount) {
			
			noticeNo ++;
			
			if(dao.getNotice(noticeNo) != null) {
				NoticeDTO dtoNext = dao.getNotice(noticeNo);
				request.setAttribute("dtoNext", dtoNext);
				break;
			}
		}
		
		// ----------------------------------------------------------------------------------------------------
		
		// 화면 출력하는 뷰페이지(.jsp)로 전달
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeContent.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
