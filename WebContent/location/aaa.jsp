<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.location.beans.*" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= request.getParameter("lat")%><br>
<%= request.getParameter("lng")%><br>

   <% LocDTO [] arr = (LocDTO [])request.getAttribute("shoplist"); %>
	
	<%
	for(int i=0;i<arr.length; i++){
		out.println(arr[i].getSh_name());
		out.println(arr[i].getSh_location());
		out.println("<br>");
	}	
	%>
	
 
</body>
</html>