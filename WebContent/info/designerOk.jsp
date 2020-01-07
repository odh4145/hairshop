<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- cos 라이브러리 --%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%-- parameter 값들 --%>
<%@ page import="java.util.Enumeration"%>

<%-- File --%>
<%@ page import="java.io.File"%>

<%-- 이미지 파일 다루기 --%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.imageio.ImageIO"%>

<%@ page import="javax.servlet.*"%>


<%
	// MultipartRequest 객체 생성 준비
	//String saveDirectory = "C:\\tomcat\\download"; // 파일 저장 경로

	ServletContext context = this.getServletContext();
	String saveDirectory = context.getRealPath("upload");

	System.out.println("업로드 경로: " + saveDirectory);

	int maxPostSize = 5 * 1024 * 1024; // 최대 5M byte  POST 받기
	String encoding = "utf-8"; // 인코딩
	FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복 정책

	MultipartRequest multi = null;
	String de_picture = "";
%>
<%
	try {
		// MultipartRequest 객체 생성
		multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

		Enumeration<?> files = multi.getFileNames();
		String filename = (String) files.nextElement();
		de_picture = multi.getFilesystemName(filename);

		// File 객체 추출 가능
		File file = multi.getFile(de_picture);		
		if (file != null) {
			// 이미지 파일 다루기
			BufferedImage bi = ImageIO.read(file);
			if (bi != null) {
				int width = bi.getWidth();
				int height = bi.getHeight();
				out.println("이미지 파일 WxH: " + width + " x " + height + "<br>");
			} else {
				out.println("이미지 파일이 아닙니다<br>");
			}

		}
	} catch (Exception e) {
		out.println("파일 처리 예외 발생");
	}
String fullpath = saveDirectory + "\\" + de_picture;

%>

<div style="width: 300px">
	<img style="width: 100%; height: auto;"
		src="<%=fullpath%>" />
</div>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("수정을 실패하였습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정되었습니다.");
			location.href = "designer.bbq?sh_uid=1";
		</script>
	</c:otherwise>
</c:choose>












