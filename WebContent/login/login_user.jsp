<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>손님 로그인</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
</head>

<!-- form 검증 -->
<script>
	function chkUserSubmit() {
		frm = document.forms["frm_user"];

		var use_id = frm["use_id"].value.trim();
		var use_pw = frm["use_pw"].value.trim();

		if (use_id == "") {
			alert("아이디를 입력해주세요");
			frm["use_id"].focus();
			return false;
		}
		if (use_pw == "") {
			alert("비밀번호를 입력해주세요");
			frm["use_pw"].focus();
			return false;
		}

		return true;
	}

</script>

<script>
function logout(){
    setTimeout(function(){
        location.reload();
    }, 1000);
}
</script>

<body>

<header>
	<ul id="top_menu">
		<li id="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="../location/Location2.bbq">내주변</a></li>
			<li><a href="#">지역별매장</a></li>
			<li><a href="../changeinfo/changeUserInfo.bbq">마이페이지</a></li>
		</ul>	
		<c:if test="${sessionScope.user == null }">
		<li id="login" ><a href="login_user.bbq">로그인</a></li>
		</c:if>
		<c:if test="${sessionScope.user != null }">
		<li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
		</c:if>
	</ul>
</header>


<c:choose>
	<c:when test="${sessionScope.user == null }">




	<section>

		<!-- 로그인 -->
		<div id="login_user">
				<h3>Sign In</h3>
				<a id="login_p"><i class ="fas fa-user-circle"></i></a>
			<form name="frm_user" action="login_user_ok.bbq" method="post"
				onsubmit="return chkUserSubmit()">
				<ul>
					<li><input id="use_id" type="text" name="use_id" placeholder="ID"></li>
					<li><input id="use_pw" type="password" name="use_pw" placeholder="PASSWORD"></li>
					<li><input type="submit" id="btn" value="Sign In" /></li>
					<li><a id="join" href="../join/join_user.bbq">Join</a></li>
				</ul>
			</form>

		</div>

	</section>
	
	
	
	</c:when>
	
	<c:when test="${sessionScope.user != null }">

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">손님 로그인</h2>
		
		<!-- 로그인 -->
			<div id="login_user">
				<h3><%= session.getAttribute("user") %> 님 로그인 성공</h3>
			</div>
		
		
	
	</div>
</section>

	</c:when>
</c:choose>

	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>
