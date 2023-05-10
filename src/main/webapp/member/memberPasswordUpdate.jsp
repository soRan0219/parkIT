<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>


	<script type="text/javascript">
		function pwCheck() {
			if(document.fr.pw.value=="") {
				alert("현재 비밀번호를 입력해 주세요.");
				document.fr.pw.focus();
				return false;
			}	
			
			if(document.fr.newpw.value=="") {
				alert("변경할 비밀번호를 입력해 주세요.");
				document.fr.newpw.focus();
				return false;
			}	
			
		}
	
	</script>





</head>
<body>
	<h2>비밀번호 변경</h2>
	<fieldset>
		<legend>비밀번호 변경</legend>
		<!-- action 주소가 없으면 자신의 페이지 호출 -->
		<form action="./MemberPasswordUpdateProAction.me" method="post" name="fr" onsubmit="return checkDate();">
			현재 비밀번호 : <input type="password" name="pw" placeholder="현재 비밀번호를 입력하세요." required="required"> 			<br>	
			변경할 비밀번호 : <input type="password" name="newpw" placeholder="변경할 비밀번호를 입력하세요." required="required"> 			<br>	
			
			
			<hr>
			<input type="submit" value="변경">
	
		</form>
	</fieldset>
	
	
	<h3><a href="./Main.me">메인페이지로</a></h3>
</body>
</html>