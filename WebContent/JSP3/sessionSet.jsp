<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Webcontent/JSP3/sessionSet.jsp</h1>
	
	<%
// 		// 세션 생성 - "id - itwill"
 		session.setAttribute("id", "itwill");
		
		
// 		// 다시 원래페이지로 이동(sessionTest.jsp)
// 		response.sendRedirect("sessionTest.jsp");
		// 자바스크립트 또는 자바코드 하나만 써야 한다.
	%>
	
	<script type="text/javascript">
		alert("세션값 생성");
		location.href="sessionTest.jsp";
	
	</script>
</body>
</html>