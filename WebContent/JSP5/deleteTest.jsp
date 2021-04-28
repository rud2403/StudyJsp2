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

	<%
	
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	// idx 10번 삭제
	
	
	
	// 1 드라이버 로드
	Class.forName(DRIVER);
	// 2 디비 연결
	Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
	// 3 sql작성 & pstmt 객체 생성
	String sql = "delete from itwill_member where idx = ?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//	? 추가
	pstmt.setInt(1, 10);
	
		
	//	(sql - delete 구문, 특정 사람만 삭제(10))
	
	// 4 sql 실행
	pstmt.executeUpdate();

	%>

</body>
</html>