<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/testForm2.jsp</h1>

	<!-- 
		사용자의 이름, 나이를 입력받아서 결과를 출력
		testPro2.jsp 페이지에서 결과를 출력
	 -->
	 
	 <!-- 
	 	form - get방식 : 한글데이터 전달 시 문제없음
	 	form - post방식 : 한글데이터 전달시 문제발생 (인코딩에러)
	 
	  -->
	 
	<form action="testPro2.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age">
		<br><br>
		<button type="submit">제출</button>
	</form>

</body>
</html>