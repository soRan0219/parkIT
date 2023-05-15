<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/park.css">
<link rel="stylesheet" href="css/style.css">
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ParkIT 로그인</title>
</head>
<body>
	<div class="form-group">
		<a class="navbar-brand" href="./MainMain.park">Park<span>IT</span></a>
	</div>
	<div class="login_content">
		<form action="./MemberLoginAction.me" method="post">
			<input type="hidden" name="oldURL"
				value="<%=request.getParameter("oldURL")%>">
			<!-- 아이디 입력 -->
			<div class="login_row">
				<class ="join_title" label for="id">ID</label> <input type="text"
					id="id" name="id" placeholder="아이디를 입력해주세요" title="아이디" class="input_text"
					maxlength="41"> <br>
			</div>
			<!-- // 아이디 입력 -->
			<!-- 비밀번호 입력 -->
			<div class="login_row">
				<class ="join_title" label for="pw">Password</label> <input
					type="password" id="pwd" name="pw" placeholder="비밀번호를 입력해주세요" title="비밀번호"
					class="input_text" maxlength="16"> <br>
			</div>
			<!-- // 비밀번호 입력 -->
			<hr>
			<div>
				<div>
					<input type="submit" value="로그인">
				</div>
			</div>
	</div>
	
			<ul class="find_wrap" id="find_wrap">
                <li><a target="_blank" href="./MemberJoin.me" class="find_text">회원가입</a></li>
                <li><a target="_blank" href="./MemberFindID.me" class="find_text">아이디 / 비밀번호 찾기</a></li>
            </ul>


</body>
</html>