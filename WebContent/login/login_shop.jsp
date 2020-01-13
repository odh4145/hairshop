<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 로그인</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">

</head>

<!-- form 검증 -->
<script>
function chkShopSubmit(){
	frm = document.forms["frm_shop"];
	
	var sh_id = frm["sh_id"].value.trim();
	var sh_pw = frm["sh_pw"].value.trim();
	
	if(sh_id == ""){
		alert("아이디를 입력해주세요");
		frm["sh_id"].focus();
		return false;
	}
	if(sh_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["sh_pw"].focus();
		return false;
	}
	
	return true;
}
</script>

<body>
<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="">후기</a></li>
				<li><a href="">예약내역</a></li>
				<li><a href="">마이페이지</a></li>
			</ul>
			<c:if test="${sessionScope.user == null }">
				<li id="login"><a href="login_user.bbqLoginUser">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li id="login"><a href="../logout/Userlogout.jsp">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
		<ul id="mo_menu">
			<li><a>후기</a></li>
			<li><a>예약내역</a></li>
			<li><a id="mypage">마이페이지</a></li>
			<ul id="mo_sub">
				<li>매장정보변경</li>
				<li>매장사진관리</li>
				<li>개인정보수정</li>
			</ul>
			<li><a>로그인</a></li>
		</ul>
	</header>



<section>

 	<c:choose>
		<c:when test="${sessionScope.shop == null }">
	
	
		<!-- 로그인 -->
			<div id="login_shop">
				<h3>Sign In</h3>
				<a id="login_p2"><i class="fas fa-cut"></i></a>
				<form name="frm_shop" action="login_shop_ok.bbqLoginShop" method="post" onsubmit="return chkShopSubmit()">
				<ul>
					<li><input id="sh_id" type="text" name="sh_id" placeholder="ID"></li>
					<li><input id="sh_pw" type="password" name="sh_pw" placeholder="PASSWORD"></li>
					<li><input type="submit" id="btn" value="Sign In"/></li>
					<li><a id= "join" href="../join/join_shop.jsp">Join</a></li>
				</ul>
			</form>
			
		</div>
			
				
			
		</c:when>
		
		
		<c:when test="${sessionScope.shop != null }">
			<h3><%= session.getAttribute("shop") %> 님 로그인 성공</h3>
		</c:when>
</c:choose>
		
		
	</div>
</section>
	

	


	

	
<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>