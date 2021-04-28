<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>WebContent/JSP3/sessionTest.jsp</h1>

	<%
		// p270 ~
		// http 프로토콜을 사용하여 통신시
		// 페이지 요청 (request), 요청에 대한 응답(response)를 완료하고나면
		// 서버와 클라이언트의 연결은 종료된다.
		// 때문에 서버와 클라이언트의 상태를 연결하기 위해서 세션과 쿠키를 사용한다.
		
		
	%>

	*컨테이너란 생성, 삭제 등을 모두 수행하는 것.
	<h2> 세션(Session) : 웹 서버의 컨테이너 정보(상태)를 유지하기 위한 정보 <br>
	 - 웹 브라우저당 1개씩 설정 <br>
	 - 서버쪽에서 관리 => 보안상 안전
	 </h2>
	 
	 - 세션 정보 저장<br>
	   session.setAttribute("세션 값 이름", "세션 데이터 값");<br>
	 - 세션 정보 사용<br>
	   session.getAttribute("세션 값 이름")
	 - 세션 정보 삭제(속성 삭제)<br>
	   session.removeAttribute("세션 값 이름");<br>
	 - 세션 정보 초기화<br>
	   session.invalidate();<br>
	   
	   <hr><hr>
	   
	   <!-- 세션값이 있을때는 세션값을 출력,
	   		세션값이 없을때는 "세션값 없음!" 출력
	    -->
	   
	   
	    
	   	<%
		   if(session.getAttribute("id") == null){
		%>   세션값 없음 !<br>
		   <%}else{%>
		 <h2>세션 값 : <%=session.getAttribute("id") %></h2>
			   
		 <%}%>
	  
	  	<%
	  		String id = (String)session.getAttribute("id");
	  	
	  		if(id == null){
	  			id = " 세션값 없음 !";
	  		}
	  	%>
	   
	   <hr>
	   <h2>세션값 : <%=id %></h2>
	    
	   
		

	   
	   <input type="button" value="세션값 생성(저장)" onclick="location.href='sessionSet.jsp'"> <br>
	   
	   <input type="button" value="세션값 삭제" onclick="location.href='sessionDel.jsp'"> <br>
	   
	   <input type="button" value="세션값 초기화" onclick="location.href='sessionInv.jsp'"> <br>
	   
</body>
</html>