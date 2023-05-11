package com.team2.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.team2.admin.db.AdminDAO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class AdminCountDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminCountDataAction_execute() 실행");
		
		
		AdminDAO dao = new AdminDAO();
		
		
		// 총 회원수
		int memberListCount = dao.memberListCount();
		// 총 예약수
		int resCount = dao.resCount();
		// 총 예약취소수
		int resCancelCount = dao.resCancelCount();
		
		// A ~ C 예약 수
		int resCountA = dao.resCount("A");
		int resCountB = dao.resCount("B");
		int resCountC = dao.resCount("C");
		
		
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();
		

		
		// 전체회원수 카운트 저장
		jsonObject.addProperty("memberListCount", memberListCount);
		
		// 전체예약건수 카운트 저장
		jsonObject.addProperty("resCount", resCount);
		
		// 총 예약취소건수 저장
		jsonObject.addProperty("resCancelCount", resCancelCount);
		
		
		// A ~ C 예약 수 저장
		jsonObject.addProperty("resCountA", resCountA);
		jsonObject.addProperty("resCountB", resCountB);
		jsonObject.addProperty("resCountC", resCountC);
		
		
		
		// 위에서 저장한 객체 json 형태로 저장
		String jsonString = jsonObject.toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		System.out.println("카운트 데이터 저장(json) 완료");
		
		return null;
		
	}

}
