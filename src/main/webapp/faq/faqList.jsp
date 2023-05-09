<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/faq.css">

<!DOCTYPE html>
<html>
<head>
	<title>FAQ 페이지</title>
	
	
</head>
<body>
	<div class="container">
		<h1 class="title">자주 묻는 질문</h1>

		<c:forEach var="dto" items="${requestScope.faqList }">
			<button class="accordion">${dto.faqTitle }</button>
			<div class="panel">
				<p>${dto.faqContents }</p>
			</div>
		</c:forEach>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".accordion").click(function() {
				$(this).toggleClass("active");
				var panel = $(this).next();
				if (panel.css("max-height") === "0px") {
					panel.css("max-height", panel.prop("scrollHeight") + "px");
				} else {
					panel.css("max-height", "0px");
				}
			});
		});
	</script>
</body>
</html>