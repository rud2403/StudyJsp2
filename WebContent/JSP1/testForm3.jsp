<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/testForm3.jsp</h1>
	<!-- 이름, 나이, 성별(radio)-2개, 강의장(select)-7개, 취미(checkbox)-3개 -->
	
	
	<form action="testPro3.jsp">
		이름 : <input type="text" name="name"> <br>
		나이 : <input type="text" name="age"> <br>
		성별 : 남<input type="radio" value="남" name="sex"> 여<input type="radio" value="여" name="sex"> <br>
		강의장 : <select name="classNum">
					<option value="1">1번 강의장</option>
					<option value="2">2번 강의장</option>
					<option value="3">3번 강의장</option>
					<option value="4">4번 강의장</option>
					<option value="5">5번 강의장</option>
					<option value="6">6번 강의장</option>
					<option value="7">7번 강의장</option>
				 </select>
		<br>
		취미
		<br>
		 운동<input type="checkbox" value="운동" name="hobby">
 		 영화<input type="checkbox" value="영화"  name="hobby">
 		 낚시<input type="checkbox" value="낚시"  name="hobby">
		 <br><br>
		 <button type="submit">전송</button>
	</form>
	
</body>
</html>