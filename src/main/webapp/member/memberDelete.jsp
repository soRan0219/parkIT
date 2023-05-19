<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ParkIT : 회원 탈퇴</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">	

<link rel="stylesheet" href="css/find.css">

<link rel="stylesheet" href="css/alert.css">
<link rel="stylesheet" href="css/park_delete.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	
	<c:if test="${empty id }">
	 	<c:redirect url="./MemberLogin.me"/>
	</c:if>

<!-- 	<h2>회원 탈퇴</h2> -->

<div class="form-group">
	<a class="navbar-brand" href="./Main.park">
		Park<span>IT</span>
	</a>
</div>

<div class="login_content">
	
	<fieldset>
		<form action="./MemberDeleteAction.me" method="post">
			<input type="hidden" name="id" value="${id }">
			비밀번호 : <input type="password" name="pw" class="input_text">
			<input type="submit" value="회원 탈퇴" class="btn_login">
		</form>
	</fieldset>
	
	</div>
<!-- 	<h3><a href="./Main.park">메인페이지로</a></h3> -->
	
	
	
	
	
</body>
</html>