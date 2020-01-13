<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // controller 를 사용한 트랜잭션
	int cnt = (Integer)request.getAttribute("result");
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
	<script>
		alert("등록 실패!!!!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록성공, 리스트를 출력합니다");
		location.href = "list.bbq";
	</script>
<% }  %>












