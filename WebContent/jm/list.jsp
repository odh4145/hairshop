<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("list");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

</head>
<body>
	<hr>
	<h2>리스트</h2>
	<table>
		<tr>
			<th>row</th>
			<th>uid</th>
			<th>제목</th>
			<th>글쓴이 이름?</th>			
			<th>등록일</th>
		</tr>

		<c:forEach var="dto" items="${list }" varStatus="status">
			<tr>
				<td>${(page - 1) * pageRows + status.index + 1 }</td>
				<td>${dto.uid }</td>
				<td><a href="view.bbq?uid=${dto.uid }&page=${page}">${dto.title }</a></td>
				<td>${dto.name }</td>
				<td>${dto.regDate }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button onclick="location.href='write.bbq'">신규등록</button>

<form name="frm" action="sortlist.bbq" method="post">
	<p>검색 :  </p> <input type="text" name="text" />
	<select name="speed" id="speed">
		<option selected="selected">제목별</option>
		<option>아몰랑 ~~~~~~~~~~~~~~~</option>
	</select>
	<br>
	<input type="submit" value="검색"/>
</form>

	<jsp:include page="pagination.jsp">
		<jsp:param value="${writePages }" name="writePages" />
		<jsp:param value="${totalPage }" name="totalPage" />
		<jsp:param value="${page }" name="curPage" />

	</jsp:include>

</body>
</html>







