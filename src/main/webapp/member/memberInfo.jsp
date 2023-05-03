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
	<h1>memberInfo.jsp(마이페이지)</h1>
	
	<h2>마이페이지</h2>
	
	
	<%
		// 로그인 세션 제어 (로그인 했을때만 사용)
		
		// 로그인한 회원의 정보(DB)를 화면에 출력
	%>
	
	<c:if test="${empty id }"> <!-- sessionScope.id -->
		<c:redirect url="./MemberLogin.park"/>
	</c:if>
	
<%-- 	${dto } <br> --%>
<%-- 	${requestScope.dto } <br> --%>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${dto.pw }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.memname }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${dto.birth }</td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td>${dto.tel }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email }</td>
		</tr>
		<tr>
	</table>
	
	<h2><a href="./Main.park">메인페이지로</a></h2>

	
	
	



</body>
</html>