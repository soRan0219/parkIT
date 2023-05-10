package com.team2.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.faq.db.FaqDAO;
import com.team2.faq.db.FaqDTO;

public class FaqUpdateAction implements Action {
	//
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : FaqUpdateAction_execute() ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MainMain.park");
			forward.setRedirect(true);
			return forward;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaqNo(Integer.parseInt(request.getParameter("faqNo")));
		dto.setFaqTitle(request.getParameter("faqTitle"));
		dto.setFaqContents(request.getParameter("faqContents"));
		
		
		
		System.out.println(dto);
		

		
		

		forward.setPath("./faq/faqUpdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
