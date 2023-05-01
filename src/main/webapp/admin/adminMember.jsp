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
				<button id="member-btn" onclick="location.href'./AdminMember.park'">회원관리</button>
				<button id="reservation-btn" onclick="location.href='./AdminRes.park'">예약관리</button>
				<button id="parking-btn" onclick="location.href'./AdminParking.park'">주차장관리</button>
				<button id="customer-btn" onclick="location.href'./AdminCustomer.park'">고객센터</button>
			</div>
			
		</div> <!-- /좌측페이지 -->
		
		
		<div class="admin2"> <!-- 우측 페이지 -->
		
		<table border="1">
		
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>연락처</td>
				<td>이메일</td>
				<td>예약상태</td>
				<td>포인트</td>
			</tr>
			
		<c:forEach var="dto" items="${requestScope.memberList }">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.memName }</td>
				<td>${dto.birth}</td>
				<td>${dto.tel}</td>
				<td>${dto.email}</td>
				<td></td>
				<td>${dto.point}</td>
			</tr>
		</c:forEach>
		
		</table>
		
		</div> <!-- /우측 페이지 -->
		
		${dto}
</body>
</html>