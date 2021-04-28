<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP2/scopePro.jsp</h1>

	<h2> 전달된 파라미터값을 저장 후 출력 </h2>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

	%>
	
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>	
	<h2> 영역객체의 값을 출력 </h2>
	<%
		// 해당 영역의 데이터를 저장 -> 해당 영역에서 데이터를 공유하여 사용가능
		// 영역객체.setAttribute("이름", 값);
	
		// 영역데이터 사용
		// 영역객체.getAttribute("이름");
		
		pageContext.setAttribute("page", "page 영역 객체 정보 !");
		pageContext.setAttribute("page1", "page1 영역 객체 정보 !");
		request.setAttribute("req", "request 객체정보(itwill)");
		session.setAttribute("ses", "session 객체정보(itwill)");
		application.setAttribute("app", "application 객체정보(itwill)");
		
	%>
	
	pageContext 내장객체 공유데이터(속성) : <%=pageContext.getAttribute("page1") %> <br>
	request 내장객체 공유데이터(속성) : <%=request.getAttribute("req") %><br>
	session 내장객체 공유데이터(속성) : <%=session.getAttribute("ses") %><br>
	application 내장객체 공유데이터(속성) : <%=application.getAttribute("app") %><br>

	<hr><hr>
	
	<h2> 페이지 이동 시 사용가능한 데이터</h2>
	
	1. a 태그 사용 <br>
	파라미터값 전달 가능 +
	영역객체 : session, application정보만 사용가능
	<a href="scopePro2.jsp?id=<%=id%>&pw=1234">scopePro2.jsp 페이지 이동</a>

	<hr>
	
	2. javascript 사용 <br>
	<script type="text/javascript">
		//alert('scopePro2.jsp 페이지로 이동');
		//location.href="scopePro2.jsp?id=<%=id%>&pw=1234";
	</script>
	
	3. JSP 사용 <br>
	
	<%
		System.out.println("scopePro.jsp 페이지 실행! ");
		//response.sendRedirect("scopePro2.jsp?id=" + id + "&pw=123456");
		// "scopePro2.jsp?id=" + "admin"
	%>
	
	4. JSP 액션태그 사용(forward방식 이동)
	포워딩 방식 이동 : 페이지 이동시 request, response 포함해서 이동하는 방식<br>
					A		->		B <br>
	페이지 주소 :   A				  (주소는 그대로고)<br>
	페이지 화면 :   B				  (화면만 바뀐다)<br>
	 => 페이지 주소 변경 X, 페이지 화면 변경 O, request, response 가지고 이동
	
	파라메터 전달 가능
	영역객체 : request, session, application 정보만 사용 가능<br>
	
	
	<jsp:forward page="scopePro2.jsp">
	<jsp:param value="1231231" name="pw"/>
	</jsp:forward>
	
	<jsp:forward page="scopePro2.jsp?pw=1234"></jsp:forward>
</body>
</html>