<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 마이페이지 아닌분들은 sub.css 지우세요 -->
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/designer.css" rel="stylesheet" type="text/css">
</head>

<script>
function chkSubmit(){
	frm = document.forms["'frm + <%=${i }%> +''"];	
	
	if(de_name == "" && de_position == "" && de_career == "" && de_major == ""){
		alert("모든 칸을 입력해주세요.");
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
				<li><a href="#">후기</a></li>
				<li><a href="#">예약관리</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
			<li id="login"><a href="#">로그아웃</a></li>
		</ul>
	</header>

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">디자이너관리</h2>

			<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
			<div class="submenu inner">
				<h4><a>매장정보</a></h4>
				<h4 class="selected"><a>디자이너관리</a></h4>
				<h4><a>개인정보수정</a></h4>
			</div>

			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div class="inner">
			<!-- 디자이너 목록 -->
				<div class="information">

					<c:forEach var="i" items="${designer }" step="1">
						<form name="'frm + ${i } +'" action="designerOk.bbq" method="post" onsubmit="return chkSubmit()" 
								enctype="Multipart/form-data">
						<ul class="designer">
							<li><input type="hidden" name="de_uid" value="${i.de_uid }"/></li>
							<li>이름 <input type="text" name="de_name" value="${i.de_name }"/></li>
							<li>직책 <input type="text" name="de_position" value="${i.de_position }"/></li>
							<li>경력 <input type="text" name="de_carrer" value="${i.de_career }"/></li>
							<li>전공 <input type="text" name="de_major" value="${i.de_major }"></li>
							<li><input id="insert_dpic" type="file" name="de_picture" size=40></li>
							<li><input id="update_d" type="submit" value="수정하기"/></li>
						</ul>
						</form>					
					</c:forEach>
				</div>				
			</div>

			<!-- 화살표버튼 -->
			<div id="go_top">
				<a><i class="fas fa-arrow-circle-up"></i></a>
			</div>
		</div>
	</section>


	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>