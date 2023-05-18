<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
</head>
<body>
	<h1> resLog.jsp </h1>
	
	<table border="1">
		<tr>
			<th> 예약번호 </th>
			<th> 지점 </th>
			<th> 자리번호 </th>
			<th> 날짜 </th>
			<th> 입차시간 </th>
			<th> 출차시간 </th>
			<th> 결제금액 </th>
			<th> 예약상태 </th>
		</tr>
		
		<c:forEach var="dto" items="${resList }">
			<tr>
				<td> ${dto.resNo } </td>
				
				
				<td>
					<c:choose>
						<c:when test="${dto.parkingCode.equals('A') }">
							서면점
						</c:when>
						<c:when test="${dto.parkingCode.equals('B') }">
							해운대점
						</c:when>
						<c:when test="${dto.parkingCode.equals('C') }">
							명지점
						</c:when>
					</c:choose>
				</td>
				
				
				<td> ${dto.parkingPosition } </td>
				<td> ${dto.resDate } </td>
				<td> ${dto.parkInTime } </td>
				<td> ${dto.parkOutTime } </td>
				<td> ${dto.price } </td>
				<td> ${dto.resStatus } </td>
			</tr>
		</c:forEach>
		
	</table>
	
	
	
</body>
</html>