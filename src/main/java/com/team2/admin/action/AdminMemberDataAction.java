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

public class AdminMemberDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMemberDataAction_execute() 실행");
		
		
		AdminDAO dao = new AdminDAO();
		
		
		// 총 회원수
		int memberListCount = dao.memberListCount();

		// 회원 리스트
		List<MemberDTO> memberListAll = dao.memberList();
		
		
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
		int endIndex = Math.min(startIndex + perPage, memberListCount);
		
		// 페이징 처리 위해 List를 나눔
		List<MemberDTO> memberList = memberListAll.subList(startIndex, endIndex);
		
		
		
		
		//json 객체에 저장하기
		
		// 정보 담을 jsonObjec 객체 생성
		JsonObject jsonObject = new JsonObject();

		
		// 1. 전체회원수 카운트 저장
		jsonObject.addProperty("memberListCount", memberListCount);
		
		// 2. 멤버 테이블에 있는 정보를 모두 저장
		JsonArray memberArray = new JsonArray();
		for(MemberDTO dto : memberList) {
			JsonObject memberObject = new JsonObject();
			memberObject.addProperty("id", dto.getId());
			memberObject.addProperty("pw", dto.getPw());
			memberObject.addProperty("memName", dto.getMemName());
			memberObject.addProperty("tel", dto.getTel());
			memberObject.addProperty("birth", dto.getBirth()+""); // 문자열로 바꾸기
			memberObject.addProperty("email", dto.getEmail());
			memberObject.addProperty("regDate", dto.getRegDate()+"");
			memberObject.addProperty("resStatus", dto.getResStatus());
			memberArray.add(memberObject);
		}
		
		jsonObject.add("memberList", memberArray); // 여기까지 멤버리스트 테이블
		
		
		// 위에서 저장한 객체 json 형태로 저장
		String jsonString = jsonObject.toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		System.out.println("회원 데이터 저장(json) 완료");
		
		return null;
		
	}

}
