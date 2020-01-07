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
	String co_name = arr[0].getco_name();
	String co_title = arr[0].getco_title();
	String co_content = arr[0].getco_content();
	String co_regdate = arr[0].getco_regdate();
	
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>읽기 <%= co_title %></title>
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
<h2>읽기 <%= co_title %></h2>
<br>
후기 번호 : <%= co_uid %><br>
예약 번호 : <%= bo_uid %><br>
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
<button onclick="location.href = 'list.do'">목록보기</button>
<button onclick="chkDelete(<%= co_uid%>)">삭제하기</button>
<button onclick="location.href = 'write.do'">신규등록</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>