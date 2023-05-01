<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="adminMain.css">

</head>
<body>
		
		
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
		
		
		<div class="admin2"> <!-- 우측 페이지 -->
		
		<table border="1">
		
			<tr>
				<td>예약관리</td>
				<td>고객 아이디</td>
				<td>예약날짜</td>
				<td>입, 출차시간</td>
				<td>지점</td>
				<td>예약상태</td>
			</tr>
			
		<c:forEach var="dto" items="${requestScope.resList }">
			<tr>
				<td>${dto.resNo}</td>
				<td>${dto.id}</td>
				<td>${dto.resDate}</td>
				<td>${dto.parkInTime}, ${dto.parkOutTime}</td>
				<td>${dto.parkingCode}</td>
				<td>${dto.resStatus}</td>
			</tr>
		</c:forEach>
		
		</table>
		
		</div> <!-- /우측 페이지 -->
		
		${dto}
</body>
</html>