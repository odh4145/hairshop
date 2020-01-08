<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 목록</title>

	<caption><h2>후기 게시판</h2></caption>
		<table border = "1" width = "100%">
			<tr align = "center">
				<th>글번호</th>
				<th>작성자</th>
				<th width="47%">제목</th>
				<th>별점</th>
				<th>등록일</th>
			</tr>
			<c:forEach var = "dto" items = "${list }">
			<tr align = "center">
				<th>${dto.co_uid }</th>
				<th>${dto.co_name }</th>
			 <th width="47%" align = "left"><a href ="re_view.do?co_uid=${dto.co_uid }"> ${dto.co_title }</a></th> 	
				<th>${dto.co_star }</th>
				<th>${dto.co_regdate }</th>
			</tr>	
			</c:forEach>
		</table>


</body>
</html>

