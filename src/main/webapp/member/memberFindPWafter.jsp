<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.team2.member.db.MemberDAO"%>
<%@page import="com.team2.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<h1>아이디/비밀번호 찾기</h1>
 
<hr>
<h3>아이디 찾기</h3>
			<% String pw = (String)session.getAttribute("pw"); 
			%>
			<form action="./MemberLogin.me" method="post">
			<label>회원가입 시 사용한 비밀번호는 <%=pw %> 입니다.</label>
			<div><input type="submit" value="로그인 화면으로 돌아가기" "></div>
			</form>
			
</body>
</html>