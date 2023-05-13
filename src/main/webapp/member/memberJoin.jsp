<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ParkIT 회원가입</title>
<script type="text/javascript">
// ------------------------------------------------------------------------------------
// 유효성 검사
		function checkData(){
			// 모든 공백 체크 정규식
			var emp = RegExp(/\s/g);
			// 아이디 정규식
			var getId = RegExp(/^[a-z0-9]{6,15}$/);
			// 비밀번호 정규식
			var getPw = RegExp(/^[A-Za-z0-9]{8,15}$/); 
			// 이름 정규식
			var getName = RegExp(/^[가-힣]{2,6}$/);
			// 이메일 검사 정규식
			var getMail = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			// 휴대폰 번호 정규식
			var getPhone = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/);
			
			if($("#id").val() == ""){
		        alert("아이디를 입력해주세요.");
		        $("#id").focus();
		        return false;
		      }
		           
		      // 아이디 유효성검사
		      if(!getId.test($("#id").val())){
		        alert("아이디 형식에 맞게 입력해주세요.");
		        $("#id").val("");
		        $("#id").focus();
		        return false;
		      }

		      // 비밀번호 공백 확인
		      if($("#pw").val() == ""){
		        alert("비밀번호를 입력해주세요.");
		        $("#pw").focus();
		        return false;
		      }
		           

		      // 아이디 비밀번호 같음 확인
		      if($("#id").val() == $("#pw").val()){
		        alert("아이디와 비밀번호가 같습니다.");
		        $("#pw").val("");
		        $("#pw").focus();
		        return false;
		      }
		      
		      // 비밀번호 유효성검사
		      if(!getPw.test($("#pw").val())){
		        alert("비밀번호 형식에 맞게 입력해주세요.");
		        $("#pw").val("");
		        $("#pw").focus();
		        return false;
		      }
		           
		      // 비밀번호 확인란 공백 확인
		      if($("#pw2").val() == ""){
		        alert("비밀번호 확인란을 입력해주세요.");
		        $("#pw2").focus();
		        return false;
		      }
		           
		      // 비밀번호 서로확인
		      if($("#pw").val() != $("#pw2").val()){
		          alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다.");
		          $("#pw").val("");
		          $("#pw2").val("");
		          $("#pw").focus();
		          return false;
		      }
		          
		      // 이름 공백 검사
		      if($("#memname").val() == ""){
		        alert("이름을 입력해주세요.");
		        $("#name").focus();
		        return false;
		      }

		      // 이름 유효성 검사
		      if(!getName.test($("#memname").val())){
		        alert("이름 형식에 맞게 입력해주세요.")
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		      }

		      
		      // 휴대전화 공백 확인
		      if($("#tel").val() == ""){
		        alert("휴대전화를 입력해주세요.");
		        $("#tel").focus();
		        return false;
		      }
		      
		      // 이메일 공백 확인
		      if($("#email").val() == ""){
		        alert("이메일을 입력해주세요.");
		        $("#email").focus();
		        return false;
		      }
		           
		      // 이메일 유효성 검사
		      if(!getMail.test($("#email").val())){
		        alert("이메일 형식에 맞게 입력해주세요.")
		        $("#email").val("");
		        $("#email").focus();
		        return false;
		      }
// ------------------------------------------------------------------------------------
// 회원 약관 동의 하나라도 안되어있으면 안넘어가게 처리
		        let checked_1 = $("#check_1").is(":checked");
				let checked_2 = $("#check_2").is(":checked");
				let checked_3 = $("#check_3").is(":checked");
				
				$("#join_submit").click(function () {
					if ((checked_1 && checked_2) || (checked_1 && checked_2 && checked3)) {
						// #check_1, #check_2, #check_3 모두 체크되어 있을 경우
						return true;
					} else {
						// 하나라도 체크되지 않은 경우
						if ((!checked_1 && !checked_2) || (!checked_1 && !checked_2 && !checked_3)) {
							alert('[필수]약관에 모두 동의해야 회원가입이 가능합니다.');
						} else if (!checked_1) {
							alert('약관 1에 동의해야 회원가입이 가능합니다.');
						} else if (!checked_2) {
							alert('약관 2에 동의해야 회원가입이 가능합니다.');
						} 
						return false;
					}
		      return true;
				});
		      
		}
</script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script type="text/javascript">
// ------------------------------------------------------------------------------------
// 비밀번호 일치,불일치 입력창 밑에 띄우기
	$(function() {
		$('#alert-success').css('color', 'blue');
		$('#alert-danger').css('color', 'red');
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pw=$("#pw").val();
			var pw2=$("#pw2").val();
			if(pw != "" || pw2 != ""){
				if(pw == pw2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("join_submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("join_submit").attr("disabled", "disabled");
				}
			}
		});
	});
// ------------------------------------------------------------------------------------
// 회원 약관 동의 전체 선택 처리
	$(document).ready(function() {
	    // [전체선택] 클릭시 개별 체크 박스를 전체 선택 또는 해제
	    $("#AgreeCheckBox-All").click(function() {
	      if ($("#AgreeCheckBox-All").prop("checked")) {
	        $(".joincheck").prop("checked", true);
	      } else {
	        $(".joincheck").prop("checked", false);
	      }
	    });
	    // 체크된거 해제하면 전체선택 박스 해제 및 개별체크 전부 클릭시 전체 선택 처리
	    $(".joincheck").click(function() {
	      if ($("input[class='joincheck']:checked").length == 3) {
	        $("#AgreeCheckBox-All").prop("checked", true);
	      } else {
	        $("#AgreeCheckBox-All").prop("checked", false);
	      }
	    });
	});
// ------------------------------------------------------------------------------------
// 전화번호에 자동으로 하이픈 넣기
	$(function () {
		$("#tel").on("keyup", function () {
			var telVal = $(this).val();
			telVal = telVal.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
			var telLen = telVal.length;
			if(telLen > 3){
				telVal = telVal.substring(0,3) + "-" + telVal.substring(3);
			}
			if(telLen > 7){
				telVal = telVal.substring(0,8) + "-" +telVal.substring(8);
			}
			$(this).val(telVal);
		});
// ------------------------------------------------------------------------------------
// 아이디 중복확인
	$("#confirmId").on("click",function(){
			
			let idValue = $("#id").val();
				
			$.ajax({
				
				type: "POST",
				url: "./MemberConfirmIdAction.me",
				dataType:"JSON",
				success: function(data){
					console.log(data);
					
					let checkId = false;
					
					for(let i = 0; i < data.memberList.length; i++){
// 						console.log(data.memberList);
						if(data.memberList[i].id === idValue){
							checkId = true;
							break;
						}
					}
					
					if(checkId){
						alert("이미 사용중인 아이디 입니다");
						$("#join_submit").prop("disabled", true);
					}
					else{
						alert("사용 가능한 아이디 입니다");
						$("#join_submit").prop("disabled", false);
					}
				}
			}); // ajax
			
		}) // 중복관리 버튼
	});
</script>

</head>
<body>
<!------------------------------------------------------------------------------------------------------------>
	<h2>ParkIT 회원가입</h2>	
	<div class="join_content">
		<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return checkData();">
	<!-- 아이디, 비밀번호 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="id">아이디</label><br>
					<span class="ps_box int_id">
						<input type="text" id="id" name="id" class="int" title="ID" maxlength="15" placeholder="영문, 숫자 6-15 자"> 
						<input type="button" id="confirmId" value="중복확인"><br>	
						<div><span id="id_signed"></span></div>				
					</span>
				</p>
			</div>	
			<div class="join_row">
				<p>
					<label class="join_title" for="pw">비밀번호</label><br>
					<span class="ps_box int_pass_step3" id="pswd1Img">
						<input type="password" id="pw" name="pw" class="form-control" title="비밀번호 입력" placeholder="숫자, 영문 조합 최소 8자">
					</span>
				</p>
				<p>	
					<label class="join_title" for="pw2">비밀번호 재확인</label><br>
					<span class="ps_box int_pass_check" id="pswd2Img">
						<input type="password" id="pw2" name="pw2" class="form-control" title="비밀번호 재확인 입력">
					</span>
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</p>		
			</div>	
		</div>	
	<!-- // 아이디, 비밀번호 입력 -->
	<!-- 이름, 생년월일, 휴대전화 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="memname">이름</label><br>
					<span class="ps_box box_right_space">
						<input type="text" id="memname" name="memname" title="이름" class="int" maxlength="40">				
					</span>
				</p>
			<div class="join_row">
				<p>
					<label class="join_title" for="birth">생년월일</label><br>
					<span class="ps_box">
						<input type="date" id="birth" name="birth" title="생년월일" class="int">				
					</span>
				</p>
			</div>	
			<div class="join_row">
				<p>
					<label class="join_title" for="tel">휴대전화</label><br>
					<span class="ps_box">
						<input type="text" id="tel" name="tel" title="휴대전화" class="int" maxlength="13">				
					</span>
				</p>
			</div>	
		</div>		
	<!-- // 이름, 생년월일, 휴대전화 입력 -->
	<!-- 이메일 입력 -->	
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="email">이메일</label><br>
					<span class="ps_box">
						<input type="email" id="email" name="email" class="int" title="이메일"> 
						<input type="button" name="email2" value="이메일인증">	
					</span>
				</p>
				
				
<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
</div>
	<div class="mail-check-box">
<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
</div>
	<span id="mail-check-warn"></span>
</div>
				
				
			</div>	
		</div>			
	<!-- // 이메일 입력 -->			
		<hr>
		<div><input type="submit" value="가입하기" id="join_submit"></div>
	</form>
	</div>
		
		<br><br><br><br>
		
		
		<!-- 약관동의 -->
		<div class="login-join_form_agreement">
	
		<div class="login-join_form_agreement_all-checkbox">
			<input type="checkbox" id="AgreeCheckBox-All" class="AgreeCheckBox-All">
			<label for="AgreeCheckBox-All"><b>약관 전체 동의하기(선택 동의 포함)</b></label>
		</div>	
		
<!-- 		class="ageAgreeCheckBox" -->
		<div class="login-join_form_agreement_age">
			<input type="checkbox" class="joincheck" id="check_1">	
			<label for="ageAgreeCheckBox">[필수] 만 18세 이상입니다. </label>
		</div>
		
<!-- 		class="privacyAgreeCheckBox"  -->
		<div class="login-join_form_agreement_privacy">
			<input type="checkbox" class="joincheck" id="check_2">	
			<label for="privacyAgreeCheckBox">[필수] 개인정보 수집 및 이용 동의</label>
			<button onclick="window.open('MemberJoinAgree.me', '_blank', 'width=500, height=500, top=' + ((screen.height - 500) / 2) + ', left=' + ((screen.width - 500) / 2));">자세히</button>
		</div>
		
<!-- 		class="adAgreeCheckBox" -->
		<div class="login-join_form_agreement_ad">
			<input type="checkbox" class="joincheck" id="check_3">	
			<label for="adAgreeCheckBox">[선택] 광고성 정보 수신 동의 </label>
		</div>

	</div>
		

</body>
</html>