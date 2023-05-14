<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title> parkIT </title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/park.css">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!--  datepicker -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- timepicker -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script type="text/javascript">			
	
	$(function() {
		$('#datepicker').datepicker({
			showOn:'focus',
// 			buttonImage:'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
// 			buttonImageOnly:'true',
			changeMonth:'true',
			changeYear:'true',
			nextText:'다음달',
			prevText:'이전달',
			showButtonPanel:'true',
			currentText:'오늘',
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			dayNamesMin:['월','화','수','목','금','토','일'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate:0,
			maxDate:+30
		});
		
		$('#fromTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'06:00',
			minTime:'06:00',
			maxTime: '22:00',
			dynamic:false,
			scrollbar:true,
			change:function(time) {
				console.log("fromTime: " + $(this).val());
				console.log("fromTime: " + time);
				var minTime = new Date(time);
				minTime.setMinutes(minTime.getMinutes() + 30);
				$('#toTime').timepicker('option', 'minTime', minTime);
			}
		});
		

		$('#toTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'06:00',
			minTime:'06:00',
			maxTime: '22:00',
			dynamic:false,
			scrollbar:true
		});
		
		$('input[type=submit]').click(function() {
			var selectedDate = $('#datepicker').val();
			var fromTime = $('#fromTime').val();
			var toTime = $('#toTime').val();
			
			$('#selectedDate').val(selectedDate);
			$('input[type="hidden"]#parkInTime').val(fromTime);
			$('input[type="hidden"]#parkOutTime').val(toTime);
		});
		
	});
	
	function check() {
		if(document.fr.datepicker.value=="") {
			alert("날짜를 선택하세요");
			document.fr.datepicker.focus();
			return false;
		} 
		if(document.fr.fromTime.value=="") {
			alert("입차시간을 선택하세요");
			document.fr.fromTime.focus();
			return false;
		}
		if(document.fr.toTime.value=="") {
			alert("출차시간을 선택하세요");
			document.fr.toTime.focus();
			return false;
		}
	} //check()
	
</script>

</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="./MainMain.park">Park<span>IT</span></a>
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
        <li class="nav-item"><a href="pricing.jsp" class="nav-link2">공지사항</a></li>
        <li class="nav-item"><a href="./FaqList.fa" class="nav-link2">자주 묻는 질문</a></li>
      </ul>
    </li>
  </ul>
</div>
		</div>

<c:if test="${empty id }">
  <div class="login-form">
    <div class="form-group">
      <a class="navbar-brand" href="./MemberLogin.me">Park<span>IT 로그인</span></a>
    </div>
    <div class="join-membership">
      <a href="#">아이디/비밀번호 찾기</a>
    </div>
    <div class="join-membership">
      <a href="./MemberJoin.me">회원가입</a>
    </div>
  </div>
</c:if>
<c:if test="${not empty id }">
  <div class="login-form">
    아이디: ${id } <br> <!-- sessionScope 생략 -->
	
	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me'">	
	<hr>
	
	<h3><a href="./MemberInfo.me">회원정보 조회</a></h3>

	<h3><a href="./MemberUpdate.me">회원정보 수정</a></h3>

	<h3><a href="./MemberDelete.me">회원정보 삭제</a></h3>
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
						<h1 class="mb-4">Fast &amp; Easy Way To Parking Lot
							Reservation</h1>
						<p style="font-size: 18px;">Always drive safely and return
							home safely</p>
						<a href="https://www.youtube.com/watch?v=uywSy854r8g"
							class="icon-wrap popup-vimeo d-flex align-items-center mt-4 justify-content-center">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="ion-ios-play"></span>
							</div>
							<div class="heading-title ml-5">
								<span>Easy steps for parking a car</span>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12	featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">
						
							<form action="./ReservationAction.res" name="fr" method="post" onsubmit="return check();" class="request-form ftco-animate bg-primary">
								<h2>Make your reservation</h2>
								<div class="form-group">
									<label for="" class="label">Parking location</label>
									<div class="dropdown">
										<select name="parking" class="btn parking">
											 <option value="A"> 서면점 </option>
											 <option value="B"> 해운대점 </option>
											 <option value="C"> 명지점 </option>
										</select>
									</div>
								</div>

								<script>
//   // 선택한 항목을 검색창에 나타내는 함수
//   function updateSearchInput(value) {
//     document.getElementById("parking-location").value = value;
//     document.querySelector(".dropdown-toggle").textContent = value;
//   }

//   // 선택한 항목을 검색창에 나타냄
//   const dropdownItems = document.querySelectorAll(".dropdown-item");
//   dropdownItems.forEach((item) => {
//     item.addEventListener("click", (event) => {
//       const selectedValue = event.target.textContent;
//       updateSearchInput(selectedValue);
//     });
//   });
</script>
								<div class="d-flex">
									<div class="form-group mr-2">
										<label for="" class="label">주차 날짜</label> 
										<input type="text" class="form-control datepicker" id="datepicker" placeholder="Date" autocomplete="off">
									</div>
								</div>
								<div class="d-flex">

									<div class="form-group ml-2">
										<label for="park_on_time" class="label">입차 시간</label> 
										<input type="text" id="fromTime" class="form-control ui-timepicker-wrapper" autocomplete="off">
									</div>

								</div>
								<div class="d-flex">
									<div class="form-group ml-2">
										<label for="park_off_time" class="label">출차 시간</label> 
										 <input type="text" id="toTime" class="form-control" autocomplete="off">
									</div>

								</div>

								<input type="hidden" id="selectedDate" name="selectedDate">
								<input type="hidden" id="parkInTime" name="parkInTime">
								<input type="hidden" id="parkOutTime" name="parkOutTime">
								
								<div class="form-group">
									<input type="submit" value="예약하기"
										class="btn btn-secondary py-3 px-4">
								</div>
							</form>
						</div>
						<div class="col-md-8 d-flex align-items-center">
							<div class="services-wrap rounded-right w-100">
								<h3 class="heading-section mb-4">주차장 선택의 최고의 방법</h3>
								<div class="row d-flex mb-4">
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-route"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">주차장 장소 선택</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-handshake"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">Select the Best Deal</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-rent"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">Reserve Your Rental Car</h3>
											</div>
										</div>
									</div>
								</div>
								<p>
									<a href="#" class="btn btn-primary py-3 px-4">Reserve Your
										Perfect Car</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	



	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">What we offer</span>
					<h2 class="mb-2">Feeatured Vehicles</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="carousel-car owl-carousel">
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park2.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">서면점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">ParkIT주차장</span>
										<p class="price ml-auto">
											$2000 <span>/30min</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
											href="#" class="btn btn-secondary py-2 ml-1">Details</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park3.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">광안리점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">ParkIT주차장</span>
										<p class="price ml-auto">
											$2000 <span>/30min</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
											href="#" class="btn btn-secondary py-2 ml-1">Details</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park4.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">해운대점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">ParkIT주차장</span>
										<p class="price ml-auto">
											$2000 <span>/30min</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
											href="#" class="btn btn-secondary py-2 ml-1">Details</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park1.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="#">서면점2</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">ParkIT주차장</span>
										<p class="price ml-auto">
											$2000 <span>/30min</span>
										</p>
									</div>
									<p class="d-flex mb-0 d-block">
										<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
											href="#" class="btn btn-secondary py-2 ml-1">Details</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-about">
		<div class="container">
			<div class="row no-gutters">
				<div
					class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(images/about.jpg);"></div>
				<div class="col-md-6 wrap-about ftco-animate">
					<div class="heading-section heading-section-white pl-md-5">
						<span class="subheading">About us</span>
						<h2 class="mb-4">Welcome to Carbook</h2>

						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia. It is a paradisematic country,
							in which roasted parts of sentences fly into your mouth.</p>
						<p>On her way she met a copy. The copy warned the Little Blind
							Text, that where it came from it would have been rewritten a
							thousand times and everything that was left from its origin would
							be the word "and" and the Little Blind Text should turn around
							and return to its own, safe country. A small river named Duden
							flows by their place and supplies it with the necessary
							regelialia. It is a paradisematic country, in which roasted parts
							of sentences fly into your mouth.</p>
						<p>
							<a href="#" class="btn btn-primary py-3 px-4">Search Vehicle</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Services</span>
					<h2 class="mb-3">Our Latest Services</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="services services-2 w-100 text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-wedding-car"></span>
						</div>
						<div class="text w-100">
							<h3 class="heading mb-2">Wedding Ceremony</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="services services-2 w-100 text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-transportation"></span>
						</div>
						<div class="text w-100">
							<h3 class="heading mb-2">City Transfer</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="services services-2 w-100 text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-car"></span>
						</div>
						<div class="text w-100">
							<h3 class="heading mb-2">Airport Transfer</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="services services-2 w-100 text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-transportation"></span>
						</div>
						<div class="text w-100">
							<h3 class="heading mb-2">Whole City Tour</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-intro"
		style="background-image: url(images/bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section heading-section-white ftco-animate">
					<h2 class="mb-3">Do You Want To Earn With Us? So Don't Be
						Late.</h2>
					<a href="#" class="btn btn-primary btn-lg">Become A Driver</a>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Testimonial</span>
					<h2 class="mb-3">Happy Clients</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Marketing Manager</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(images/person_2.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Interface Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(images/person_3.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">UI Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap rounded text-center py-4 pb-5">
								<div class="user-img mb-2"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">System Analyst</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Blog</span>
					<h2>Recent Blog</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.jsp" class="block-20"
							style="background-image: url('images/image_1.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">Oct. 29, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>
								<a href="#" class="btn btn-primary">Read more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.jsp" class="block-20"
							style="background-image: url('images/image_2.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">Oct. 29, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>
								<a href="#" class="btn btn-primary">Read more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.jsp" class="block-20"
							style="background-image: url('images/image_3.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">Oct. 29, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>
								<a href="#" class="btn btn-primary">Read more</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-counter ftco-section img bg-light"
		id="section-counter">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="60">0</strong> <span>Year
								<br>Experienced
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="1090">0</strong> <span>Total
								<br>Cars
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="2590">0</strong> <span>Happy
								<br>Customers
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text d-flex align-items-center">
							<strong class="number" data-number="67">0</strong> <span>Total
								<br>Branches
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							<a href="#" class="logo">Car<span>book</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 	<script src="js/bootstrap-datepicker.js"></script> -->
<!-- timepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!--   	<script src="js/jquery.timepicker.min.js"></script>  -->

	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>