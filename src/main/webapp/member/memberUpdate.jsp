<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function checkData() {
			// 아이디가 입력되어있는지 체크
			if(document.fr.pw.value == ""){
				alert("비밀번호를 입력하세요!");
				document.fr.pw.focus();
				return false;
			}
			
		}


	</script>

</head>
<body>
	<h1>UpdateForm.jsp(TEAM2)</h1>
	<!-- itwill_member 테이블에 저장될 정보를 입력 -->
	
	<fieldset>
		<legend>마이페이지</legend>
		<!-- action 주소가 없으면 자신의 페이지 호출 -->
		<form action="./MemberUpdateProAction.park" method="post" name="fr" onsubmit="return checkDate();">
			아이디 : <input type="text" name="id" value="${requestScope.dto.id }" readonly>					<br>
			비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요."> 			<br>	
			이름 : <input type="text" name="memname" value="${dto.memname }" readonly> 					<br>
			휴대전화 : <input type="tel" name="tel" value="${dto.tel }" >	<br>
			이메일 : <input type="text" name="email" value="${dto.email }" readonly> 				<br>
			포인트 : <input type="text" name="point" value="${dto.point }" readonly> <br>
			
			<hr>
			<input type="submit" value="회원수정">
	
		</form>
	
	
	</fieldset>
	
	
	
</body>
</html>