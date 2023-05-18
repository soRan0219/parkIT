<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="css/find.css">

<link rel="stylesheet" href="css/park_uppw.css">
<link rel="stylesheet" href="css/style.css">
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
	
	<!-- 중복 검사 -->
	<script type="text/javascript">	
	  function checkDate() {
		    var currentPassword = document.getElementById("pw").value;
		    var newPassword = document.getElementById("newpw").value;

		    if (currentPassword === newPassword) {
		      alert("현재 비밀번호와 새로운 비밀번호가 일치합니다.");
		      return false; // 폼 제출을 중지하기 위해 false 반환
		    }

		    return true; // 폼 제출을 진행하기 위해 true 반환
		  }
	</script>




</head>
<body>
<!-- 	<h2>비밀번호 변경</h2> -->
	
<div class="form-group">
	<a class="navbar-brand" href="./Main.park">
		Park<span>IT</span>
	</a>
</div>

	<div class="login_content">
	<fieldset>
<!-- 		<legend>비밀번호 변경</legend> -->
		<!-- action 주소가 없으면 자신의 페이지 호출 -->
		<form action="./MemberPasswordUpdateProAction.me" method="post" name="fr" onsubmit="return checkDate();">
			현재 비밀번호 : <input type="password" name="pw" placeholder="현재 비밀번호를 입력하세요." required="required" class="input_text" id="pw"> 			<br>	
			변경할 비밀번호 : <input type="password" name="newpw" placeholder="변경할 비밀번호를 입력하세요." required="required" class="input_text1" id="newpw"> 			<br>	
			
			
			<hr>
			<input type="submit" value="비밀번호 변경" class="btn_login">
	
		</form>
	</fieldset>
	</div>
	
<!-- 	<h3><a href="./Main.park">메인페이지로</a></h3> -->
</body>
</html>