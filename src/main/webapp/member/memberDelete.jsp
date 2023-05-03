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
	<%
	// 로그인 세션 제어		
// 	String id = (String)session.getAttribute("id");
// 	if(id == null ){
// 		response.sendRedirect("main.jsp");
// 	}
	%>

	<c:if test="${empty id }"> <!-- sessionScope.id -->
	 	<c:redirect url="./MemberLogin.park"/>
	</c:if>

	<h1>memberDelete.jsp</h1>
	<h2>회원정보 탈퇴(TEAM2)</h2>

	<fieldset>
		<form action="./MemberDeleteAction.park" method="post">
			<input type="hidden" name="id" value="${id }">
			비밀번호 : <input type="password" name="pw">
			<input type="submit" value="탈퇴하기">
		</form>
	</fieldset>
	

	
	
	
	
	
</body>
</html>