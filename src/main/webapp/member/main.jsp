<%@page import="javax.management.MBeanAttributeInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <link rel="stylesheet" href="css/park_main.css"> -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/park_memain.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
<!-- 	<h1>MyPage</h1>  -->
	<!-- 로그인 정보가 있을때만 메인페이지를 사용가능 -->
	
	<c:if test="${empty id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
<%-- 	아이디: ${id } <br> --%>
	
<!-- 	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me'">	 -->
<!-- 	<hr> -->
	
	
	
	
<section class="ftco-section contact-section">

<div class="container">
 <div class="row d-flex mb-5 contact-info">
  <div class="col-mb-4">
   <div class="col-mb-5">
   
    <div class="col-mb-12">
     <div class="border w-100 p-4 rounded mb-2 d-flex">
		<p>
		 <a href="./MemberUpdate.me">내 정보 보기 및 수정</a>
		</p>
	</div>
    </div>
    
    <div class="col-mb-12">
    <div class="border w-100 p-4 rounded mb-2 d-flex">
    	<p>
		<a href="./MemberPasswordUpdate.me">비밀번호 변경</a>
		</p>
	</div>
	</div>

    <div class="col-mb-12">
    <div class="border w-100 p-4 rounded mb-2 d-flex">
    	<p>
		<a href="./MemberDelete.me">회원 탈퇴</a>
		</p>
	</div>
	</div>
  

    
   </div>
  </div>
 </div>
</div>


</section>	



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
		
		<h3><a href="./MemberList.me">회원 정보 목록</a></h3>
	</c:if>
		
	<% 
// 		}
// 	} 
	%>
	
</body> 
</html>