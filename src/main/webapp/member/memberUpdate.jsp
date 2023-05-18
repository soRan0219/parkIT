<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 보기 및 수정</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/memUpdate.css">
<link rel="stylesheet" href="css/park.css">
<script type="text/javascript">
		function checkData() {
			// 아이디가 입력되어있는지 체크
			if(document.fr.pw.value == ""){
				alert("비밀번호를 입력하세요.");
				document.fr.pw.focus();
				return false;
			}
			
		}
	</script>

</head>
<body>
	<!-- itwill_member 테이블에 저장될 정보를 입력 -->
		<div class="memberUpdate_content">
			<fieldset>
				<div class="form-group">
					<a class="navbar-brand" href="./Main.park">Park<span>IT</span></a>
				</div>
				<!-- action 주소가 없으면 자신의 페이지 호출 -->
				<form action="./MemberUpdateProAction.me" method="post" name="fr" onsubmit="return checkDate();">
					<div>아이디 : <input type="text" name="id" value="${requestScope.dto.id }" readonly></div>
					<div>비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요."></div>	
					<div>이름 : <input type="text" name="memname" value="${dto.memname }" readonly></div>
					<div>생년월일 : <input type="date" name="birth" value="${dto.birth }" readonly></div>
					<div>휴대전화 : <input type="tel" name="tel" value="${dto.tel }" ></div>
					<div>이메일 : <input type="text" name="email" value="${dto.email }" readonly></div>
					
					<hr>
					<input type="submit" value="회원수정">
			
				</form>
			</fieldset>
		</div>	
	
	
</body>
</html>