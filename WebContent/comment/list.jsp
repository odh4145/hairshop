<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기 게시판</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>


</head>

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
        <caption><h2>후기 게시판</h2></caption>
		<table border = "1" width = "100%">
			<tr align = "center">
			     <th>row</th>
				<th>글번호</th>
				<th>작성자</th>
				<th width="47%">제목</th>
				<th>별점</th>
				<th>등록일</th>
			</tr>
			<c:forEach var = "dto" items = "${list }"  varStatus="status">
			<tr align = "center">
			<td>${(page - 1) * pageRows + status.index + 1 }</td>
				<td>${dto.co_uid }</td>
				<td>${dto.co_name }</td>
			 <td width="47%" align = "left"><a href ='view.do?co_uid=${dto.co_uid }&page=${page }'> ${dto.co_title }</a></td> 	
				<td>${dto.co_star }</td>
				<td>${dto.co_regdate }</td>
			</tr>	
			</c:forEach>
		</table>
<br><br>
	<div align = "center">
		<input type = "Button" value = "글쓰기" onclick = "location.href='write.do'">
	</div>

<jsp:include page="pagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>

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