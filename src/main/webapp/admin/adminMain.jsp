<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="adminMain.css"> <!-- 경로 지정에 유의하기  -->

<script src="./js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		
		$.ajax({
			type: "POST",
			url: "./AdminData.park",
			dataType:"JSON",
			success: function(data){
// 				console.log(data);
				
				// 총회원수 출력
				var memberCount = parseInt(data.memberListCount.match(/memberCount=(\d+)/)[1]);
// 				console.log(memberCount); // 총 회원수 출력 확인용
				$("#memberCount").text(memberCount);
				
				// 총 예약건수 출력
				var resCount = parseInt(data.resCount.match(/resStatus=(\d+)/)[1]);
// 				console.log(resCount); // 총 예약건수 출력 확인용
				$("#resCount").text(resCount);
				
				// 취소건수 출력
				var resCancelCount = parseInt(data.resCancelCount.match(/resStatus=(\d+)/)[1]);
				$("#resCancelCount").text(resCancelCount);
				
			}
		
		});

		
		// 회원관리 버튼
		$("#memberListBtn").on("click",function(){
		
			$(".admin2").hide();
			$(".admin4").hide();
			$(".admin5").hide();
			$(".admin3 tbody").empty(); // 이전 검색 결과 제거
			
			$.ajax({
				type: "POST",
				url: "./AdminData.park",
				dataType:"JSON",
				success: function(data){
					console.log(data.memberList); // 데이터출력 확인용
					
					var memberList = data.memberList;
					var tbody = $(".admin3 tbody");
					for (var i = 0; i < memberList.length; i++) {
						var tr = $("<tr>");
						tr.append($("<td>").text(memberList[i].id));
						tr.append($("<td>").text(memberList[i].memName));
						tr.append($("<td>").text(memberList[i].birth));
						tr.append($("<td>").text(memberList[i].tel));
						tr.append($("<td>").text(memberList[i].email));
						tr.append($("<td>").text(memberList[i].resStatus + "건"));
						tr.append($("<td>").text(memberList[i].point));
						tbody.append(tr);
		            }
						
				}
			
			})
			
			$(".admin3").show();
		}) // 회원관리 버튼
		
		// 예약관리 버튼
		$("#resListBtn").on("click",function(){
		
			$(".admin2").hide();
			$(".admin3").hide();
			$(".admin5").hide();
			$(".admin4 tbody").empty(); // 이전 검색 결과 제거
			
			$.ajax({
				type: "POST",
				url: "./AdminData.park",
				dataType:"JSON",
				success: function(data){
					console.log(data.resList); // 데이터출력 확인용
					
					var resList = data.resList;
					var tbody = $(".admin4 tbody");
					for (var i = 0; i < resList.length; i++) {
						var tr = $("<tr>");
						tr.append($("<td>").text(resList[i].resNo));
						tr.append($("<td>").text(resList[i].id));
						tr.append($("<td>").text(resList[i].resDate));
						tr.append($("<td>").text(resList[i].parkInTime + ", "
								+ resList[i].parkOutTime));
						tr.append($("<td>").text(resList[i].parkingCode));
						if(resList[i].resStatus == 1){
							tr.append($("<td>").text("예약"));
						}
						else{
							tr.append($("<td>").text("취소"));							
						}
						tbody.append(tr);
		            }
						
				}
			
			})
			
			$(".admin4").show();
		}) // 예약관리 버튼
		
		// 주차장관리 버튼
		$("#parkingBtn").on("click",function(){
		
			$(".admin2").hide();
			$(".admin3").hide();
			$(".admin4").hide();
			$(".admin5 tbody").empty(); // 이전 검색 결과 제거
			
			$.ajax({
				type: "POST",
				url: "./AdminData.park",
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
						
				}
			
			})
			
			$(".admin5").show();
		}) // 예약관리 버튼
		
		
		
		
	});

</script>

</head>
<body>
		<h3>관리자 메인페이지</h3>
		
		
		<div class="admin1"> <!-- 좌측페이지 -->
		
			<div>
			admin + 이미지
			</div>
			
			<div>
				<button id="memberListBtn">회원관리</button>
				<button id="resListBtn">예약관리</button>
				<button id="parkingBtn">주차장관리</button>
				<button id="customerBtn">고객센터</button>
			</div>
			
		</div> <!-- /좌측페이지 -->
			
			
		<div class="admin2"> <!-- 우측페이지 -->
				
			<div> <!-- 월별 현황 -->
			현재 현황
			</div>
				
				<div>
					총 회원수 : <span id="memberCount"></span>명
					예약건수 : <span id="resCount"></span>건
					취소건수 : <span id="resCancelCount"></span>건
				</div>
			
				
			<div> <!-- 지점별 현황 -->
			지점별 현황	
			</div>
				
				<div>
				주차장1
				주차장2
				주차장3
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
		
		
		<div class="admin3" style="display: none;"> <!-- 회원관리 -->
		
			<table border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>예약내역</th>
						<th>포인트</th>
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
						<th>고객 아이디</th>
						<th>예약날짜</th>
						<th>입, 출차시간</th>
						<th>지점</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
			
		</div> <!-- //admin4 -->
		
		<div class="admin5" style="display: none;"> <!-- 주차장관리 -->
		
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
		
		
		
		
		
</body>
</html>