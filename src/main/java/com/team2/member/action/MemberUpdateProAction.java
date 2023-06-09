package com.team2.member.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.commons.JSForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

public class MemberUpdateProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateProAction_execute");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("/MemberLogin.me");
			forward.setRedirect(true);
			
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// null 값일 때 제어
		String tel = request.getParameter("tel");
		
		if(tel == "" || tel.length() != 13) {
			JSForward.alertAndBack(response, "변경할 전화번호를 입력해주세요.");
			return null;
		}
		
		// 전달정보(파라미터) 저장(DTO)
		 MemberDTO dto = new MemberDTO();
		 
		 String dateString = request.getParameter("birth");
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 try {
		   java.util.Date parsedDate = dateFormat.parse(dateString);
		   java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
		   dto.setBirth(sqlDate);
		 } catch (ParseException e) {
		   e.printStackTrace();
		 } 
		
//		dto.setBirth(request.getParameter("birth"));
		dto.setEmail(request.getParameter("email"));
		dto.setId(request.getParameter("id"));
		dto.setMemname(request.getParameter("memname"));
		dto.setPw(request.getParameter("pw"));
		dto.setTel(request.getParameter("tel"));
		
		// DAO 정보수정 메서드 호출 - memberUpdate(dto)
		MemberDAO dao = new MemberDAO();
		
		int result = dao.memberUpdate(dto);
		
		System.out.println(" M : 정보 수정 결과: "+result);
		
		// 수정 처리 결과에 따른 페이지 이동
		if(result == -1) {
			JSForward.alertAndBack(response, "아이디없음");
			return null;
		}
		if(result == 0) {
			JSForward.alertAndBack(response, "비밀번호가 일치하지 않습니다.\\n다시 입력해주세요");
			return null;
		}
		
		JSForward.alertAndMove(response, "수정 되었습니다.", "./Main.park");
		return null;
	}

}
