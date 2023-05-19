package com.team2.question.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.question.db.QuestionDAO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class QuestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : BoardListAction_execute() 호출 ");
		
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// DAO 객체 생성
		QuestionDAO dao = new QuestionDAO();

		// 전체 글 개수
		int count = dao.getquCount();

		// 한 페이지에 출력할 글의 개수
		int pageSize = 10;
		// 현 페이지 정보가 몇페이지 인지 체크
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 시작행 번호 계산 // 1 11 21 31 ....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		// 끝행 번호 계산 // 10 20 30 40 ....
		int endRow = currentPage * pageSize;
		//////////////////////////////////////////////////////////////

		// 전체 페이지수 계산
		// 전체 : 50, 페이지당 10씩 출력 => 5개
		// 전체 : 56, 페이지당 10씩 출력 => 6개
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 2;

		// 시작페이지 번호 1~10 => 1 11~20 => 11
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호 1~10 => 10, 11~20 => 20
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		////////////////////////////////////////////////////////////////
		// DB에서 페이징 처리된 리스트 들고오기
		List queList = dao.getquList(startRow, pageSize);

		// 계산된 정보를 모두 저장 -> 전달

		// request 영역에 저장
		// (count,boardList,pageCount,pageNum,pageBlock,startPage,endPage)
		request.setAttribute("count", count);
		request.setAttribute("quList", queList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./quList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
