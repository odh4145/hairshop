<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<% // Controller 로부터 결과 데이터 받음
	WriteDTO [] arr = (WriteDTO []) request.getAttribute("list");
	//int uid = Integer.parseInt(request.getParameter("uid"));  // OK
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 <%= co_title %></title>
</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var co_content = frm["co_content"].value.trim();
	
	if(co_content == ""){
		alert("내용은 반드시 작성해야 합니다");
		frm["co_content"].focus();
		return false;	
	}
	
	return true;
}
</script>
<body>

<%--내용 과 제목만 수정 가능. submit 하기전에 검증 --%>
<form name="frm" action="updateOk.do" 
	method="post" onsubmit="return chkSubmit()">
	
<table border ="1">
	<caption><h2>후기 수정</h2></caption>
<input type="hidden" name="co_uid" value="<%= co_uid%>"/>	
		<tr>
			<th>작성자</th>
			<td align = "center">
			    <%= co_name %>
			</td>
		</tr>
		<tr>
		<th>예약 번호</th>
			<td align = "center">
		      <%= bo_uid%><br>
		</td>
		</tr>
		<tr>
		<th>제목</th>
			<td align = "center">
		      <%= co_title%><br>
		</td>
		</tr>
		<th>별점</th>
			<td align = "center">
			<input type="number" name="co_star" size = "50" value="<%= co_star%>" required><br>
			</td>
		</tr>
		<tr>
		<th>후기 내용</th>
			<td colspan = "2" align = "center">
				<textarea name = "board_content" rows = "20" cols = "80" required>${dto.content }</textarea>
			</td>			
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "submit" value = "수정 완료">
				<input type = "reset" value = "초기화">
			</td>
		</tr>
		<tr>
		<td colspan = "2" align = "center">
		<button onclick="history.back()">이전으로</button>
        <button onclick="location.href = 'list.do'">목록보기</button>
        </td>
        </tr>
	</table>
</form>
</body>
</html>



	











