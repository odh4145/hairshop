<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 <% WriteDTO [] arr = (WriteDTO [])request.getAttribute("view");
 
 %>

<%
	int uid = Integer.parseInt(request.getParameter("uid"));
	// ※ 이 단계에서 parameter 검증 필요
%>


<% if(arr == null || arr.length == 0){ %>
	<script>
	alert("해당글이 삭제되거나 없습니다.");
	history.back();
	</script>
<%
return;//더이상 볼게 없을때는 JSP 프로세싱을 끊어줘야해 ~
}
%>


<%
	String name = arr[0].getName();
	String title = arr[0].getTitle();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int use_uid = arr[0].getUse_uid();
	
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>


<!DOCTYPE html>
<html lang="ko">
<head>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<meta charset="UTF-8">
<title>게시판?</title>
</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.bbq?uid=' + id;
	}
	
}
</script>



<body>
<h2>읽기 <%= title %></h2>
<br>

id : <%= uid %><br>
작성자 : <%= name %><br>
제목: <%= title %><br>
등록일: <%= regdate %><br>

내용: <br>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>

<button onclick="location.href = 'update.bbq?uid=<%= uid%>'">수정하기</button>
<button onclick="location.href = 'list.bbq?page=${page }'">목록보기</button>
<button onclick="chkDelete(<%= uid%>)">삭제하기</button>
<br><br><br>

<form name="frm" action="reWrite.bbq" method="post">
<input type="hidden" name="uid" value="<%= uid%>"/>
<input type="hidden" name="use_uid" value="<%= use_uid%>"/>
<input type="submit" value="답글달기"/>
</form>

<hr>
	<h2>답글부분 ~~~~~</h2>
	<table>
		<tr>
			<th>uid</th>
			<th>내용</th>	
			<th>등록일</th>
		</tr>

		<c:forEach var="dto" items="${Relist }" varStatus="status">
			<tr>
				<td>${dto.re_uid }</td>
				<td>${dto.re_content }</td>
				<td>${dto.re_regDate }</td>
			</tr>
		</c:forEach>
	</table>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>







