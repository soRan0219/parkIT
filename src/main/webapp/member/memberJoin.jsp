<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/park.css">

<!DOCTYPE html>
<!-- saved from url=(0045)http://localhost:8088/jQuery/jq/testLogin.jsp -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testLogin</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pw = $("#pw").val();
			var pwd2 = $("#pwd2").val();
			if (pw != "" || pwd2 != "") {
				if (pw == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("submit").attr("disabled", "disabled");
				}

			}

		});

	});
</script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// [전체선택] 클릭시 개별 체크 박스를 전체 선택 또는 해제
		$("#AgreeCheckBox-All").click(function() {
			if ($("#AgreeCheckBox-All").prop("checked")) {
				$(".joincheck").prop("checked", true);
			} else {
				$(".joincheck").prop("checked", false);
			}
		});

		// 체크된거 해제하면 전체선택 박스 해제 및 개별체크 전부 클릭시 전체 선택 선택 처리
		$(".joincheck").click(function() {
			if ($("input[class='joincheck']:checked").length == 3) {
				$("#AgreeCheckBox-All").prop("checked", true);
			} else {
				$("#AgreeCheckBox-All").prop("checked", false);
			}
		});
	});
</script>


</head>
<body>
	<a class="navbar-brand" href="./MainMain.park"> <span>Park<span>IT</span>
	</a>
	<div class="join_content">
		<form action="./MemberJoinAction.park" method="post"
			onsubmit="return checkData();">
			<!-- 아이디, 비밀번호 입력 -->
			<div class="row_group">
				<div class="join_row">
					<p>
						<class ="join_title" label for="id">아이디</label>
						<br>
						<span class="ps_box int_id"> <input type="text" id="id"
							name="id" class="int" title="ID" maxlength="15"
							placeholder="영문, 숫자 6-15 자"> <input type="button"
							name="id2" value="중복확인">
						</span>
					</p>
				</div>
				<div class="join_row">
					<p>
						<class ="join_title" label for="pw">비밀번호</label>
						<br>
						<span class="ps_box int_pass_step3" id="pswd1Img"> <input
							type="password" id="pw" name="pw" class="form-control"
							title="비밀번호 입력" placeholder="숫자, 영문 조합 최소 8자">
						</span>
					</p>
					<p>
						<class ="join_title" label for="pw2">비밀번호 재확인</label>
						<br>
						<span class="ps_box int_pass_check" id="pswd2Img"> <input
							type="password" id="pwd2" name="pw2" class="form-control"
							title="비밀번호 재확인 입력" required="">
						</span>
						<div class="alert alert-success" id="alert-success">비밀번호가
							일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다.</div>
					</p>
				</div>
			</div>
	</div>
	<!-- // 아이디, 비밀번호 입력 -->
	<!-- 이름, 생년월일, 휴대전화 입력 -->
	<div class="row_group">
		<div class="join_row">
			<p>
				<class ="join_title" label for="memname">이름</label>
				<br>
				<span class="ps_box box_right_space"> <input type="text"
					id="memname" name="memname" title="이름" class="int" maxlength="40">
				</span>
			</p>
			<div class="join_row">
				<p>
					<class ="join_title" label for="birth">생년월일</label>
					<br>
					<span class="ps_box"> <input type="date" id="birth"
						name="birth" title="생년월일" class="int">
					</span>
				</p>
			</div>
			<div class="join_row">
				<p>
					<class ="join_title" label for="tel">휴대전화</label>
					<br>
					<span class="ps_box"> <input type="text" id="tel" name="tel"
						title="휴대전화" class="int" maxlength="13">
					</span>
				</p>
			</div>
		</div>
		<!-- // 이름, 생년월일, 휴대전화 입력 -->
		<!-- 이메일 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<class ="join_title" label for="email">이메일</label>
					<br>
					<span class="ps_box"> <input type="email" id="email"
						name="email" class="int" title="이메일"> <input type="button"
						name="email2" value="이메일인증">
					</span>
				</p>

			</div>
		</div>
		<!-- // 이메일 입력 -->
		<hr>
		<div>
			<input type="submit" value="가입하기">
		</div>
	</div>


	<!-- 약관동의 -->
	<div class="login-join_form_agreement">

		<div class="login-join_form_agreement_all-checkbox">
			<input type="checkbox" id="AgreeCheckBox-All"
				class="AgreeCheckBox-All"> <label for="AgreeCheckBox-All"><b>약관
					전체 동의하기(선택 동의 포함)</b></label>
		</div>

		<!-- 		class="ageAgreeCheckBox" -->
		<div class="login-join_form_agreement_age">
			<input type="checkbox" class="joincheck"> <label
				for="ageAgreeCheckBox">[필수] 만 18세 이상입니다. </label>
		</div>

		<!-- 		class="privacyAgreeCheckBox"  -->
		<div class="login-join_form_agreement_privacy">
			<input type="checkbox" class="joincheck"> <label
				for="privacyAgreeCheckBox">[필수] 개인정보 수집 및 이용 동의</label>
			<button onclick="window.open('MemberJoinAgree.park', '_blank');"
				class="privacyageAgreeCheckBox_link">자세히</button>
		</div>

		<!-- 		class="adAgreeCheckBox" -->
		<div class="login-join_form_agreement_ad">
			<input type="checkbox" class="joincheck"> <label
				for="adAgreeCheckBox">[선택] 광고성 정보 수신 동의 </label>
		</div>

	</div>


</body>
</html>