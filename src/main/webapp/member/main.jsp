<%@page import="java.beans.JavaBean"%>
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp(TEAM2)</h1> 
	<!-- 로그인 정보가 있을때만 메인페이지를 사용가능 -->
	
	
	<%
		// 로그인 정보 
// 		String id = (String)session.getAttribute("id");
	
// 		if(id == null){
// 			response.sendRedirect("loginForm.jsp");
			
// 		}
	%>
	
	<!-- 스크립틀릿 말고 jstl 사용하기 -->
	<!-- 로그인 정보 -->
<%-- 	<c:set var="id" value="${sessionScope.id }" scope="page"/> --%>
	
	<!--  empty 참조변수 : 객체가 null, 컬렉션 사이즈가 0일 때 true 리턴 -->
	<c:if test="${empty id }">
		<c:redirect url="./MemberLogin.park"/>
	</c:if>
	
<%-- 	로그인 아이디 : <%=session.getAttribute("id") %> <br> --%>
	아이디: ${id } <br> <!-- sessionScope 생략 -->
	
	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.park'">	
	<hr>
	
	<h3><a href="./MemberInfo.park">회원정보 조회</a></h3>

	<h3><a href="./MemberUpdate.park">회원정보 수정</a></h3>

	<h3><a href="./MemberDelete.park">회원정보 삭제</a></h3>


	<!-- admin 계정 추가하기 -->
	<hr>
	<% 
		// JSP 페이지 -> JSP코드 처음부터 끝까지 모두 실행한 다음에 동작
		// 객체의 정보를 비교할때는 항상 데이터가 있는지 체크 후 비교
		
// 		if(id != null && id.equals("admin") ){ } // 밑의 if 두 문장을 하나로 가능
		
// 		if(id != null){
// 			if(id.equals("admin")){ 
	%>
			
	<c:if test="${!empty id && id.equals('admin') }">
		<!--  관리자 계정(admin)만 확인가능한 메뉴 -->
		<h2>관리자 전용 메뉴</h2>
		
		<h3><a href="./MemberList.park">회원 정보 목록</a></h3>
	</c:if>
		
	<% 
// 		}
// 	} 
	%>
	
</body> 
</html>