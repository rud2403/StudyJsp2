<%@page import="java.sql.Timestamp"%>
<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/insertPro.jsp</h1>
	<%
		// 회원가입 정보를 전달 받아서 저장 -> DB저장 (회원)
		
		request.setCharacterEncoding("utf-8");
		
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean" />

		
	<jsp:setProperty property="*" name="mb"/>
	
	
		<%
		//System.out.println("객체 정보 :  " + mb);
		// 추가적인 회원가입 날짜 저장
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
	 	final String DBPW = "1234";


	 	Class.forName(DRIVER);
	 	
	 	Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
	 	
	 	String sql = "insert into itwill_member values(?, ?, ?, ?, ?, ?, ?)";
	 	
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	
	 	pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setInt(4, mb.getAge());
		pstmt.setString(5, mb.getGender());
		pstmt.setString(6, mb.getEmail());
		pstmt.setTimestamp(7, mb.getRegdate());

		pstmt.executeUpdate();
		
	 	 %>
	 	 		// 로그인 페이지로 이동
	 	 
	 	 <script type="text/javascript">
	 	 	alert(" 회원가입 성공 ! ");
	 	 	location.href="main.jsp";
	 	 </script>
		
		
		

	
	
</body>
</html>