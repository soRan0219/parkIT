package com.team2.admin.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.team2.admin.db.MemberDAO;
import com.team2.admin.db.MemberDTO;
import com.team2.admin.db.ParkingDTO;
import com.team2.admin.db.ResDTO;
import com.team2.commons.Action;
import com.team2.commons.ActionForward;

public class AdminDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminDataAction_execute() 실행");
		
		
		MemberDAO dao = new MemberDAO();
		
		
		MemberDTO memberListCount = dao.memberListCount();
		ResDTO resCount = dao.resCount();
		List<MemberDTO> memberList = dao.memberList();
		List<ResDTO> resList = dao.resList();
		ResDTO resCancelCount = dao.resCancelCount();
		List<ParkingDTO> parkingInfoList = dao.parkingInfo();
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();
		
		// 1. 전체회원수 카운트 저장
		jsonObject.addProperty("memberListCount", memberListCount.toString());
		
		// 2. 전체예약건수 카운트 저장
		jsonObject.addProperty("resCount", resCount.toString());
		
		
		
		// 3. 멤버 테이블에 있는 정보를 모두 저장
		JsonArray memberArray = new JsonArray();
		for(MemberDTO dto : memberList) {
			JsonObject memberObject = new JsonObject();
			memberObject.addProperty("id", dto.getId());
			memberObject.addProperty("pw", dto.getPw());
			memberObject.addProperty("memName", dto.getMemName());
			memberObject.addProperty("tel", dto.getTel());
			memberObject.addProperty("birth", new SimpleDateFormat("yyyy-MM-dd").format(dto.getBirth()));
			memberObject.addProperty("email", dto.getEmail());
			memberObject.addProperty("regDate", new SimpleDateFormat("yyyy-MM-dd").format(dto.getRegDate()));
			memberObject.addProperty("point", dto.getPoint());
			memberObject.addProperty("resStatus", dto.getResStatus());
			memberArray.add(memberObject);
		}
		
		jsonObject.add("memberList", memberArray); // 여기까지 멤버리스트 테이블
		
		
		// 4. reservation 테이블에 있는 정보를 모두 저장
		JsonArray resArray = new JsonArray();
		for (ResDTO dto : resList) {
			JsonObject resObject = new JsonObject();
			resObject.addProperty("resNo", dto.getResNo());
			resObject.addProperty("id", dto.getId());
			resObject.addProperty("parkingCode", dto.getParkingCode());
			resObject.addProperty("parkingPosition", dto.getParkingPosition());
			resObject.addProperty("resDate", new SimpleDateFormat("yyyy-MM-dd").format(dto.getResDate()));
			resObject.addProperty("parkInTime", new SimpleDateFormat("HH:mm:ss").format(dto.getParkInTime()));
			resObject.addProperty("parkOutTime", new SimpleDateFormat("HH:mm:ss").format(dto.getParkOutTime()));
			resObject.addProperty("price", dto.getPrice());
			resObject.addProperty("carNo", dto.getCarNo());
			resObject.addProperty("resStatus", dto.getResStatus());
			resArray.add(resObject);
		}
		
		jsonObject.add("resList", resArray);
		
		
		// 5. 총 예약취소건수 저장
		jsonObject.addProperty("resCancelCount", resCancelCount.toString());
		
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
		
		System.out.println("데이터 저장 완료");
		
		
		return null;
		
	}

}
