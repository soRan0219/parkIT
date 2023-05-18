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
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		MemberDAO dao = new MemberDAO();
		
		List<ResDTO> resList = dao.getResList(id);
		
		request.setAttribute("resList", resList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/resLog.jsp");
		forward.setRedirect(false);
		
		return forward;
	} //execute()

} 
