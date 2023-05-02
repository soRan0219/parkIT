package com.team2.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.admin.db.MemberDAO;
import com.team2.admin.db.ResDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class AdminResAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminResAction_execute()");
		
		ActionForward forward = new ActionForward();
		
		
		
		
		MemberDAO dao = new MemberDAO();
		
		List<ResDTO> resList = dao.resList();
		System.out.println("예약 수 : " + resList.size());
		
		request.setAttribute("resList", resList);
		
		forward.setPath("./admin/adminRes.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
