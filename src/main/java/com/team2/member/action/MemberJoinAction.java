package com.team2.member.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;

// 회원가입 처리(인코딩, 정보저장, 디비연결, 페이지 이동)
public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberJoinAction_execute() 실행");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// MemberDTO 객체 생성
		MemberDTO dto = new MemberDTO();
		// 전달된 정보 저장
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setMemName(request.getParameter("memName"));
		dto.setBirth(request.getParameter("birth"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		dto.setRegdate(new Date(System.currentTimeMillis()));
		
		System.out.println(" M : "+dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 회원가입 메서드
		dao.memberJoin(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.park");
		forward.setRedirect(true);
		
		System.out.println(" M : 데이터 처리완료! 티켓 가지고 이동");
		
		return forward;
	}
	
	
}