<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.team2.member.db.MemberDAO"%>
<%@page import="com.team2.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/find.css">

<link rel="stylesheet" href="css/park_find_af.css">
<link rel="stylesheet" href="css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<!-- <h1>아이디/비밀번호 찾기</h1> -->
 
 <div class="form-group">
	<a class="navbar-brand" href="./Main.park">
		Park<span>IT</span>
	</a>
</div>

<section class="findsec1"> 

<!-- <h3>아이디 찾기</h3> 이거 제목 넣말? -->
			<% String id = (String)session.getAttribute("id"); 
			%>
			<form action="./MemberLogin.me" method="post">
			<label>회원가입 시 사용한 아이디는 <b><%=id %></b> 입니다.</label>
			<div><input type="submit" value="로그인 화면으로 돌아가기" class="btn_login"></div>
			</form>
</section>	
</body>
</html>