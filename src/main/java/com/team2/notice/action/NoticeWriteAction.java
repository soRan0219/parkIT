package com.team2.notice.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.notice.db.NoticeDAO;
import com.team2.notice.db.NoticeDTO;

public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeWriteAction_execute() ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파일이 저장되는 실제 경로
		String realPath = request.getRealPath("/upload");
		
		// 파일 최대 사이즈 (10메가)
		int maxSize = 10 * 1024 * 1024;
		
		// MultipartRequest 객체 생성(업로드)
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"UTF-8", new DefaultFileRenamePolicy());
		
		// 세션정보 제어(로그인 + 관리자일때만 사용)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보 저장 - NoticeDTO 생성
		NoticeDTO dto = new NoticeDTO();
		dto.setNoticeTitle(multi.getParameter("noticeTitle"));
		dto.setNoticeContents(multi.getParameter("noticeContents"));
		dto.setNoticeDate(new Date(System.currentTimeMillis()));
//		
//		// 첨부파일명 저장
		dto.setNoticeFile(multi.getFilesystemName("noticeFile"));
		
		// NoticeDAO 객체생성
		NoticeDAO dao = new NoticeDAO();
		dao.insertNotice(dto);
		
		// 페이지 이동
//		forward = new ActionForward(); // 위에 있으니까 안적어도 되는거
		
		
		forward.setPath("./noticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}

}
