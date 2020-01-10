<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>    
<% // Controller 로부터 결과 데이터 받음
	WriteDTO [] arr = (WriteDTO []) request.getAttribute("list");
%>

<% if(arr == null || arr.length == 0){ %>
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
<%
		return;
	}
%>
<%
	int co_uid = arr[0].getco_uid();
    int bo_uid = arr[0].getbo_uid();
    int co_star =arr[0].getco_star();
    int use_uid =arr[0].getuse_uid();
    int sh_uid =arr[0].getsh_uid();
	String co_name = arr[0].getco_name();
	String co_title = arr[0].getco_title();
	String co_content = arr[0].getco_content();
	String co_regdate = arr[0].getco_regdate();
	String de_name = arr[0].getde_name();
	String bo_service =arr[0].getbo_service();
	
	
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기상세내용 <%= co_title %></title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">




</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?co_uid=' + id;
	}
	
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

<h2>읽기 <%= co_title %></h2>
<br>
후기 번호 : <%= co_uid %><br>
예약 번호 : <%= bo_uid %><br>
아이디: <%=use_uid %><br>
매장 아이디:<%=sh_uid %><br>
담당 디자이너: <%=de_name %><br>
시술 내역:<%=bo_service %><br>
작성자 : <%= co_name %><br>
제목: <%= co_title %><br>
등록일: <%= co_regdate %><br>
별점: <%= co_star %><br>
내용: <br>
<hr>
<div>
<%=co_content %>
</div>
<hr>
<br>
<button onclick="location.href = 'update.do?co_uid=<%= co_uid%>'">수정하기</button>
<button type="button" onclick="location.href='list.do?page=${page }'">목록으로</button>
<button onclick="chkDelete(<%= co_uid%>)">삭제하기</button>
<button onclick="location.href = 'write.do'">신규등록</button>


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