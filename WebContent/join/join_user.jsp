<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>손님 회원가입</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">

</head>

<!-- form 검증 -->
<script>
function chkUserSubmit(){
	frm = document.forms["frm_user"];
	
	var use_id = frm["use_id"].value.trim();
	var use_pw = frm["use_pw"].value.trim();
	var use_name = frm["use_name"].value.trim();
	var use_phoneNum = frm["use_phoneNum"].value.trim();
	
	if(use_id == ""){
		alert("아이디를 입력해주세요");
		frm["use_id"].focus();
		return false;
	}
	if(use_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["use_pw"].focus();
		return false;
	}
	if(use_name == ""){
		alert("이름을 입력해주세요");
		frm["use_name"].focus();
		return false;
	}
	if(use_phoneNum == ""){
		alert("휴대폰 번호를 입력해주세요");
		frm["use_phoneNum"].focus();
		return false;
	}
	
	return true;
}
</script>

<body>
<header>
	<ul id="top_menu">
		<li id="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="../location/Location2.bbq">내주변</a></li>
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
		<h2 id="content_title">손님용 회원가입</h2>
		
	
		<!-- 회원가입 -->
			<div id="join_user">
			
				<form name="frm_user" action="join_user_ok.bbq" method="post" onsubmit="return chkUserSubmit()">
				
					<input id="use_id" type="text" name="use_id" placeholder="아이디">
					<br><br>
					<input id="use_pw" type="password" name="use_pw" placeholder="비밀번호">
					<br><br>
					<input id="use_name" type="text" name="use_name" placeholder="이름">
					<br><br>
					<input id="use_phoneNum" type="text" name="use_phoneNum" placeholder="휴대폰 번호">
					<br><br>
					<input type="submit" id="btn" value="가입하기">
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