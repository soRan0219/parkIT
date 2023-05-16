<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

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
<link rel="stylesheet" href="css/adminMain.css">

<script src="./js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		
		$.ajax({
			type: "POST",
			url: "./AdminCountData.ad",
			dataType:"JSON",
			success: function(data){
// 				console.log(data);
				
				// 총회원수 출력
				var memberCount = data.memberListCount;
// 				console.log(memberCount); // 총 회원수 출력 확인용
				$("#memberCount").text(memberCount);
				
				// 총 예약건수 출력
				var resCount = data.resCount;
// 				console.log(resCount); // 총 예약건수 출력 확인용
				$("#resCount").text(resCount);
				
				// 총 취소건수 출력
				var resCancelCount = data.resCancelCount;
				$("#resCancelCount").text(resCancelCount);
				
				// 총 예약건수 출력
				var resCountA = data.resCountA;
				console.log(resCountA); // 총 예약건수 출력 확인용
				$("#resCountA").text(resCountA);
				
				// 총 예약건수 출력
				var resCountB = data.resCountB;
				console.log(resCountB); // 총 예약건수 출력 확인용
				$("#resCountB").text(resCountB);
				
				// 총 예약건수 출력
				var resCountC = data.resCountC;
				console.log(resCountC); // 총 예약건수 출력 확인용
				$("#resCountC").text(resCountC);
				
			}
		
		});

		
		
// 회원관리 버튼 ---------------------------------------------------------------------
		
		
		var currentPage = 1; // 현재 페이지 번호
		var membersPerPage = 5; // 페이지당 회원 수
		var memberListCount = 0; // 전체 회원 수
		
		var currentPageGroup = 1; // 현재 페이지 그룹 번호
		var pagesPerGroup = 5; // 페이지 그룹당 페이지 수
		
		// 회원관리 버튼을 누르면 ajax로 데이터 받아옴
		$("#memberListBtn").on("click",function(){
		
			$(".admin2, .admin3, .admin4, .admin5").hide();
			$(".admin3 tbody").empty(); // 이전 검색 결과 제거
			currentPage = 1; // 페이지 초기화
			
			getMembers(); // 회원 목록 요청
		});	
		
		// 회원목록 요청
		function getMembers() {
			
			$.ajax({
				type: "POST",
				url: "./AdminMemberData.ad",
				dataType: "JSON",
				data: {
				page: currentPage,
				perPage: membersPerPage,	// 현재페이지, 한 페이지에 몇명을 띄울건지 전달
				},
				success: function (data) {
// 					console.log(data.memberList); // 데이터 출력 확인용
					
					// action페이지에서 subList 받아온 정보 출력
					var memberList = data.memberList;
					var tbody = $(".admin3 tbody");
					
					for (var i = 0; i < memberList.length; i++) {
						var tr = $("<tr>");
						// $("<td>") 로 생성된 객체는 <td>와 </td>로 둘러싸인 태그를 가진 객체로서 동작
						tr.append($("<td>").text(memberList[i].id));
						tr.append($("<td>").text(memberList[i].memName));
						tr.append($("<td>").text(memberList[i].birth));
						tr.append($("<td>").text(memberList[i].tel));
						tr.append($("<td>").text(memberList[i].email));
						tr.append($("<td>").text(memberList[i].regDate));
						tr.append($("<td>").text(memberList[i].resStatus + "건"));
						// <tr>을 생성 후 내용을 붙여 준 뒤에 admin3의 tbody 뒤에 붙여줌
						tbody.append(tr);
					}
					
					$(".admin3").show();
				
					// 현재 생성된 페이지번호 그룹이 있다면 제거
					$(".pagination").remove();
				
					// 페이지 번호 버튼 그룹 생성 (총 회원수 / 페이지당 출력수) 올림함 ex) 33/10 -> 4페이지
					var pageCount = Math.ceil(data.memberListCount / membersPerPage);
					
					memberListCount = data.memberListCount; // 전체 회원 수 memberListCount에 저장
				
					
					// 페이지 그룹 관련 변수 추가 pagesPerGroup -> 맨 위에서 지정
										// ex) 12페이지/ 버튼5개 -> 3 groupCount
					var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
					var currentGroup = Math.ceil(currentPage / pagesPerGroup); // 현재 페이지가 속한 그룹 번호 계산
					
					var pagination = $("<div>").addClass("pagination");
						// 페이지버튼을 감싸는 div요소 생성 + pagination 클래스 추가
					
					
					// 이전 버튼 생성
					var previousGroupBtn = $("<button>").text("이전").on("click", previousPageGroupM);
					
					if (currentGroup === 1) {
						previousGroupBtn.hide(); // 첫 페이지 그룹일 경우 이전 버튼 숨김
					}
					pagination.append(previousGroupBtn);
					
					// 페이지 번호 버튼 생성
					var startPage = (currentGroup - 1) * pagesPerGroup + 1; // ex) 5개씩 한다는 가정하에 1p -> 1, 2p -> 6 
					var endPage = Math.min(startPage + pagesPerGroup - 1, pageCount);
						// Math.min -> 주어진 숫자중 가장 작은 숫자를 반환
					
					for (var i = startPage; i <= endPage; i++) {
						var pageBtn = $("<button>").text(i).on("click", goToPageM);
						
						if (i === currentPage) {
							pageBtn.addClass("active");
						}
						pagination.append(pageBtn);
					}

					// 다음 페이지 그룹 버튼 생성
					var nextGroupBtn = $("<button>").text("다음").on("click", nextPageGroupM);
					if (currentGroup === groupCount) {
						nextGroupBtn.hide(); // 마지막 페이지 그룹일 경우 숨김
						}
					pagination.append(nextGroupBtn);
					
					$(".admin3").append(pagination);
					
					}, // success
					
			}); // ajax
			
		} // getmembers
		
		// 이전 페이지 그룹으로 이동
		function previousPageGroupM() {
			if (currentPageGroup > 1) {
			currentPageGroup--;
			currentPage = (currentPageGroup - 1) * pagesPerGroup + 1;
			$(".admin3 tbody").empty(); // 이전 검색 결과 제거
			getMembers(); // 회원 목록 요청
			}
		} // previousPageGroupM
		
		// 다음 페이지 그룹으로 이동
		function nextPageGroupM() {
			var pageCount = Math.ceil(memberListCount / membersPerPage); // 페이지 수 계산
			var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
			
			if (currentPageGroup < groupCount) {
				currentPageGroup++;
				currentPage = (currentPageGroup - 1) * pagesPerGroup + 1;
				$(".admin3 tbody").empty(); // 이전 검색 결과 제거
				getMembers(); // 회원 목록 요청
			}
		}
		
		// 페이지 번호로 이동
		function goToPageM() {
			var targetPage = parseInt($(this).text());
			var pageCount = Math.ceil(memberListCount / membersPerPage); // 페이지 수 계산
			var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
			
			// 유효한 페이지인지 확인
			if (targetPage >= 1 && targetPage <= pageCount) {
				// 현재 페이지 그룹 번호 계산
				currentPageGroup = Math.ceil(targetPage / pagesPerGroup);
				currentPage = targetPage;
				
				$(".admin3 tbody").empty(); // 이전 검색 결과 제거
				getMembers(); // 회원 목록 요청
			}
		}
		
		
// 회원관리 버튼 ---------------------------------------------------------------------
		
		
		
// 예약관리 버튼 ---------------------------------------------------------------------
		
		
		var currentPage = 1; // 현재 페이지 번호
		var resPerPage = 5; // 페이지당 예약 수
		var resCount = 0; // 전체 예약 수
		
		var currentPageGroup = 1; // 현재 페이지 그룹 번호
		var pagesPerGroup = 3; // 페이지 그룹당 페이지 수(버튼 수)
		
		// 예약관리 버튼을 누르면 ajax로 데이터 받아옴
		$("#resListBtn").on("click",function(){
		
			$(".admin2, .admin3, .admin4, .admin5").hide();
			$(".admin4 tbody").empty(); // 이전 검색 결과 제거
			currentPage = 1; // 페이지 초기화
			
			getRes(); // 예약 목록 요청
		});	
		
		
		// 예약목록 요청
		function getRes(){
			
			$.ajax({
				type: "POST",
				url: "./AdminResData.ad",
				data: {
				page: currentPage,
				perPage: resPerPage,	// 현재페이지, 한 페이지에 몇개의 예약을 띄울건지 전달
				},
				dataType:"JSON",
				success: function(data){
// 					console.log(data.resList); // 데이터출력 확인용
			
					// action페이지에서 subList 받아온 정보 출력
					var resList = data.resList;
					var tbody = $(".admin4 tbody");
					
					for (var i = 0; i < resList.length; i++) {
						var tr = $("<tr>");
						tr.append($("<td>").text(resList[i].resNo));
						tr.append($("<td>").text(resList[i].parkingCode));
						tr.append($("<td>").text(resList[i].parkingPosition));
						tr.append($("<td>").text(resList[i].id));
						tr.append($("<td>").text(resList[i].resDate));
						tr.append($("<td>").text(resList[i].parkInTime + ", "
								+ resList[i].parkOutTime));
						if(resList[i].resStatus == 1){
							tr.append($("<td>").text("예약"));
						}
						else{
							tr.append($("<td>").text("취소"));							
						}
						tbody.append(tr);
		            }
						
					$(".admin4").show();
					
					// 현재 생성된 페이지번호 그룹이 있다면 제거
					$(".pagination").remove();
					
					// 페이지 번호 버튼 그룹 생성 (총 예약수 / 페이지당 출력수) 올림함
					var pageCount = Math.ceil(data.resCount / resPerPage);
					
					resCount = data.resCount; // 전체 예약 수 resCount에 저장
				
					
					// 페이지 그룹 관련 변수 추가 pagesPerGroup -> 맨 위에서 지정
										// ex) 12페이지/ 버튼5개 -> 3 groupCount
					var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
					var currentGroup = Math.ceil(currentPage / pagesPerGroup); // 현재 페이지가 속한 그룹 번호 계산
					
					var pagination = $("<div>").addClass("pagination");
						// 페이지버튼을 감싸는 div요소 생성 + pagination 클래스 추가
					
					
					// 이전 버튼 생성
					var previousGroupBtn = $("<button>").text("이전").on("click", previousPageGroup);
					
					if (currentGroup === 1) {
						previousGroupBtn.hide(); // 첫 페이지 그룹일 경우 이전 버튼 숨김
					}
					pagination.append(previousGroupBtn);
					
					// 페이지 번호 버튼 생성
					var startPage = (currentGroup - 1) * pagesPerGroup + 1; // ex) 5개씩 한다는 가정하에 1p -> 1, 2p -> 6 
					var endPage = Math.min(startPage + pagesPerGroup - 1, pageCount);
						// Math.min -> 주어진 숫자중 가장 작은 숫자를 반환 5, 10, ... or pageCount
					
					for (var i = startPage; i <= endPage; i++) {
						var pageBtn = $("<button>").text(i).on("click", goToPage);
						
						if (i === currentPage) {
							pageBtn.addClass("active");
						}
						pagination.append(pageBtn);
					}

					// 다음 페이지 그룹 버튼 생성
					var nextGroupBtn = $("<button>").text("다음").on("click", nextPageGroup);
					if (currentGroup === groupCount) {
						nextGroupBtn.hide(); // 마지막 페이지 그룹일 경우 숨김
						}
					pagination.append(nextGroupBtn);
					
					$(".admin4").append(pagination);
					
					}, // success
					
			}); // ajax
			
		} // getRes
		
		// 이전 페이지 그룹으로 이동
		function previousPageGroup() {
			if (currentPageGroup > 1) {
			currentPageGroup--;
			currentPage = (currentPageGroup - 1) * pagesPerGroup + 1;
			$(".admin4 tbody").empty(); // 이전 검색 결과 제거
			getRes(); // 예약 목록 요청
			}
		} // previousPageGroup
		
		// 다음 페이지 그룹으로 이동
		function nextPageGroup() {
			var pageCount = Math.ceil(resCount / resPerPage); // 페이지 수 계산
			var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
			
			if (currentPageGroup < groupCount) {
				currentPageGroup++;
				currentPage = (currentPageGroup - 1) * pagesPerGroup + 1;
				$(".admin4 tbody").empty(); // 이전 검색 결과 제거
				getRes(); // 예약 목록 요청
			}
		}
		
		// 페이지 번호로 이동
		function goToPage() {
			var targetPage = parseInt($(this).text());
			var pageCount = Math.ceil(resCount / resPerPage); // 페이지 수 계산
			var groupCount = Math.ceil(pageCount / pagesPerGroup); // 페이지 그룹 수 계산
			
			// 유효한 페이지인지 확인
			if (targetPage >= 1 && targetPage <= pageCount) {
				// 현재 페이지 그룹 번호 계산
				currentPageGroup = Math.ceil(targetPage / pagesPerGroup);
				currentPage = targetPage;
				
				$(".admin4 tbody").empty(); // 이전 검색 결과 제거
				getRes(); // 회원 목록 요청
			}
		}
					
// 예약관리 버튼 ---------------------------------------------------------------------		

		
		// 주차장관리 버튼
		$("#parkingBtn").on("click",function(){
		
			$(".admin2, .admin3, .admin4, .admin5").hide();
			$(".admin5 tbody").empty(); // 이전 검색 결과 제거
			
			$.ajax({
				type: "POST",
				url: "./AdminParkingInfoData.ad",
				dataType:"JSON",
				success: function(data){
					console.log(data.parkingInfoList); // 데이터출력 확인용
					
					var parkingInfoList = data.parkingInfoList;
					var tbody = $(".admin5 tbody");
					for (var i = 0; i < parkingInfoList.length; i++) {
						var tr = $("<tr>");
						tr.append($("<td>").text(parkingInfoList[i].parkingCode));
						tr.append($("<td>").text(parkingInfoList[i].parkingName));
						tr.append($("<td>").text(parkingInfoList[i].parkingAdr));
						if(parkingInfoList[i].inOutDoor === "in"){
							tr.append($("<td>").text("실내"));
						}
						else{
							tr.append($("<td>").text("실외"));							
						}
						tr.append($("<td>").text(parkingInfoList[i].parkingTotal));
						tr.append($("<td>").text(parkingInfoList[i].parkingTel));
						
						tbody.append(tr);
		            }
						
					$(".admin5").show();
				}
			
			})
			
		}) // 주차장관리 버튼
		
		
		// 메인페이지로 돌아가게 하는 버튼
		$(".main").on("click",function(){
			$(".admin2").show();
			$(".admin3, .admin4, .admin5").hide();
		})
		
		
	});
	
	
	// -------------------------------------------------------------------------
	// 총 회원수 클릭 이벤트 핸들러
	function memberCountClicked() {
		// 회원관리 버튼을 누름
		document.getElementById("memberListBtn").click();
	}
	
	function resCountClicked(){
		document.getElementById("resListBtn").click();
	}

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
        <li class="nav-item"><a href="pricing.jsp" class="nav-link2">주차장 안내</a></li>
      </ul>
    </li>
    <li class="nav-item"><a href="services.jsp" class="nav-link">예약하기</a></li>
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
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12	featured-top">
					<div class="row no-gutters">
						<form action="" class="request-form ftco-animate bg-primary">
							<h2 class="main">관리자 메인페이지</h2>
								<div class="login-form">
								<div class="admin1">
									<input type="button" id="memberListBtn" value="회원관리"> <br><br>
									<input type="button" id="resListBtn" value="예약관리"> <br><br>
									<input type="button" id="parkingBtn" value="주차장관리"> <br><br>
									<input type="button" value="메인페이지로" onclick="location.href='/Main.me'"> <br><br>
									<div class="dropdown">
										<input type="button" class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false" value="고객센터"><br><br>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">공지사항</a> <a
												class="dropdown-item" href="#">자주묻는 질문</a> <a
												class="dropdown-item" href="#">cs센터</a>
										</div>
									</div>
									</div>
								</div>
						</form>
					</div>
						<div class="col-md-8 d-flex align-items-center">
						<div class="services-wrap rounded-right w-100">
					<div class="heading-section mb-4">
				<div class="admin2">
								<div> <!-- 월별 현황 -->
			현재 현황
			</div>
				
				<div>
					총 회원수 : <span id="memberCount" onclick="memberCountClicked()"></span>명
					예약건수 : <span id="resCount" onclick="resCountClicked()"></span>건
					취소건수 : <span id="resCancelCount"></span>건
				</div>
			
				
			<div> <!-- 지점별 현황 -->
			지점별 현황	
			</div>
				
				<div>
					<div>
						주차장1 주차장2 주차장3
					</div>
					<div>	
						<span id="resCountA"></span>건
						<span id="resCountB"></span>건 
						<span id="resCountC"></span>건
					</div>
				</div>
					
			
			<div> <!-- 고객센터 -->
			고객센터
			</div>
			
				<div> <!-- 고객센터 -->
					<input type="button" value="공지사항">
					<input type="button" value="자주 묻는 질문">
					<input type="button" value="챗봇관리">
				</div>
			
			
		</div> <!-- // admin2 -->
	</div>
		
		
		<div class="admin3" style="display: none;"> <!-- 회원관리 -->
		
			<table border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>예약내역</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
			
		</div> <!-- //admin3 -->
		
		
		<div class="admin4" style="display: none;"> <!-- 예약관리 -->
		
			<table border="1">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>지점</th>
						<th>예약자리</th>
						<th>고객 아이디</th>
						<th>예약날짜</th>
						<th>입, 출차시간</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
			
		</div> <!-- //admin4 -->
		
		<div class="admin5" style="display: none;"> <!-- 주차장관리 -->
		<h3>주차장 정보</h3>
			<table border="1">
				<thead>
					<tr>
						<th>주차장코드</th>
						<th>주차장이름</th>
						<th>주차장주소</th>
						<th>실내/실외</th>
						<th>총 주차구획수</th>
						<th>주차장번호</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
			
		</div> <!-- //admin5 -->
		
					</div>
					
						<div class="row d-flex mb-4"></div>
					</div>
				</div>
				</div>
			</div>
			
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