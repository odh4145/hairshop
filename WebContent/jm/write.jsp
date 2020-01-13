<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var name = frm["name"].value.trim();
	var title = frm["title"].value.trim();
	
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["name"].focus();
		return false;
	}
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	return true;
}

</script>
<body>
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.bbq" method="post" onsubmit="return chkSubmit()">
<p>USE_uid<input type="text" name="use_uid"/></p>
<p>Sh_uid<input type="text" name="sh_uid"/></p>
<p>작성자 : <input type="text" name="name"/></p><br>
<p>제목:<input type="text" name="title"/></p><br>
<p>별점:<input type="text" name="star"/></p><br>
<p>내용:<br>
<textarea name="content"></textarea></p><br>
<br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.bbq'">목록으로</button>
</body>

</html>