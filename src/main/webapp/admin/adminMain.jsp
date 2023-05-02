<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="adminMain.css">



</head>
<body>
		<h3>관리자 메인페이지</h3>
		
		<div class="admin1"> <!-- 좌측페이지 -->
		
			<div>
			admin + 이미지
			</div>
			
			<div>
				<button id="member-btn" onclick="location.href='./AdminMember.park'">회원관리</button>
				<button id="reservation-btn" onclick="location.href='./AdminRes.park'">예약관리</button>
				<button id="parking-btn" onclick="location.href='./AdminParking.park'">주차장관리</button>
				<button id="customer-btn" onclick="location.href='./AdminCustomer.park'">고객센터</button>
			</div>
			
		</div> <!-- /좌측페이지 -->
			
			
		<div class="admin2"> <!-- 우측페이지 -->
				
			<div> <!-- 월별 현황 -->
			월별 현황(월)
			</div>
				
				<div>
					<input type="button" value="회원수">
					<input type="button" value="예약건수">
					<input type="button" value="취소건수">
				</div>
				
				
			<div> <!-- 지점별 현황 -->
			지점별 현황	
			</div>
				
				<div>
					<input type="button" value="주차장1">
					<input type="button" value="주차장2">
					<input type="button" value="주차장3">
				</div>
					
			
			<div> <!-- 고객센터 -->
			고객센터
			</div>
			
				<div> <!-- 고객센터 -->
					<input type="button" value="공지사항">
					<input type="button" value="자주 묻는 질문">
					<input type="button" value="챗봇관리">
				</div>
			
			
		</div>
		
		
		
		
		
</body>
</html>