<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
    int cnt = (Integer) request.getAttribute("result");
	int co_uid = Integer.parseInt(request.getParameter("co_uid"));
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
<script>
	alert("수정실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("수정성공");
	location.href = "view.do?co_uid=<%=co_uid%>"; <%-- 수정성공하면 view 로 이동해서 제대로 수정되었는지 확인--%>
</script>
<% } %>

