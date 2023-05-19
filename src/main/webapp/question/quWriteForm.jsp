<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1대1 문의</title>
</head>
<body>
   <form action="./QuestionWriteAction.qu" method="post" >
	<table id="question">
		<tr>
		    <th class="ttitle" colspan="2">1대1 문의</th>
		</tr>
		<tr>
			<td> 문의 유형 </td>
			<td>
				<select name="quType">
				<option></option>
					<option value="예약 문의">예약 문의</option>
					<option value="서비스 문의">서비스 문의</option>
					<option value="위치 문의">위치 문의</option>
					<option value="결제 문의">결제 문의</option>
					<option value="환불 문의">환불 문의</option>
					<option value="기타 문의">기타 문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td><input type="text" name="quTitle"></td>
	 	</tr>
		<tr>
			<td> 내용 </td>
			<td><textarea name="quContents"></textarea></td>
		</tr>
		
		<tr>
		   <td colspan="2">
		     	<div id="table_search">
					<input type="submit" value="문의하기" class="btn">
				</div>
		   </td>
		</tr>
	</table>
	
</form>
</body>
</html>