package com.team2.main.action;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.parkingdetail.db.PDetailDAO;

public class IntroAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: IntroAction_execute()");
		
		//현재 날짜 시간
		LocalDate localDate = LocalDate.now();
		System.out.println(localDate);
		
		Date date = Date.valueOf(localDate);
		System.out.println(date);
		
		LocalTime localTime = LocalTime.now();
		System.out.println(localTime);
		
		Time time = Time.valueOf(localTime);
		System.out.println(time);
		
		
		String parkingA = "A";
		String parkingB = "B";
		String parkingC = "C";
		
		//DAO - 전체 자리 개수
		PDetailDAO dao = new PDetailDAO();
		int allA = dao.getAllPositions(parkingA);
		System.out.println("A 전체 자리: " + allA);
		request.setAttribute("allA", allA);
		
		int allB = dao.getAllPositions(parkingB);
		System.out.println("B 전체 자리: " + allB);
		request.setAttribute("allB", allB);
		
		int allC = dao.getAllPositions(parkingC);
		System.out.println("C 전체 자리: " + allC);
		request.setAttribute("allC", allC);
		
		//DAO - 현재 날짜, 시간에 예약 가능한 자리 개수
		int availableA = dao.getAvailablePositions(parkingA, date, time);
		System.out.println("A 예약 가능한 자리: " + availableA);
		request.setAttribute("availableA", availableA);
		
		int availableB = dao.getAvailablePositions(parkingB, date, time);
		System.out.println("B 예약 가능한 자리: " + availableB);
		request.setAttribute("availableB", availableB);
		
		int availableC = dao.getAvailablePositions(parkingC, date, time);
		System.out.println("C 예약 가능한 자리: " + availableC);
		request.setAttribute("availableC", availableC);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./introduction/introduction.jsp");
		forward.setRedirect(false);
		
		return forward;
	} //execute()

} //IntroAction
