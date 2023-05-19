<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title> ParkIT </title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/park.css">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<!--  datepicker -->
<link rel="stylesheet" type="text/css" href="css/res_datepicker.css">

<script type="text/javascript">			
	
	$(function() {
		$('#datepicker').datepicker({
			showOn:'focus',
			changeMonth:false,
			changeYear:false,
			nextText:'다음달',
			prevText:'이전달',
			showButtonPanel:'true',
			currentText:'오늘',
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			isRTL:false,
			minDate:0,
			maxDate:+30,
			onSelect: function(date, inst) {
				var selected = $(this).datepicker('getDate');
				var current = new Date();
				
				if(selected > current) {
					$('#fromTime').timepicker('option', 'minTime', '06:00');
					$('#toTime').timepicker('option', 'minTime', '06:00');
				} else {
					$('#fromTime').timepicker('option', 'minTime', new Date());
					$('#toTime').timepicker('option', 'minTime', new Date());
				}
			} //onSelect
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
		
		$.ajax({
			url: "./Introduction.park?ajax=true",
			type: "post",
			dataType: "json",
			success: function(data) {
// 				console.log("A: " + data.availableA);
// 				console.log("B: " + data.availableB);
// 				console.log("C: " + data.availableC);
				
				$('.parkA').text(data.availableA);
				$('.parkB').text(data.availableB);
				$('.parkC').text(data.availableC);
				
			},
			error: function() {
				alert("실패");
			}
		}); //ajax
		
	}); //jQuery
	
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
	
	$.ajax({
			url: "./Introduction.park?ajax=true",
			type: "post",
			dataType: "json",
			success: function(data) {
				console.log("A: " + data.availableA);
				console.log("B: " + data.availableB);
				console.log("C: " + data.availableC);
				
				$('.parkA').text(data.availableA);
				$('.parkB').text(data.availableB);
				$('.parkC').text(data.availableC);
				
			},
			error: function() {
				alert("실패");
			}
		}); //ajax
	
</script>

</head>
<body>


<jsp:include page="inc/top.jsp"/>


	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12	featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">
						
							<form action="./ReservationAction.res" name="fr" method="post" onsubmit="return check();"
							class="request-form ftco-animate bg-primary" style="position: relative; top: 10%;">
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
							<div class="services-wrap rounded-right w-100" style="position: relative; top: 10%;">
								<h3 class="heading-section mb-4">주차장 간편하게 이용하는 방법</h3>
								<div class="row d-flex mb-4">
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<img src="./images/mapicon1.png">
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">1. 주차장 장소<br> 선택</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<img src="./images/mapicon2.png">
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">2. 예약한 시간에<br> 주차장으로 이동</h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<img src="./images/mapicon3.png">
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2">3. 편하게 주차하면<br>완료</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
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
					<span class="subheading">원하는 주차장을 선택해보세요</span>
					<h2 class="mb-2">주차장 정보</h2>
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
										<a href="./Introduction.park#seo123">서면점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">현재 예약 가능한 자리</span>
										<p class="price ml-auto">

											<span class="parkA" style="font-size: 16px; color: #1089FF;"></span><span style="font-size: 16px; color: blue;">/30</span>

										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park3.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="./Introduction.park#hae123">해운대점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">현재 예약 가능한 자리</span>
										<p class="price ml-auto">

											<span class="parkB" style="font-size: 16px; color: #1089FF;"></span><span style="font-size: 16px; color: blue;">/30</span>

										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="car-wrap rounded ftco-animate">
								<div class="img rounded d-flex align-items-end"
									style="background-image: url(images/park4.jpg);"></div>
								<div class="text">
									<h2 class="mb-0">
										<a href="./Introduction.park#mung123">명지점</a>
									</h2>
									<div class="d-flex mb-3">
										<span class="cat">현재 예약 가능한 자리</span>
										<p class="price ml-auto">

											<span class="parkC" style="font-size: 16px; color: #1089FF;"></span><span style="font-size: 16px; color: blue;">/30</span>

										</p>
									</div>
								</div>
							</div>
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
							<strong class="number" data-number="1">0</strong> <span>Year
								<br>Experienced
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="3">0</strong> <span>Total
								<br>Parking lot
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="1134">0</strong> <span>Happy
								<br>Customers
							</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text d-flex align-items-center">
							<strong class="number" data-number="12941">0</strong> <span>Total
								<br>Branches
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<jsp:include page="inc/bottom.jsp"/>

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
	<!-- timepicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>