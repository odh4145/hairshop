<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<% // Controller 로부터 결과 데이터 받음
	WriteDTO [] arr = (WriteDTO []) request.getAttribute("list");
	//int uid = Integer.parseInt(request.getParameter("uid"));  // OK
%>
<%
	int co_uid = arr[0].getco_uid();
	int bo_uid = arr[0].getbo_uid();
	int co_star =arr[0].getco_star();
	String co_name = arr[0].getco_name();
	String co_title = arr[0].getco_title();
	String co_content = arr[0].getco_content();
	String co_regdate = arr[0].getco_regdate();
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기수정 <%= co_title %></title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">


</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var co_content = frm["co_content"].value.trim();
	
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



<h2>수정</h2>
<%--내용 과 제목만 수정 가능. submit 하기전에 검증 --%>
<form name="frm" action="updateOk.do" 
	method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="co_uid" value="<%= co_uid%>"/>	
작성자 : <%= co_name %><br>  <%-- 작성자 이름은 변경 불가 --%>
제목 : <%= co_title%><br>
별점:
<input type="number" name="co_star" value="<%= co_star%>"><br>
내용 :
<textarea name="co_content"><%= co_content %></textarea>
<br><br>
<input type="submit" value="수정"/>
</form>

<button onclick="history.back()">이전으로</button>
<button onclick="location.href = 'list.do'">목록보기</button>

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















