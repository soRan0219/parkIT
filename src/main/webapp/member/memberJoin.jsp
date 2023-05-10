<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<!-- saved from url=(0045)http://localhost:8088/jQuery/jq/testLogin.jsp -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ParkIT 회원가입</title>       
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
			//모든 공백 체크 정규식
			var empJ = /\s/g;
			//아이디 정규식
			var idJ = /^[a-z0-9]{4,12}$/;
			// 비밀번호 정규식
			var pwJ = /^[A-Za-z0-9]{4,12}$/; 
			// 이름 정규식
			var nameJ = /^[가-힣]{2,6}$/;
			// 이메일 검사 정규식
			var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		
			// 가입하기 실행 버튼 유효성 검사!
			var inval_Arr = new Array(3).fill(false);
			$('#join_submit').click(function(){
				// 비밀번호가 같은 경우 && 비밀번호 정규식
				if (($('#pw').val() == ($('#pw2').val()))
						&& pwJ.test($('#pw').val())) {
					inval_Arr[0] = true;
				} else {
					alert("비밀번호");
					inval_Arr[0] = false;
				}
				// 이름 정규식
				if (nameJ.test($('#memname').val())) {
					inval_Arr[1] = true;	
				} else {
					alert("이름 형식이 잘못되었습니다.");
					inval_Arr[1] = false;
				}
				// 이메일 정규식
				if (mailJ.test($('#email').val())){
					console.log(phoneJ.test($('#email').val()));
					inval_Arr[2] = true;
				} else {
					alert("이메일 형식이 잘못되었습니다.");
					inval_Arr[2] = false;
				}
				var validAll = true;
				for(var i = 0; i < inval_Arr.length; i++){
					
					if(inval_Arr[i] == false){
						validAll = false;
					}
				}
				
				if(validAll){ // 유효성 모두 통과
					alert('갓민수님께서 인증 이메일을 보냈으니 확인해주세요!');
					
				} else{
					alert('입력한 정보들을 다시 한번 확인해주세요 :)')
					
				}
			});

	});
</script>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script type="text/javascript">
// 아이디 중복확인
// $(document).ready(function check_id(){
// 		  var id = $('#id').val();
		  
// 		  if(id == ""){
// 		    $('#id').css('border','2px solid #F00'); 
// 		    $('.id_caution').show();
// 		    return false;
// 		  }else if(id != ""){
// 		    $.ajax({
// 		      url:"checkId.jsp",
// 		      data : {id:id},
// 		      success : function(data, textStatus){
// 		        if(data == 'existed'){
// 		          alert('이미 가입된 아이디입니다.');
// 		          return false;
// 		        }else{
// 		          $('#id').css('border','1px solid #ccc');
// 		          $('.id_caution').hide();
// 		          return false;
// 		        }
// 		      }
// 		    });
// 		  }
// 		  return true;
// 		});
</script>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script type="text/javascript">
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
					$("submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("submit").attr("disabled", "disabled");
				}
				
			}
			
		});
		
	});
</script>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
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
</script>  
  


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
// 회원 약관 동의 하나라도 안되어있으면 안넘어가게 처리
	$(document).ready(function() {
		
		$("#join_submit").click(function () {
			if($("#check_1").is(":checked")&&$("#check_2").is(":checked")&&$("#check_3").is(":checked")){
				// 모두 체크되어 있다면 회원가입 가능
				window.location.href = './MemberJoinAction.park';					
			}else{
				// 하나라도 안되어있다면 알림창 
				alert('모든 약관에 동의해야 회원가입이 가능합니다.');
			}
			return false;
		});
		
	});
</script>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
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
	});
</script>







<!--------------------------------------------------------------------------------------------------------------------------->
</head>
<body>

	<h2>ParkIT 회원가입</h2>	
	<div class="join_content">
		<form action="./MemberJoinAction.park" id="myform" method="post" onsubmit="return checkData();">
	<!-- 아이디, 비밀번호 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<class="join_title" label for="id">아이디</label><br>
					<span class="ps_box int_id">
						<input type="text" id="id" name="id" class="int" title="ID" maxlength="15" placeholder="영문, 숫자 6-15 자" onkeydown="openIdCk()"> 
						<input type="button" id="confirmId" value="중복확인" onClick="idCheck()"><br>	
						<div><span id="id_signed"></span></div>				
					</span>
				</p>
			</div>	
			<div class="join_row">
				<p>
					<class="join_title" label for="pw">비밀번호</label><br>
					<span class="ps_box int_pass_step3" id="pswd1Img">
						<input type="password" id="pw" name="pw" class="form-control" title="비밀번호 입력" placeholder="숫자, 영문 조합 최소 8자">
					</span>
				</p>
				<p>	
					<class="join_title" label for="pw2">비밀번호 재확인</label><br>
					<span class="ps_box int_pass_check" id="pswd2Img">
						<input type="password" id="pw2" name="pw2" class="form-control" title="비밀번호 재확인 입력" required="">
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
							<class="join_title" label for="memname">이름</label><br>
							<span class="ps_box box_right_space">
								<input type="text" id="memname" name="memname" title="이름" class="int" maxlength="40">				
							</span>
						</p>
					<div class="join_row">
						<p>
							<class="join_title" label for="birth">생년월일</label><br>
							<span class="ps_box">
								<input type="date" id="birth" name="birth" title="생년월일" class="int">				
							</span>
						</p>
					</div>	
					<div class="join_row">
						<p>
							<class="join_title" label for="tel">휴대전화</label><br>
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
							<class="join_title" label for="email">이메일</label><br>
							<span class="ps_box">
								<input type="email" id="email" name="email" class="int" title="이메일"> 
								<input type="button" name="email2" value="이메일인증">	
							</span>
						</p>
						<div class="mail-check-box">
							<input class="email_check" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
						</div>	
					</div>	
				</div>			
	<!-- // 이메일 입력 -->			
				<hr>
				<div><input type="button" value="가입하기" id="join_submit"></div>
			</div>
		</form>		
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
		  <button onclick="showAgreementDetails(); return false;">자세히</button>
		</div>
		
		<script type="text/javascript">
		  function showAgreementDetails() {
		    window.open('MemberJoinAgree.park', '_blank', 'width=500, height=500, top=' + ((screen.height - 500) / 2) + ', left=' + ((screen.width - 500) / 2));
		  }
		</script>
		
<!-- 		class="adAgreeCheckBox" -->
		<div class="login-join_form_agreement_ad">
			<input type="checkbox" class="joincheck" id="check_3">	
			<label for="adAgreeCheckBox">[필수] 광고성 정보 수신 동의 </label>
		</div>

	</div>
		

</body>
</html>