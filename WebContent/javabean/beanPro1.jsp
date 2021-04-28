<%@page import="com.itwillbs.beantest.Javabean1"%>
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
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		
		// 전달된 정보 저장(파라미터)
		String id = request.getParameter("id");
		

		
		// com.itwillbs.beantest 패키지에 javabean1 객체
		// id정보를 저장
		// => 전달된 파라미터를 객체를 사용해서 저장 후 출력
		
		Javabean1 jb = new Javabean1();
		jb.setId(id);
		
		// JSP에서는 [액션태그] 사용해서 자바빈 객체를 활용 할 것이다.
		
	%>
	
	<%--
	자바빈 객체 생성
	<jsp:useBean id="객체명 (레퍼런스명)" class="클래스의 위치" />
	 --%>
	 
	 <% //Javabean1 jbAction = new Javabean1();	 %>

	 <jsp:useBean id="jbAction" class="com.itwillbs.beantest.Javabean1" />
	 
	 <!-- 위 두 코드는 같은 의미 이다. -->
	 
	 <jsp:setProperty property="id" name="jbAction" param="id"/>
	 <!-- property와 param이 같을 땐 param 생략 가능
	  	  request.getParameter(arg0) + jbAction.setId(id)를 같이 사용하는 역할과 같다
	 	  property에 *를 넣으면 
	  -->
	 
	아이디 : <%=id %><br>
	아이디 ( 객체 사용 ) : <%=jb.getId() %><br>
	<jsp:getProperty property="id" name="jbAction"/> <br>
</body>
</html>