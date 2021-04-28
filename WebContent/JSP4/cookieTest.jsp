<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP4/cookieTest.jsp</h1>

	쿠키 (p279 ~ )
	<br> 클라이언트 쪽에서 사용(관리)되는 데이터, 생존기간동안 계속해서 유지, 하드디스크에 저장 => 보안위협



	<%
		// 쿠키 값 사용하기 (받아오기)		
		Cookie[] cookies = request.getCookies();

		String name = "";
		String value = "";

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("CookName")) {
					name = cookies[i].getName();
					value = cookies[i].getValue();
				}
			}
		}
	%>

	<hr>
	<h2>쿠키 이름, 쿠키값 : <%=name %>, <%=value %></h2>

	<hr>
	<h2>클라이언트</h2>
	<input type="button" value="쿠키값 생성(저장)"
		onclick="location.href='cookieSet.jsp'">

	<input type="button" value="쿠키값 삭제" onclick="location.href='cookieDel.jsp'">
</body>
</html>