<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
		// 쿠키 객체 생성 (쿠키 값 생성) - 서블릿API 활용
		String lang = request.getParameter("language");
		
		Cookie cookie = new Cookie("lang", request.getParameter("language"));
		
		cookie.setMaxAge(3600);
	
		response.addCookie(cookie);
		
		%>
		
		<script type="text/javascript">
			alert(" 언어 쿠키값 생성! ");
			location.href="cookieForm.jsp";
		</script>

</body>
</html>