<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<h1>아이디/비밀번호 찾기</h1>
 
<hr>
<h3>비밀번호 찾기</h3>
		<form action="./MemberFindPWAction.park" method="post">
		<table>
			<div>
				<label>* 아이디</label> <br>
				<input type="text" name="id" id="id">
			</div>
			
			<div>
				<label>* 이메일</label> <br>
				<input type="email" name="email" id="email">	
			</div>			
			
			<br>
			<input type="submit" value="비밀번호 찾기" >
		</table>
		</form>
		
		<hr>
		
		<h3>메뉴</h3>
		<form action="./MemberFindPW.park" method="post">
			<input type="submit" value="비밀번호 찾기">
		</form>

		<form action="./MemberFindID.park" method="post">
			<input type="submit" value="아이디 찾기" >
		</form>

</body>
</html>