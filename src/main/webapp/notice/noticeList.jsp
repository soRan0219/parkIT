<%@page import="com.team2.notice.db.NoticeDAO"%>
<%@page import="com.team2.notice.db.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
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
<!-- 
	<c:set var="noticeList" value="${requestScope.noticeList}" />
	<c:set var="cnt" value="${requestScope.cnt}" />
	<c:set var="pageNum" value="${requestScope.pageNum}" />
	<c:set var="pageCount" value="${requestScope.pageCount}" />
	<c:set var="pageBlock" value="${requestScope.pageBlock}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />

<c:set var="id" value="${sessionScope.id}" />

 -->

<div id="contents">
게시판 총 글의 수 : ${cnt} 개
<c:if test="${id == null}">
	<input type="button" value="로그인" onclick="location.href='./MemberLogin.me'">
</c:if>
<div>
		<input type="text" id="searchKeyword">
		<input type="button" value="검색">
	</div>
	

<table border="1">
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성일</th>
	<th>조회수</th>
	<th>첨부파일</th>
</tr>

<c:forEach var="notice" items="${noticeList}">
<tr>
	<td>${notice.noticeNo}</td>
	<td>
		<a href="./noticeContent.park?noticeNo=${notice.noticeNo}&amp;pageNum=${pageNum}">
			${notice.noticeTitle}
		</a>
	</td>
	<td>${notice.noticeDate}</td>
	<td>${notice.noticeRcnt}</td>
	<td>${notice.noticeFile}</td>
</tr>
</c:forEach>
</table>
</div>
	
<c:if test="${cnt != 0}">
<div id="pageBlock">
<c:if test="${startPage > pageBlock}">
	<a href="./noticeList.park?pageNum=${startPage-pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<a href="./noticeList.park?pageNum=${i}">[${i}]</a>
</c:forEach>
<c:if test="${endPage < pageCount}">
	<a href="./noticeList.park?pageNum=${startPage+pageBlock}">[다음]</a>
</c:if>
</div>
</c:if>
</body>
</html>