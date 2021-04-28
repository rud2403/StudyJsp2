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
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int classNum = Integer.parseInt(request.getParameter("classNum"));
		String sex = request.getParameter("sex");
		

	%>

	이름은 <%=name %>입니다. <br>
	나이는 <%=age %>입니다. <br>
	강의장은 <%=classNum %>번 강의장입니다. <br>
	성별은 <%=sex %>입니다. <br>
	취미 :
	<%
		//취미 (동일한 이름의 파라미터를 처리)
		String[] hobArr = request.getParameterValues("hobby");
	
	if (hobArr != null){

		for(int i = 0; i <hobArr.length; i++){
			out.print(hobArr[i]+ ", ");
		}
	}
	%>
	입니다.

</body>
</html>