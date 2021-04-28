<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP4/cookieSet.jsp</h1>

	<h2> 서버 </h2>
	
	<%
	
		// 쿠키 객체 생성 (쿠키 값 생성) - 서블릿API 활용
		
		Cookie cookie = new Cookie("CookName", "cookievalue");
		
		cookie.setMaxAge(600);
	
		response.addCookie(cookie);
	%>
	
	<script type="text/javascript">
		alert(" 쿠키값 생성 ! & 응답객체에 저장 후 전달! ");
		location.href="cookieTest.jsp";
	</script>

</body>
</html>