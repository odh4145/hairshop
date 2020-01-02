<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 로그인</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
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
		<li id="logo"><a href="index.html">Booking<span>HairShop</span></a></li>
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
		<h2 id="content_title">매장 로그인</h2>

		<!-- 로그인 -->
			<div id="login_shop">
				
				<form name="frm_shop" action="login_shop_ok.jsp" method="post" onsubmit="return chkShopSubmit()">
					<input id="sh_id" type="text" name="sh_id" placeholder="아이디">
					<br><br>
					<input id="sh_pw" type="password" name="sh_pw" placeholder="비밀번호">
					<br><br>
					<input type="submit" id="btn" value="로그인"/>
					<br><br>
				</form>
				
				<a href="join_shop.jsp">아직 회원이 아니신가요?</a>
				<br><br>
				
			</div>
		
		
		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
	</div>
</section>


<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/public.js" type="text/javascript"></script>
</body>
</html>