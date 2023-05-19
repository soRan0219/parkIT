package com.team2.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.admin.db.ResDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;

public class ResLogAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: ResLogAction_execute()");
		
		//세션에서 아이디 정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//예약 테이블에서 해당 아이디와 일치하는 정보 가져오기(최근 날짜순)
		MemberDAO dao = new MemberDAO();
		List<ResDTO> resList = dao.getResList(id);
		
		//request영역에 저장
		request.setAttribute("resList", resList);
		
		//resLog.jsp로 포워딩
		ActionForward forward = new ActionForward();
		forward.setPath("./member/resLog.jsp");
		forward.setRedirect(false);
		
		return forward;
	} //execute()

} 
