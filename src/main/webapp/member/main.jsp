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
		<h1>main.jsp(team2)</h1>
		<c:if test="${ empty id }">
		  <c:redirect url="./MemberLogin.park" />		
		</c:if>




		로그인 아이디 : <%=session.getAttribute("id") %><br> 
		로그인 아이디(el) : ${sessionScope.id }<br> 

		<input type="button" value="로그아웃" onclick=" location.href='./MemberLogout.park';">
		<hr>


		<h3><a href="./MemberInfo.park">회원 정보 조회</a></h3>

		<h3><a href="./MemberUpdate.park">회원 정보 수정</a></h3>

		<h3><a href="./MemberDelete.park">회원 정보 삭제</a></h3>





</body>
</html>