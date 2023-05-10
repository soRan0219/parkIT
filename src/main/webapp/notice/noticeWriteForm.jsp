<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// select 태그에서 선택된 값을 가져오기
		function updateTitle() {
			
		var selectedValue = $("#noticeCategory").val();
		
		if(selectedValue == 'all'){
			$("#title").val('[전체공지]');
		}else if(selectedValue == 'a'){
			$("#title").val('[서면점]');
		}else if(selectedValue == 'b'){
			$("#title").val('[해운대점]');
		}else if(selectedValue == 'c'){
			$("#title").val('[연산점]');
		}
		
	}
		
		// select 태그의 change 이벤트에 updateTitle 함수를 등록
	    $("#noticeCategory").change(function() {
	        updateTitle();
	    });
		
	    // 페이지가 로드될 때 updateTitle 함수를 실행하여 초기 제목 설정
	    updateTitle();


	});
</script>
</head>
<body>

	

	<div>
		<a href="#">소개</a>
		<a href="#">예약하기</a>
		<a href="#">커뮤니티</a>
		
	</div>
	
	
	<div>
		<h1> 공지사항(관리자) </h1>
	</div>
	
	<div>
		<select name="noticeCategory" id="noticeCategory">
			<option value="all">전체공지</option>
			<option value="a">서면점</option>
			<option value="b">해운대점</option>
			<option value="c">연산점</option>
		</select>
	</div>
	
	
	<form action="./noticeWriteAction.no" method="post" enctype="multipart/form-data" name="fr" onsubmit="return validateForm()">
	<div>
		제목 : <input type="text" name="noticeTitle" id="title">
	</div>
	
	<div>
		내용 : <textarea rows="5" cols="10" name="noticeContents" placeholder="내용을 입력하세요."></textarea>
	</div>
	
	<div>
		첨부파일 : <input type="file" name="noticeFile">
	</div>
	
	<div>
		<input type="submit" value="등록">
	</div>
	
	<div>
		<input type="button" value="목록으로" onclick="location.href='./noticeList.no'">
	</div>
	</form>
	
	<script>
	function validateForm() {
		var title = document.forms["fr"]["noticeTitle"].value;
		if (title == "") {
			alert("제목을 입력하세요.");
			return false;
		}
	}
	
</script>
</body>
</html>