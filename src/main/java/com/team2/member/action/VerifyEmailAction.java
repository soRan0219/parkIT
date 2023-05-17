package com.team2.member.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class VerifyEmailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("VerifyEmailAction_execute() 실행");
		
		String userVerificationCode = request.getParameter("verificationCode");
	    String sessionVerificationCode = (String) request.getSession().getAttribute("verificationCode");

	    boolean verificationResult = false;

	    if (userVerificationCode != null && sessionVerificationCode != null && userVerificationCode.equals(sessionVerificationCode)) {
	      verificationResult = true;
	    }
	    
	 // Send verification result as a response
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(verificationResult);
        out.close();

        return null;

	  }
	
}