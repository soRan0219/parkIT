package com.team2.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.team2.admin.db.AdminDAO;
import com.team2.admin.db.MemberDTO;
import com.team2.admin.db.ParkingDTO;
import com.team2.admin.db.ResDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class AdminParkingInfoDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminParkingInfoDataAction_execute() 실행");
		
		
		AdminDAO dao = new AdminDAO();
		
		
		List<ParkingDTO> parkingInfoList = dao.parkingInfo();
		
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();

		// 6. 주차장정보 저장
		JsonArray parkingInfoArray = new JsonArray();
		for (ParkingDTO dto : parkingInfoList) {
			JsonObject parkingObject = new JsonObject();
			parkingObject.addProperty("parkingCode", dto.getParkingCode());
			parkingObject.addProperty("parkingName", dto.getParkingName());
			parkingObject.addProperty("parkingAdr", dto.getParkingAdr());
			parkingObject.addProperty("inOutDoor", dto.getInOutDoor());
			parkingObject.addProperty("parkingTotal", dto.getParkingTotal());
			parkingObject.addProperty("parkingTel", dto.getParkingTel());
			parkingInfoArray.add(parkingObject);
		}
		
		jsonObject.add("parkingInfoList", parkingInfoArray);
		
		
		
		// 위에서 저장한 객체 json 형태로 저장
		String jsonString = jsonObject.toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		System.out.println("주차장 정보 저장(json) 완료");
		
		return null;
		
	}

}
