<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/test1.jsp</h1>
	
	<h2> JSP 기본요소 </h2>
	<h3>1. 주석문</h3>
	<h3>2. JSP 지시어</h3>
	<h3>3. 스크립트 요소</h3>
	<h3>4. 액션태그</h3>
	
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	<script type="text/javascript">
		// JS 주석
		/* JS 주석2 */
	
	</script>
	
	<% 
	// java 주석
	/* java 주석2 */
	/** java 주석3 **/
	%>
	
	<%
		// JSP 지시어(Directive) (p150 ~)
		// < %@ page ~ % > ( = )
		// < %@ include ~ % > ( = 액션 태그)
		//< %@ taglib ~ % > ( = 태그를 새롭게 추가할 때 사용)
		// => 해당 파일에서 JSP코드를 실행 시 어떤 방식으로 실행할지 설명
		
		// MIME 타입
		//
		
		// 3. 스크립트요소 (p160 ~)
		// => JSP 코드안에 java코드를 사용가능
		// 3-1. 선언문 (Declaration) : 멤버 변수, 멤버 메소드 선언
		// 3-2. 스크립틀릿(Seriptlet)
		// 3-3. 표현식 (Expression)
	%>
	
	<h3> JSP - 선언문 </h3>
	<%!
	  // 선언문 : 멤버 변수, 멤버 메소드 선언 => jsp 페이지 어디서든 사용가능한 변수, 메소드
	  String name = "홍길동";
	  public void method(){
		  System.out.println("출력");
	  }
	
	  // public void method1(); 메소드 선언은 가능하지만, 메소드 호출은 불가능 하다.
	%>
	
	<%! 
	 int age = 20; // 멤버변수
	// <%!  % > 여기서 변수 선언하면 멤버변수
	%>
	
	
	<h3> jsp - 스크립틀릿 </h3>
	<%
	  // java 코드를 작성
	  int num = 30; // 지역변수
	  // <%  % > 여기서 변수 선언하면 지역변수
	  method(); // 메소드 호출 가능
	  //메소드 선언은 불가
	%>
	
	<h3> jsp - 표현식 </h3>
	<!-- 내가 선언한 동작(메소드의 리턴, 변수, 리터럴 값)을 사용할 때 사용 
		 = java 코드를 html 화면에 출력할 때
	-->
	<%=1000 %>
	<%=num %>
</body>
</html>