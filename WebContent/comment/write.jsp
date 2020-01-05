<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>후기 글작성</title>
</head>

<body>
<center>
	<hr> 
		<form action="writeOk.do" method="post">
	
	<table border ="1">
		<caption><h2>후기 작성</h2></caption>
		<tr>
		    <th>별점</th>
			<td align = "center">
				<input type = "text" name = "star" size = "72" placeholder = "별점을 입력하세요" required>
			</td> 
		</tr>
		<tr>
			<th>이름</th>
			<td align = "center">
				<input type = "text" name = "name" size = "72" placeholder = "이름을 입력하세요" required>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<textarea name = "content" rows = "20" cols = "80" required></textarea>
			</td>			
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "submit" value = "작성완료">
				<input type = "reset" value = "초기화">
			</td>
		</tr>
	</table>
	</center>
</body>
</html>





