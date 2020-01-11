<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>후기 글작성</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">


</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var co_name = frm["co_name"].value.trim();
	var co_title = frm["co_title"].value.trim();
	var co_content = frm["co_content"].value.trim();
	
	if(co_name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["co_name"].focus();
		return false;
	}
	if(co_title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["co_title"].focus();
		return false;
	}
	if(co_content == ""){
		alert("내용은 반드시 작성해야 합니다");
		frm["co_content"].focus();
		return false;
	}
	return true;
}

</script>


<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="index.jsp">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="#">내주변</a></li>
			<li><a href="#">지역별매장</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>	
		<li id="login" ><a href="#">로그아웃</a></li>
	</ul>
</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">마이페이지 예약내역</h2>

<div>     

<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>

<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">

	<table border ="1">
		<caption><h2>후기 작성</h2></caption>
		<tr>
		    <th>작성자</th>
			<td align = "center">
				<input type = "text" name = "co_name" size = "72" placeholder = "이름을 입력해주세요" required>
			</td> 
		</tr>
		<tr>
			<th>별점</th>
			<td align = "center">
			 	<input type = "number" name = "co_star" size = "72" placeholder = "별점을 입력해주세요(1~5점)" required>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td align = "center">
				<input type = "text" name = "co_title" size = "72" placeholder = "제목을 입력해주세요 " required>
			</td><tr>
			
		</tr>
		<tr>
			<th>후기내용</th>
			<td colspan = "2" align = "center">
				<textarea name = "co_content" rows = "20" cols = "80" required></textarea>
			</td>			
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "submit" value = "작성완료">
				<input type = "reset" value = "초기화">
				<button type="button" onclick="location.href='list.do'">목록으로</button>
			</td>
		</tr>
	</table>
</form>


</div>

<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
	</div>
</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/public.js" type="text/javascript"></script>
</body>
</html>














	