<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> reservation </title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<link href="btn.css" rel="stylesheet">

<script type="text/javascript">			
	
	$(function() {
		
		// 날짜버튼, 최대 한달뒤까지 예약 가능
		$('#datepicker').datepicker({
			showOn:'both',
			buttonImage:'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
			buttonImageOnly:'true',
			changeMonth:'true',
			changeYear:'true',
			nextText:'다음달',
			prevText:'이전달',
			showButtonPanel:'true',
			currentText:'오늘',
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			dayNamesMin:['월','화','수','목','금','토','일'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate:0,
			maxDate:+40
		});
		
		// 시간 선택기
		$('#fromTime').timepicker({
			timeFormat:'H:mm',
			interval:30,			// 시간 간격
			startTime:'00:00',
// 			defaultTime:'00:00',
			dynamic:false,
			scrollbar:true,
			change:function(time) {
				var minTime = new Date(time);
				minTime.setMinutes(minTime.getMinutes() + 30);
				$('#toTime').timepicker('option', 'minTime', minTime);
			} // fromtime 값이 변경될때마다 시간값을 매개변수로 받아서 최소시간값을 변경
		});

		// 시간 선택기
		$('#toTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'00:00',
			dynamic:false,
			scrollbar:true
		});
		
		// 조회하기 버튼 누를 때
		$('input[type="button"]#search').click(function() {
			
			// 시간, 날짜, 자리번호 저장
			var resDate = $('#datepicker').val();
			var parkInTime = $('#fromTime').val();
			var parkOutTime = $('#toTime').val();
			var parkingCode = $('select[name="parking"]').val();
			
			// hidden 타입에 정보 저장
			$('#resDate').val(resDate);
			$('#parkInTime').val(parkInTime);
			$('#parkOutTime').val(parkOutTime);
			$('#parkingCode').val(parkingCode);
			
			
			// 날짜를 선택하지 않은 경우
			if (!resDate){
				alert("날짜를 선택하세요.");
				return;
			}
			
			// 시간을 선택하지 않은 경우
			if (!parkInTime || !parkOutTime) {
				alert("시간을 선택하세요.");
				return;
			}
			
			
			
			// 조회하기 더 눌렀을 때 기존의 changeColor(파란색) 없애는 코드
			if (selectedButton) {
				selectedButton.classList.remove('blue');
				selectedButton = null;
				document.getElementById('selectedButton').value = ''; // input 태그의 값을 초기화
			}
			
			
			// 아래의 버튼 보이게 하기
			document.querySelector(".btn").style.display = "block";
			
			// ajax
			$.ajax({
				
				// 저장한 값을 reservationAction.park로 보냄
				type:"POST",
				url: "ReservationAction.park",
				data: {
					resDate: resDate,
					parkInTime: parkInTime,
					parkOutTime: parkOutTime,
					parkingCode: parkingCode
				},
				success: function(data){
					var available = data.getAvailable;
					
					$('.buttonN').removeClass('buttonN').addClass('button'); // 기존의 buttonN정보 제거
					
					// available 에서 주차장코드, 자리번호, 예약상태 값만 가져오게 해둠
					for (var i = 0; i < available.length; i++) {
					var position = available[i].parkPosition;
					var resStatus = available[i].resStatus;
					
						if (position && resStatus === 1) { // position 값이 존재 + resStatus값이 1이면
							$('#button' + position).addClass('buttonN').removeClass('button'); // 해당 버튼에 buttonN 클래스 추가
						}
						else{
					    	$('#button' + position).removeClass('buttonN').addClass('button'); // 해당 버튼에 button 클래스 추가
						}
					    
					}
				}//success
					

				
			}); // ajax
			
		}); // 조회하기 버튼
		
		
		
		
		// 여기서 버튼 구현
		
		
	}); // 함수 끝
	
	
	
	
	
	
	// -------------------------------------------------------------------------------
	// 버튼을 누르면 색깔 바뀌게 하고 버튼 정보 저장
	let selectedButton = null;

	function changeColor(buttonId) {
		const button = document.getElementById(buttonId);
		
		if (button.classList.contains('buttonN')) { // 버튼 클래스가 buttonN인 경우
			return; // 작동하지 않게
		}
		
		if (selectedButton && selectedButton.id === buttonId) { // 선택된 버튼과 현재 클릭한 버튼이 같은 경우
			selectedButton.classList.remove('blue'); // 선택된 버튼의 색을 되돌림
			selectedButton = null;
			document.getElementById('selectedButton').value = ''; // input 태그의 값을 초기화
		}
		else{
			if (selectedButton) {
				selectedButton.classList.remove('blue');
			}
			
			button.classList.add('blue');
			selectedButton = button;
			
			// 버튼 값 저장
			document.getElementById('selectedButton').value = buttonId.replace('button', '');
		}
	} // 여기까지 번호 누르면 색깔, 정보 저장
	
	
	
	// 번호 선택 안하면 alert 창 뜨게
	function selectBtn() {
		if (!selectedButton) {
			alert("자리를 선택하세요.");
			return false;
		}
		return true;
	}
	//-----------------------------------------------------------------
	
	

</script>
</head>
<body>
	<h1> reservationForm.jsp </h1>
	
	<div class="menu"> <!-- 메뉴 div -->
	
			
			<div>
				<select name="parking">
				 <option value="A"> 주차장1 </option>
				 <option value="B"> 주차장2 </option>
				 <option value="C"> 주차장3 </option>
				</select>
			</div>
			<div>
				<input type="text" id="datepicker" name="selectedDate">
				<input type="text" id="fromTime" name="fromTime">
				<input type="text" id="toTime" name="toTime">
				<input type="button" value="조회하기" id="search">
			</div>
		
		
	</div> <!-- 메뉴 div -->
		
	<div class="btn" style="display: none;"> <!-- 주차장 자리 버튼 -->
	
		<form action="Test.park" method="post" onsubmit="return selectBtn()">
		
			<div class=""> <!-- 버튼 1 ~ 10번 -->
			
			<input type="button" value="1" id="button1" class="button" onclick="changeColor('button1');">
			<input type="button" value="2" id="button2" class="button" onclick="changeColor('button2');">
			<input type="button" value="3" id="button3" class="button" onclick="changeColor('button3');">
			<input type="button" value="4" id="button4" class="button" onclick="changeColor('button4');">
			<input type="button" value="5" id="button5" class="button" onclick="changeColor('button5');">
<!-- 			<input type="button" value="6" id="button6" class="button" onclick="changeColor('button6');"> -->
<!-- 			<input type="button" value="7" id="button7" class="button" onclick="changeColor('button7');"> -->
<!-- 			<input type="button" value="8" id="button8" class="button" onclick="changeColor('button8');"> -->
<!-- 			<input type="button" value="9" id="button9" class="button" onclick="changeColor('button9');">  -->
<!-- 			<input type="button" value="10" id="button10" class="button" onclick="changeColor('button10');"> -->
			</div>
			
			<!-- 정보 저장용 hidden 태그 -->
			<input type="hidden" id="selectedButton" name="selectedButton" value="">
			<input type="hidden" id="resDate" name="resDate" value="">
			<input type="hidden" id="parkInTime" name="parkInTime" value="">
			<input type="hidden" id="parkOutTime" name="parkOutTime" value="">
			<input type="hidden" id="parkingCode" name="parkingCode" value="">
			
			<input type ="submit" value="예약하기">
			
		</form>
			
	</div> <!-- 전체 div -->
	
	
</body>
</html>