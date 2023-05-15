package com.team2.notice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.notice.db.NoticeDAO;

public class NoticeDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("NoticeDeleteAction_execute()");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		System.out.println("noticeNO : " + noticeNo);
		
        NoticeDAO dao = new NoticeDAO();
        
        dao.deleteNotice(noticeNo);
        
		
		System.out.println("글 삭제, 세션제거 완료");
		
		
		
		
		
		
		// ----------------------------------------------------------------------------
		// 다시 List 페이지 보여주려고 하는 작업
		
		// 페이징처리 1단계
		
		// 공지글 개수 체크하는 메서드
		int noticeCount = dao.getNoticeCount();
		
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 10;
		
		// 현 페이지의 페이지값 확인
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) { // 페이지 정보가 없을 경우 항상 1페이지
			pageNum = "1";
		}
		
		// 시작 행번호 계산 1...10 / 11...20 / 21...30
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 끝 행번호 계산
		int endRow = currentPage * pageSize;
		////////////////////////////////////////////////////////
		
		
		
		
		//////////////// 페이징 처리 2단계
		
		int pageCount = noticeCount / pageSize + (noticeCount % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호개수
		int pageBlock = 3;

		// 페이지 블럭의 시작페이지 번호 1...10/11...20/21....30/31....40
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		/////////////////////////////////////////////////////////////////
		// DB에서 페이징 처리된 리스트 들고오기
		List noticeList = dao.getNoticeList(startRow, pageSize);
		
		
		// request 영역에 boardList 저장
		request.setAttribute("noticeCount", noticeCount);
		request.setAttribute("noticeList", noticeList);
		
		// 페이징처리를 위한 정보 추가 저장
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeList.jsp");
		forward.setRedirect(false);	
		return forward;
		
	}
	
	

}
