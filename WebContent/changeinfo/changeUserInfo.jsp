<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="../css/changeUserInfo.css" rel="stylesheet" type="text/css">

</head>

<!--  form 검증  -->
<script>
function chkUserPw(){
frm = document.forms["frm_chk_user_pw"];
	
	var use_pw = frm["use_pw"].value.trim();
	var use_pw2 = frm["use_pw2"].value.trim();
	
	if(use_pw == ""){
		alert("현재 비밀번호를 입력해주세요");
		frm["use_pw"].focus();
		return false;
	}
	if(use_pw2 == ""){
		alert("새 비밀번호를 입력해주세요");
		frm["use_pw2"].focus();
		return false;
	}
	return true;
}
</script>
<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="#">내주변</a></li>
			<li><a href="#">지역별매장</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>	
		<c:if test="${sessionScope.user == null }">
		<li id="login" ><a href="../login/login_user.bbq">로그인</a></li>
		</c:if>
		<c:if test="${sessionScope.user != null }">
		<li id="login" ><a href="../logout/Userlogout.bbq">로그아웃</a></li>
		</c:if>
	</ul>
</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">마이페이지 개인정보수정</h2>
		
		<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
		<div class="submenu inner">
			<h4 class="selected"><a>예약내역</a></h4>
			<h4><a>내가 쓴 글</a></h4>
			<h4><a>개인정보수정</a></h4>
		</div>
		

<!-- 여기 코드 추가 -->
		
		<div id="changeinfo" >
		<h3>개인정보수정</h3>
		<hr>
				<form name="frm_chk_user_pw" action="changeUserInfo_ok.bbq" method="post" onsubmit="return chkUserPw()">
		       <ul>
					<li><input id="use_pw" type="password" name="use_pw" placeholder="CURRENT PASSWORD"></li>
					<li><input id="use_pw2" type="password" name="use_pw2" placeholder="NEW PASSWORD"></li>
					<li><input type="submit" id="btn" value="Change"/></li>
			  </ul>
				</form>
			
			</div>
		
<!-- 여기 코드 추가 -->
		
	</div>
</section>


<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>