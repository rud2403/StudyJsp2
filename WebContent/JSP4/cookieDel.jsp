<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP4/cookieDel.jsp</h1>
	
	<h2> 서버 (쿠키삭제) </h2>

<%
	// 쿠키 값 삭제
	// 쿠키 값 가져오기
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i =0; i < cookies.length; i++){
			if(cookies[i].getName().equals("CookName")){
				cookies[0].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}

%>


<script type="text/javascript">
	alert("쿠키값 삭제 !");
	location.href="cookieTest.jsp";
</script>

</body>
</html>