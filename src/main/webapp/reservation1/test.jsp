<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:set var="selectedButton" value="${param.selectedButton }"/>
		<c:set var="resDate" value="${param.resDate}"/>
		<c:set var="parkInTime" value="${param.parkInTime}"/>
		<c:set var="parkOutTime" value="${param.parkOutTime }"/>
		<c:set var="parkingCode" value="${param.parkingCode}"/>
		${param.selectedButton }
		${param.resDate }
		${param.parkInTime}
		${param.parkOutTime }
		${param.parkingCode }
		
		
</body>
</html>