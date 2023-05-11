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

public class AdminResDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminResDataAction_execute() 실행");
		
		
		AdminDAO dao = new AdminDAO();
		
		// 총 예약수
		int resCount = dao.resCount();
		
		// 예약 리스트
		List<ResDTO> resListAll = dao.resList();
		
		// 예약취소수
		int resCancelCount = dao.resCancelCount();
		
		
		
		// Main페이지에서 넘어온 정보 저장
		int page = 1;
		int perPage = 5; // 정보 못 가져올때의 기본값 단, 페이징처리는 안됨
		try {
			page = Integer.parseInt(request.getParameter("page"));		// page, perPage 값을 받아옴
		} catch (Exception e) {
			System.out.println("page 정수로 변환 실패, 기본값 1 적용");
		}
		
		try {
			perPage = Integer.parseInt(request.getParameter("perPage"));
		} catch (Exception e) {
			System.out.println("perPage 정수로 변환 실패, 기본값 5 적용");
		}
		
		
		
		int startIndex = (page - 1) * perPage; // perPage가 10일때 1페이지 -> 0 ~ 9까지 출력 // 2페이지 -> 10 ~ 19 출력
		int endIndex = Math.min(startIndex + perPage, resCount);
		
		// 페이징 처리 위해 List를 나눔
		List<ResDTO> resList = resListAll.subList(startIndex, endIndex);
		
		
		
		// json 객체에 저장하기
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();
		
		
		// 1. 전체예약건수 카운트 저장
		jsonObject.addProperty("resCount", resCount);
		
		// 2. reservation 테이블에 있는 정보를 모두 저장
		JsonArray resArray = new JsonArray();
		for (ResDTO dto : resList) {
			JsonObject resObject = new JsonObject();
			resObject.addProperty("resNo", dto.getResNo());
			resObject.addProperty("id", dto.getId());
			resObject.addProperty("parkingCode", dto.getParkingCode());
			resObject.addProperty("parkingPosition", dto.getParkingPosition());
			resObject.addProperty("resDate", dto.getResDate()+"");
			resObject.addProperty("parkInTime", dto.getParkInTime()+"");
			resObject.addProperty("parkOutTime", dto.getParkOutTime()+"");
			resObject.addProperty("price", dto.getPrice());
			resObject.addProperty("carNo", dto.getCarNo());
			resObject.addProperty("resStatus", dto.getResStatus());
			resArray.add(resObject);
		}
		
		jsonObject.add("resList", resArray);
		
		
		// 3. 총 예약취소건수 저장
		jsonObject.addProperty("resCancelCount", resCancelCount);
		
		
		// 위에서 저장한 객체 json 형태로 저장
		String jsonString = jsonObject.toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		System.out.println("예약 데이터 저장(json) 완료");
		
		return null;
		
	}

}
