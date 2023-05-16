package com.team2.member.action;
import java.io.PrintWriter;
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

// 회원가입 처리(인코딩, 정보저장, 디비연결, 페이지 이동)
public class MemberJoinAction implements Action{
	//
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberJoinAction_execute() 실행");
		
		// 한글처리
	
		request.setCharacterEncoding("UTF-8");
		
		// MemberDTO 객체 생성
		MemberDTO dto = new MemberDTO();
		// 전달된 정보 저장
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
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setMemname(request.getParameter("memname"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		dto.setRegdate(new Date(System.currentTimeMillis()));
		
		System.out.println(" M : "+dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 회원가입 메서드
		dao.memberJoin(dto);
		
		// 페이지 이동
		JSForward.alertAndMove(response, "회원 가입이 완료되었습니다.", "./MemberLogin.me");
		
		System.out.println(" M : 데이터 처리완료! 티켓 가지고 이동");
		
//		return forward;
		return null;
	}
	
	
}