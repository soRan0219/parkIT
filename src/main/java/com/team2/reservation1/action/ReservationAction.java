package com.team2.reservation1.action;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.team2.admin.db.ResDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.reservation1.db.ResDAO;



public class ReservationAction implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("ReservationAction_execute() 실행");
		
		ResDAO dao = new ResDAO();
		
		
		String resDateStr = request.getParameter("resDate"); // 받아온 후 아래코드 에서 Date 객체로 변환
		Date resDate = new SimpleDateFormat("yyyy-MM-dd").parse(resDateStr);
		String parkInTime = request.getParameter("parkInTime");
		String parkOutTime = request.getParameter("parkOutTime");
		String parkingCode = request.getParameter("parkingCode");
		
		
		List<ResDTO> getAvailable = dao.getAvailable(parkingCode, parkInTime, parkOutTime, resDate);
		
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();
		
		// 이용중인 자리정보 모두 저장
		JsonArray availableArray = new JsonArray();
		for(ResDTO dto : getAvailable) {
			JsonObject availableObject = new JsonObject();
			availableObject.addProperty("parkPosition", dto.getParkingPosition());
			availableObject.addProperty("resStatus", dto.getResStatus());
			availableObject.addProperty("parkingCode", dto.getParkingCode());
			availableArray.add(availableObject);
		}
		
		jsonObject.add("getAvailable", availableArray);
		
		
		// 저장한 객체 json 형태로 저장
		String jsonString = jsonObject.toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		System.out.println("데이터 저장 완료");
		
		return null;
	} //execute()

} //ReservationAction
