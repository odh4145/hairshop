<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 회원가입</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css">

</head>

<!-- form 검증 -->
<script>
function chkShopSubmit(){
	frm = document.forms["frm_shop"];
	
	var sh_id = frm["sh_id"].value.trim();
	var sh_pw = frm["sh_pw"].value.trim();
	var sh_no_id = frm["sh_no_id"].value.trim();
	var sh_name = frm["sh_name"].value.trim();
	var sh_telephoneNum = frm["sh_telephoneNum"].value.trim();
	var sh_location = frm["sh_location"].value.trim();
	
	
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
	if(sh_no_id == ""){
		alert("사업자 번호를 입력해주세요");
		frm["sh_no_id"].focus();
		return false;
	}	
	if(sh_name == ""){
		alert("매장 이름을 입력해주세요");
		frm["sh_name"].focus();
		return false;
	}
	if(sh_telephoneNum == ""){
		alert("매장 전화번호를 입력해주세요");
		frm["sh_telephoneNum"].focus();
		return false;
	}
	if(sh_location == ""){
		alert("매장 주소를 입력해주세요");
		frm["sh_location"].focus();
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
		<h2 id="content_title">매장 회원가입</h2>
		
	
		<!-- 회원가입 -->
			<div id="join_shop">
			
				<form name="frm_shop" action="join_shop_ok.jsp" method="post" onsubmit="return chkShopSubmit()">
				
					<input id="sh_id" type="text" name="sh_id" placeholder="아이디">
					<br><br>
					<input id="sh_pw" type="password" name="sh_pw" placeholder="비밀번호">
					<br><br>
					<input id="sh_no_id" type="text" name="sh_no_id" placeholder="사업자 번호">
					<br><br>
					<input id="sh_name" type="text" name="sh_name" placeholder="매장 이름">
					<br><br>
					<input id="sh_telephoneNum" type="text" name="sh_telephoneNum" placeholder="매장 전화번호">
					<br><br>
					<input id="sh_location" type="text" name="sh_location" placeholder="매장 주소">
					<br><br>
					<input type="submit" id="btn" value="가입하기"/>
					<br><br>
					
				</form>
				
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