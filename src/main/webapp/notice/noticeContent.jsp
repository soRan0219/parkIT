<%@page import="com.team2.notice.db.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		// 전달받은 정보 저장
		<c:set var="dto" value="${requestScope.dto}" />
		<c:set var="pageNum" value="${requestScope.pageNum}" />
		<c:set var="noticeNo" value="${param.noticeNo}" />

	
	
	
	<div>
		<a href="#">소개</a>
		<a href="#">예약하기</a>
		<a href="#">커뮤니티</a>
	</div>
	
	<div>
		<h1> 공지사항(관리자) </h1>
	</div>
	
	<table border="1">
	<tr>
		<th>글번호</th>
		<td><c:out value="${dto.noticeNo}" /></td>
		<th>조회수</th>
		<td><c:out value="${dto.noticeRcnt}"/></td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td><c:out value="${dto.noticeDate}"/></td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td colspan="3"><c:out value="${dto.noticeTitle}"/></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td colspan="3"><c:out value="${dto.noticeFile}"/></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td colspan="3" height="300px"><c:out value="${dto.noticeContents}"/></td>
	</tr>
	
	<tr>
		<td colspan="4" style="text-align:center">
	
	
	<input type="button" value="글수정">
	<input type="button" value="글삭제">
	<input type="button" value="목록으로">
	
	</td>
	</tr>
	</table>
</body>
</html>