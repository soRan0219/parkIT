package com.team2.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.admin.db.MemberDAO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;


public class AdminMemberAction implements Action { //q

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : AdminMemberAction_execute()");
		
		ActionForward forward = new ActionForward();
		
		
		
		
		MemberDAO dao = new MemberDAO();
		
		List<Object> memberList = dao.memberList();
		
		request.setAttribute("memberList", memberList);
		
		forward.setPath("./admin/adminMember.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
