<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/testPro2.jsp</h1>


<%
	//한글 처리 (인코딩 복구)
	request.setCharacterEncoding("UTF-8");
	//post방식 한글 전달했을때 한글 깨짐 해결방법

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
%>

	<hr>



	사용자의 이름은 : <%=name %>  입니다.<br>	
	사용자의 나이는 : <%=age %>  입니다.	
	
	<hr>
	
	<%
if(age >= 20){
	out.println("수업참여 가능 </h3>");
}else{
	out.print("수업참여 불가");
}

%>
	
	<h2> 회원정보 확인 </h2>
	<h3> 회원의 나이가 20살 미만이면 "수업 참여 불가"<br>
		 회원의 나이가 20살 이상이면 "수업 참여 가능"
	
	</h3>

</body>
</html>