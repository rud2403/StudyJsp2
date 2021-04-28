<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col3%>">

	<h1>WebContent/JSP2/includeTset.jsp</h1>
	
	<h2>
		include 기술을 사용하여 중복된 페이지를 줄임<br>
		1) {%@ include %} (JSP 지시어)
		컴파일 되기전에 소스코드를 결합 후 컴파일 (1개의 파일로 생성)<br>
			=> 페이지에서 사용될 공통의 값(변수)
		
		
		2) {jsp:include page=""}{/jsp:include} (JSP 액션태그) <br>
		액션태그 : 태그를 사용해서 다른 동작(JSP)을 실행가능한 코드의 형태<br>
		각각의 파일을 컴파일 후 해당 코드에 추가 (여러개의 파일이 추가된 1개의 파일)<br>
			=> 특정 페이지를 해당 페이지에 추가할 때 사용<br>
		
		
	</h2>
	
	
	<table border="1" width="600" height="600">
		<tr>
			<td colspan="2" height="100">
			<!-- 인클루드 페이지에 정보 전달 가능 -->
				<jsp:include page="top.jsp">
					<jsp:param value="itwill" name="id"/>
				</jsp:include>
			</td>			
		</tr>
		<tr>
			<td>
				<jsp:include page="left.jsp"></jsp:include>
			</td>		
			<td width="400">

				<img alt="" src="3.jpg" width="400" height="400">
				
			</td>			
		</tr>		
		
		<tr>
			<td colspan="2" height="100">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>			
		</tr>		
	</table>
</body>
</html>