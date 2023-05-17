package com.team2.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.notice.db.NoticeDAO;
import com.team2.notice.db.NoticeDTO;

public class NoticeUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeUpdateProAction_execute() ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		String pageNum = request.getParameter("pageNum");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		// NoticeDAO 객체 생성
		NoticeDAO dao = new NoticeDAO();
		
		// 특정 번호에 해당하는 글 정보 가져오기
		NoticeDTO dto = dao.getNotice(noticeNo);
		
		// request 영역에 dto 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeUpdateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
	


