<%@page import="com.team2.notice.db.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
function noticeConfirm(noticeNo) {
	var msg = "정말 삭제하시겠습니까?";
	var result = confirm(msg);
	if (result) { // "예"를 선택한 경우
		return true;
	}
	else { // "아니오"를 선택한 경우
		return false;
	}
}
</script>



</head>
<body>

	
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
		<td>${dto.noticeNo}</td>
		<th>조회수</th>
		<td>${dto.noticeRc}</td>
	</tr>
	
	<tr>
		<th >작성일</th>
		<td colspan="3">${dto.noticeDate}</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td colspan="3">${dto.noticeTitle}</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td colspan="3">${dto.noticeFile}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td colspan="3" height="300px">${dto.noticeContents}</td>
	</tr>
	
	<tr>
		<td colspan="4" style="text-align:center">
																				<!-- flex가 있어야 사용가능 -->
	<div style="display: flex; justify-content: center;"> <!-- flex - 가로정렬기능, justify-content - 가로정렬에서 어떤식으로 정렬할것인지 -->
	<form action="./noticeUpdateForm.no" method="post">
		<input type="submit" value="글수정">
		<input type="hidden" name="noticeNo" value="${dto.noticeNo}">
		<input type="hidden" name="noticeTitle" value="${dto.noticeTitle}">
		<input type="hidden" name="noticeFile" value="${dto.noticeFile}">
		<input type="hidden" name="noticeContents" value="${dto.noticeContents}">
	</form>
		
	<form action="./noticeDeleteAction.no" method="post" onsubmit="return noticeConfirm()">
		<input type="submit" value="글삭제">
		<input type="hidden" name="noticeNo" value="${dto.noticeNo}">
	</form>
		<input type="button" value="목록으로" onclick="location.href='./noticeList.no?pageNum=${pageNum}'">
	</div>
	
	</td>
	</tr>
	</table>
	
	
	<div>
		<div>
			<c:if test="${maxNoticeCount >= dtoNext.noticeNo }">
			다음글: <a href="./noticeContent.no?noticeNo=${dtoNext.noticeNo}&amp;pageNum=${pageNum}">${dtoNext.noticeTitle}</a>
			</c:if>
		</div>
		<div>
			<c:if test="${!empty dtoPre.noticeNo }">
			이전글: <a href="./noticeContent.no?noticeNo=${dtoPre.noticeNo}&amp;pageNum=${pageNum}">${dtoPre.noticeTitle}</a>
			</c:if>
		</div>
	</div>
	
	
	
</body>
</html>