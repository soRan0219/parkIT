package com.team2.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;
import com.team2.member.db.MemberDAO;
import com.team2.member.db.MemberDTO;
import com.mysql.cj.Session;

// 로그인 정보 처리 
public class MemberLoginAction implements Action{
	//
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberLoginAction_execute() 호출 ");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 ( id/pw ) 저장 - Member DTO
		MemberDTO dto = new MemberDTO(); 
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		// MemberDAO 객체 생성 
		MemberDAO dao = new MemberDAO(); 
		// 로그인 체크 메서드 호출 => 결과 확인
		int result = dao.memberLogin(dto); // 정수 데이터가 리턴됨
		
		// 페이지 이동
		if(result == -1) { // 아이디 없을 때 
			response.setContentType("text/html; charset=UTF-8"); // 처음 jsp 주소
			PrintWriter out = response.getWriter();
			// 이걸 써주면 html 코드를 출력해줄 수 있음
			out.println("<script>");
			out.println(" alert('아이디 또는 비밀번호를 잘못 입력했습니다. \\n입력하신 내용을 다시 확인해주세요.'); ");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null; // 컨트롤러에서는 이동 X 
			             // return은 리턴값 돌려줄 때 혹은 함수(execute)의 종료
		}
		
		if(result == 0) { // 비밀번호 틀렸을 때 
			response.setContentType("text/html; charset=UTF-8"); // 처음 jsp 주소
			PrintWriter out = response.getWriter();
			// 이걸 써주면 html 코드를 출력해줄 수 있음
			out.println("<script>");
			out.println(" alert('아이디 또는 비밀번호를 잘못 입력했습니다. \\n입력하신 내용을 다시 확인해주세요.'); ");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null; // 컨트롤러에서는 이동 X 
		}
		
		// 로그인 성공!(result == 1)
		// 세션에 아이디 정보 저장 // jsp가 아니기 때문에 session 내장객체가 없음
		HttpSession session = request.getSession(); // request는 MemberFrontController.java에서 받아옴
		session.setAttribute("id", dto.getId());
		
		// 페이지 이동 - ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		forward.setPath("./MainMain.park");
		forward.setRedirect(true);
		
		return forward;
	}

}