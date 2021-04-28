<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

	String name = "itwill";
	String gender = "남";
	int	age = 30;
	String jumin = "900101-1231231";

	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
 	final String DBPW = "1234";
 	
	// 1단계 드라이버 로드
	
	Class.forName(DRIVER);
	
	System.out.println("드라이버가 로드 됐습니다.");
	
	// 2단계 디비 연결
	
	Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	System.out.println("디비 연결 성공 ! " + conn);
	
	System.out.println("디비 연결 완료 SQL쿼리 사용전 준비 상태 ! ");

	
	// 3단계 sql 구문 작성 & statement 객체 생성 (-> preparedstatement 변경 예정)
	
	//String sql = "insert into itwill_member (name, gender, age, jumin) values('"+ name +"', '"+ gender +"', "+ age +", '"+ jumin +"')";
	
	String sql = "insert into itwill_member (name, gender, age, jumin) values(?,?,?,?)";

	// Statement : SQL 구문을 실행하는 객체
	// PreparedStatement : SQL 구문을 실행하는 객체
	// -> 쿼리문을 실행할 준비가 되어있는 상태(처리속도  우수, 보안상 안전)
	
	
	// Statement stmt = conn.createStatement(); 
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// ? 채우기
	// XXXXX는 컬럼의 데이터 타입에 따라서 변경
	// pstmt.setXXXXXX(?의 위치, 저장할 값);
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setInt(3, age);
	pstmt.setString(4, jumin);
	
	// 4단계 SQL 구문을 실행
	// stmt.executeUpdate(sql);
	
	// pstmt.executeUpdate();
	// => insert, update, delete 구문을 쓸 때 사용
			
	// pstmt.executeQuery();
	// => select 구문을 쓸 때 사용
	
	pstmt.executeUpdate();
	
	System.out.println("디비 정보 저장완료!");
	
	
%>

</body>
</html>