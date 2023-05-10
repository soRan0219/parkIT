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
게시판 총 글의 수 : ${noticeCount} 개

<!-- 아이디 없을 때 로그인 페이지로 보내버리는거-->
<%-- <c:if test="${id == null}"> --%>
<%-- 	<c:redirect url="./MemberLogin.park"/> --%>
<%-- </c:if> --%>


<form action="./noticeList.no" method="get">
<div>
	<input type="text" name="keyWord">
	<input type="submit" value="검색">
</div>
</form>
	

<table border="1">
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>

<!-- noticeList 있을 때 마다 들고오는거 -->
<c:forEach var="notice" items="${noticeList}">
<tr>
	<td>${notice.noticeNo}</td>
	<td>
		<a href="./noticeContent.no?noticeNo=${notice.noticeNo}&amp;pageNum=${pageNum}">
			${notice.noticeTitle}
		</a>
	</td>
	<td>${notice.noticeRc}</td>
	<td>${notice.noticeDate}</td>
</tr>
</c:forEach>
</table>
</div>


	<div id="pageBlock">
	
		<c:if test="${startPage > pageBlock}">
			<a href="./noticeList.no?pageNum=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="./noticeList.no?pageNum=${i}">[${i}]</a>
			</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<a href="./noticeList.no?pageNum=${startPage+pageBlock}">[다음]</a>
		</c:if>
		
	</div>
	
	
	<div>
			<input type="button" value="글쓰기" onclick="location.href='./noticeWriteForm.no'">
	</div>
	
	
	
	
	
	
</body>
</html>