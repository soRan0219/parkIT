<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lot.css">
<!-- jQuery 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- iamport 결제 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- datepicker-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/res_datepicker.css">

<!-- timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/res_timepicker.css"> -->

<script type="text/javascript">			
	
	$(function() {
		$('#datepicker').datepicker({
			showOn:'both',
			buttonImage:'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
			buttonImageOnly:'true',
			changeMonth:false,
			changeYear:false,
			nextText:'다음달',
			prevText:'이전달',
			showButtonPanel:'true',
			currentText:'오늘',
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			dayNamesMin:['월','화','수','목','금','토','일'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			isRTL: false,
			minDate:0,
			maxDate:+30
		});
		
		$('#fromTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'06:00',
			minTime:'06:00',
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
			dynamic:false,
			scrollbar:true
		});
		
			
		$('#dateTimeBtn').click(function() {
			
			let selectedDate = $('#datepicker').val();
			let fromTime = $('#fromTime').val();
			let toTime = $('#toTime').val();
			let parkingCode = $('#parkingCode').val();
			
			if(selectedDate=="") {
				alert("날짜를 선택하세요");
				$('#datepicker').focus();
				return false;
			}
			if(fromTime=="") {
				alert("입차시간을 선택하세요");
				$('#fromTime').focus();
				return false;
			}
			if(toTime=="") {
				alert("출차시간을 선택하세요");
				$('#toTime').focus();
				return false;
			}
			
			$('.click_inner a.selected').removeClass('selected');
			$('#payInfo input#parkingCode').val('');
			$('#payInfo input#parkingPosition').val('');
			
			$('#resDate').val(selectedDate);
			$('#parkInTime').val(fromTime + ":00");
			$('#parkOutTime').val(toTime + ":00");
			
			$('#res_click_map').find('.cbtn').each(function() {
				$(this).removeClass('cbtn_on').addClass('cbtn_off');
			});
					
			$.ajax({
				url:"./Available.res",
				type:"post",
				data:{date:selectedDate,fromTime:fromTime,toTime:toTime,parkingCode:parkingCode},
				success:function(data) {
					
					var i;
					for(i=0; i<data.length-1; i++) { 
							
						let park = data[i].parkingCode + data[i].parkingPosition;	
						
						$('#res_click_map').find('.cbtn').each(function(idx, elem) {
							let code = $(this).find('#code').val();
							let position = $(this).find('#position').val();
							let result = code + position;
// 							console.log(result);
							
							if(result==park) {
								$(this).removeClass('cbtn_off').addClass('cbtn_on');
							}
							
						}); //res_click_map
						
						
					} //for
					
					$('#price').attr('value',data[i].price);
					
				},  //success
				error:function() {
					alert("error");
				}  //error
			}); //ajax
			
		}); //dateTimeBtn
		
	});
	
</script>
</head>
<body>

	

	

	<section class="ftco-section contact-section">
	
	<jsp:include page="../inc/top.jsp"/>
	
	
	
	
	
	
	
	
	<div>
		<h1> ${pDto.parkingName } </h1>
		
		<c:choose>
			<c:when test="${pDto.inOutDoor.equals('in') }">
				<p> 실내 </p>
			</c:when>
			<c:when test="${pDto.inOutDoor.equals('out') }">
				<p> 야외 </p>
			</c:when>
		</c:choose>
		
		<hr>
		주차장 주소: ${pDto.parkingAdr } <br>
		주차장 연락처: ${pDto.parkingTel } <br>
	</div>
	
		<div>
			<div>
				<input type="hidden" id="parkingCode" value="${pDto.parkingCode }" >
				<input type="text" id="datepicker" name="selectedDate" class="picker" autocomplete="off">
				<input type="text" id="fromTime" name="fromTime" autocomplete="off">
				<input type="text" id="toTime" name="toTime" autocomplete="off">
				<input type="button" value="조회하기" id="dateTimeBtn">
			</div>
	</div>
	
	<hr>
	
	<script type="text/javascript">
		let aList = ${aList};
		
		$(function() {
			
			$('#res_click_map').find('.cbtn').each(function() {
				$(this).removeClass('cbtn_on').addClass('cbtn_off');
			});
			
			for(var i=0; i<aList.length; i++) {
				let park = aList[i].parkingCode + aList[i].parkingPosition;
				
				$('#res_click_map').find('.cbtn').each(function(idx, elem) {
					let code = $(this).find('#code').val();
					let position = $(this).find('#position').val();
					let result = code + position;
					
					if(result==park) {
						$(this).removeClass('cbtn_off').addClass('cbtn_on');
					}
					
				}); //res_click_map
				
			} //for
		});
		
	</script>
	
	<div id="res_click_map">
		<img src="./img/parkIT.png">
		<div class="click_inner">
		
			<a href="#" class="cbtn cbtn_01" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="1">
			01
			</a>
			
			<a href="#" class="cbtn cbtn_02" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="2">
			02
			</a>
			
			<a href="#" class="cbtn cbtn_03" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="3">
			03
			</a>
			
			<a href="#" class="cbtn cbtn_04" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="4">
			04
			</a>
			
			<a href="#" class="cbtn cbtn_05" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="5">
			05
			</a>
			
			<a href="#" class="cbtn cbtn_06" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="6">
			06
			</a>
			
			<a href="#" class="cbtn cbtn_07" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="7">
			07
			</a>
			
			<a href="#" class="cbtn cbtn_08" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="8">
			08
			</a>
			
			<a href="#" class="cbtn cbtn_09" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="9">
			09
			</a>
			
			<a href="#" class="cbtn cbtn_10" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="10">
			10
			</a>
			
			<a href="#" class="cbtn cbtn_11" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="11">
			11
			</a>
			
			<a href="#" class="cbtn cbtn_12" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="12">
			12
			</a>
			
			<a href="#" class="cbtn cbtn_13" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="13">
			13
			</a>
			
			<a href="#" class="cbtn cbtn_14" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="14">
			14
			</a>
			
			<a href="#" class="cbtn cbtn_15" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="15">
			15
			</a>
			
			<a href="#" class="cbtn cbtn_16" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="16">
			16
			</a>
			
			<a href="#" class="cbtn cbtn_17" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="17">
			17
			</a>
			
			<a href="#" class="cbtn cbtn_18" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="18">
			18
			</a>
			
			<a href="#" class="cbtn cbtn_19" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="19">
			19
			</a>
			
			<a href="#" class="cbtn cbtn_20" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="20">
			20
			</a>
			
			<a href="#" class="cbtn cbtn_21" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="21">
			21
			</a>
			
			<a href="#" class="cbtn cbtn_22" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="22">
			22
			</a>
			
			<a href="#" class="cbtn cbtn_23" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="23">
			23
			</a>
			
			<a href="#" class="cbtn cbtn_24" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="24">
			24
			</a>
			
			<a href="#" class="cbtn cbtn_25" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="25">
			25
			</a>
			
			<a href="#" class="cbtn cbtn_26" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="26">
			26
			</a>
			
			<a href="#" class="cbtn cbtn_27" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="27">
			27
			</a>
			
			<a href="#" class="cbtn cbtn_28" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="28">
			28
			</a>
			
			<a href="#" class="cbtn cbtn_29" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="29">
			29
			</a>
			
			<a href="#" class="cbtn cbtn_30" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="30">
			30
			</a>
			
			
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			$('.cbtn').click(function() {
				if( $(this).hasClass('cbtn_on') ) {
					$('.click_inner a.selected').removeClass('selected');
					$(this).addClass('selected');
					$('#payInfo input#parkingCode').val( $(this).find('#code').val() );
					$('#payInfo input#parkingPosition').val( $(this).find('#position').val() );
// 					console.log($('#payInfo input#parkingPosition').val());
// 					console.log($('#tel').val());
				} 
			}); //cbtnClick
		});
	</script>
	
	<hr>
	
	<div>
		<form action="./PayAction.res" id="payInfo" method="post">
			<!-- 회원 아이디 -->
			<input type="hidden" id="id" name="id" value="${sessionScope.id }">
			<!-- 회원 이메일 -->
			<input type="hidden" id="email" name="email" value="${sessionScope.email }">
			<!-- 주차장코드 -->
			<input type="hidden" id="parkingCode" name="parkingCode" value="${available[0].parkingCode }">
			<!-- 주차장자리번호 -->
			<input type="hidden" id="parkingPosition" name="parkingPosition" value="">
			<!-- 예약날짜 -->
			<input type="text" id="resDate" name="resDate" value="${resDate }">
			<!-- 입차시간 -->
			<input type="text" id="parkInTime" name="parkInTime" value="${parkInTime }">
			<!-- 출차시간 -->
			<input type="text" id="parkOutTime" name="parkOutTime" value="${parkOutTime }">
			차량번호: <input type="text" id="carNo" name="carNo">
			<div>
				<%-- <h3> 결제 예상금액: <input type="text" id="price" name="price" value="${price }" readonly></h3> --%>
				<input type="hidden" id="price" name="price" value="${price }">
				<input type="submit" value="결제하기">
			</div>
		</form>
				<button onclick="requestPay()"> 결제하기(iamport) </button>
	</div>
	
	<script type="text/javascript">
	
		function getToday() {
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		/* iamport 결제 API */
		var IMP = window.IMP;  //생략 가능
		IMP.init("imp81382761");  //가맹점 고유번호
		
		function requestPay() {
			//예약 테이블에 들어갈 값
			var id = $('#payInfo input#id').val();
			var code = $('#payInfo input#parkingCode').val();
			var position = $('#payInfo input#parkingPosition').val(); 
			var name = code + position;
			
			var resDate = $('#payInfo input#resDate').val();
			var parkInTime = $('#payInfo input#parkInTime').val();
			var parkOutTime = $('#payInfo input#parkOutTime').val();
			var price = $('#price').val();
			var carNo = $('#carNo').val();
			
			//결제 테이블에 들어갈 값
			var today = getToday(); 
			
			if(price==0) {
				alert("결제 가능한 자리가 없습니다.");
				return false;
			}
			if(name.length<2) {
				alert("자리를 선택해주세요.");
				return false;
			}
			
			let msg;
			
			IMP.request_pay({
				pg: "kakaopay",  //PG사
				pay_method: "card",  //결제수단
				merchant_uid: "order_" + new Date().getTime(),  //주문번호
				name: name,  //결제창에서 보여질 이름(제품이름)
				amount: price,  //가격(숫자타입)
			}, function(rsp) {
				console.log(rsp);
				//rsp.imp_uid 값으로 결제 단건조회 API 호출하여 결제결과 판단
				//결제 검증()
				if(rsp.success) {
				
					$.ajax({
						url: "./PayAction.res",
						type: "post",
						dataType: "json",
						data: {
							"id":id,
							"parkingCode":code,
							"parkingPosition":position,
							"resDate":resDate,
							"parkInTime":parkInTime,
							"parkOutTime":parkOutTime,
							"price":price,  //예약, 결제
							"carNo":carNo,
							"payNo":rsp.merchant_uid,  //결제
							"payDate":today  //결제
						}
					}).done(function(data) {
						
						console.log(data);
						console.log(data.resResult + ", " + data.payResult);
						
						if(data.resResult==1 && data.payResult==1) {
							var con = confirm("결제가 완료되었습니다. 예약상세페이지로 이동하시겠습니까?");
							if(con) {
								location.href = "./Main.park";
							} else {
								history.back();
							}
						}
						
// 						msg = "결제완료";
// 						msg += "고유ID: " + rsp.imp_uid;
// 						msg += "상점 거래 ID: " + rsp.merchant_uid;
// 						msg += "결제 금액: " + rsp.paid_amount;
// 						msg += "카드 승인번호: " + rsp.apply_num;
					});
				
				} else {
// 					msg = "결제 실패";
					alert("결제 실패: " + rsp.error_msg);
				}
// 				console.log(msg);
			});
		} //requestPay()
	</script>
		
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
						<script>
							document.write(new Date().getFullYear());
						</script>
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
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>