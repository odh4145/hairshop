<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>

<%
	int use_uid = Integer.parseInt(request.getParameter("use_uid"));
	// ※ 이 단계에서 parameter 검증 필요
	int uid = Integer.parseInt(request.getParameter("uid"));
	// ※ 이 단계에서 parameter 검증 필요
%>

<script>
// form 검증

</script>
<body>
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="reWriteOk.bbq" method="post" >
<input type="hidden" name="uid" value="<%= uid%>"/>	
<input type="hidden" name="use_uid" value="<%= use_uid%>"/>	
<p>내용:<br>
<textarea name="re_content"></textarea></p><br>
<br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='view.bbq'">목록으로</button>
</body>

</html>