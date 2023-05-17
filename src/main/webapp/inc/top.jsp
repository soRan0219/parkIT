<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.ftco-navbar-light.scrolled .nav-link {
    padding-top: 0 !important;
    padding-bottom: 0 !important;
    color: #000000 !important;
}
.nav-link {
  white-space: nowrap;
}
</style>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="./Main.park">Park<span>IT</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
			</button>
			
			

			<div class="collapse navbar-collapse" id="ftco-nav">
  <ul class="navbar-nav ml-auto">
    <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
    <li class="nav-item dropdown">
      <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">회사소개</a>
      <ul class="dropdown-menu">
        <li class="nav-item"><a href="pricing.jsp" class="nav-link2">이용수칙</a></li>
        <li class="nav-item"><a href="./Introduction.park" class="nav-link2">주차장 안내</a></li>
      </ul>
    </li>
    <li class="nav-item"><a href="./Reservation.res" class="nav-link">예약하기</a></li>
     <li class="nav-item dropdown">
      <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
      <ul class="dropdown-menu">
        <li class="nav-item"><a href="./noticeList.no" class="nav-link2">공지사항</a></li>
        <li class="nav-item"><a href="./FaqList.fa" class="nav-link2">자주 묻는 질문</a></li>
      </ul>
    </li>
  </ul>
</div>
		</div>

<c:if test="${empty id }">
  <div class="login-form" >
  
    <div class="form-group">
      <a class="navbar-brand" id="login-size" href="./MemberLogin.me">Park<span>IT 로그인</span></a>
    </div>
    <div class="join-membership">
      <a href="#" class="nav-link" style="color: white; padding: 0;">아이디/비밀번호 찾기</a>
    </div>
    <div class="join-membership">
      <a href="./MemberJoin.me" class="nav-link" style="color: white; padding: 0;">회원가입</a>
    </div>
    
  </div>
  
</c:if>
<c:if test="${not empty id }">
  <div class="login-form">
    아이디: ${id } <br> <!-- sessionScope 생략 -->
    
		<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me'">	
		<hr>
		<h6><a href="./Main.me" class="nav-link" style="color: white; padding: 0;">회원정보 조회</a></h6>
	
		<h6><a href="./MemberUpdate.me" class="nav-link" style="color: white; padding: 0;">회원정보 수정</a></h6>
	
		<h6><a href="./MemberDelete.me" class="nav-link" style="color: white; padding: 0;">회원정보 삭제</a></h6>
	
  </div>
</c:if>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap ftco-degree-bg"
		style="background-image: url('images/park5.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
				<div class="col-lg-8 ftco-animate">
					<div class="text w-100 text-center mb-md-5 pb-md-5">
						<h1 class="mb-4">빠르고 쉽게 예약하고 주차하자
							ParkIT</h1>
						<p style="font-size: 18px;">주차걱정 없이 안전하게
							주차하자!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

