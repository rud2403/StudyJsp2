<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/JSP/test2.html</h1>

	<%
		// 스크립틀릿 작성 - java코드
		// 문자열 배열 - 4칸
		// "java", "jsp", "web", "DB"
		
		String[] stArray = new String[4];
		
		stArray[0] = "java";	
		stArray[1] = "jsp";	
		stArray[2] = "web";	
		stArray[3] = "DB";	
		
		String[] stArr2 = {"java", "jsp", "web", "DB"};

		
		for(int i = 0; i < stArray.length; i++){
			System.out.println(stArray[i]);
		}
		
		
		// 확장 for / for-each
		for(String s : stArray){
			System.out.println(s);
		}

		// 화면에 출력 -> out.print(), out.println() 사용
		// html 코드로 작성 (줄 바꿀 때 <br>태그 사용)
		// out.print(" html 코드 작성 ")
		for(int i = 0; i < stArray.length; i++){
			out.println("stArray[" + i + "] : " + stArray[i] + "<br>");
		} 
	
		
		// 표현식 사용해서 화면출력
		
		for(int i = 0; i < stArray.length; i++){
			%>
			<!-- HTML -->
			<!-- jsp 표현식은 html 코드에 작성 -->
			
			<hr>
			stArray[<%=i %>] : <%= stArray[i] %>
			
			<!-- HTML 코드 영역 끝 -->
			
			<%
		}
			
	%>
	
	<hr>
	
	<h3> 테이블 생성 </h3>
	 <!-- 번호 1 ~ 4, 과목이름, 과목내용(과목이름 + 번호)
	 	  java코드 : strArr 배열의 요소를 html 테이블에 출력
	  -->
	  
	<table border="1">
		<tr>
			<td>번호</td>
			<td>과목이름</td>
			<td>과목내용</td>
		</tr>
		<% 
		for(int i = 0; i < stArray.length; i++){
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=stArray[i] %></td>
			<td> <%=stArray[i]+i %></td>
		</tr>
		<%
		}
		%>
		
		
		
	</table>
</body>
</html>