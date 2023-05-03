<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../Main/../Main/css/park.css">
<link rel="stylesheet" href="../Main/../Main/css/style.css">
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<a class="navbar-brand" href="index.JSP">Park<span>IT</span></a>
	</div>
	<div class="login_content">
		<form action="./MemberLoginAction.park" method="post">
			<input type="hidden" name="oldURL"
				value="<%=request.getParameter("oldURL")%>">
			<!-- 아이디 입력 -->
			<div class="login_row">
				<class ="join_title" label for="id">아이디</label> <input type="text"
					id="id" name="id" placeholder="아이디" title="아이디" class="input_text"
					maxlength="41"> <br>
		</div>
			<!-- // 아이디 입력 -->
			<!-- 비밀번호 입력 -->
			<div class="login_row">
				<class ="join_title" label for="pw">비밀번호</label> <input
					type="password" id="pwd" name="pw" placeholder="비밀번호" title="비밀번호"
					class="input_text" maxlength="16"> <br>
			</div>
			<!-- // 비밀번호 입력 -->
			<hr>
			<div>
				<div>
					<input type="submit" value="로그인">
				</div>
			</div>
			<div>
				<div></div>
				<input type="button" value="회원가입"
					onclick=" location.href='./MemberJoin.park'; ">
			</div>
			<div class="join-membership">
				<a href="#">아이디/비밀번호 찾기</a>
			</div>
	</div>



</body>
</html>