<%@page import="java.sql.ResultSet"%>
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
	
	// 디비에 저장된 모든 회원의 정보를 출력(콘솔창, 화면)
	
	//1 드라이브 로드
	Class.forName(DRIVER);
	
	//2 디비 연결
	Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	//3 sql 작성 & pstmt 객체 생성
	String sql = "select * from itwill_member";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 4 sql 구문 실행
	// select문의 결과 (레코드셋 형태의 데이터)를 저장하는 객체
	ResultSet rs = pstmt.executeQuery();
	
	// 5 데이터 처리
	while(rs.next()) { // 레코드셋의 데이터가 있으면 true 없으면 false를 리턴하는 메소드
		//데이터가 있다.
		
		// rs.getXXXX("컬럼명");
		// -> 가져오는 컬럼의 데이터타입에 따라서 변경
		// -> rs 객체의 커서가 가르키고 있는 한 줄의 데이터 중에서 찾아오는 메소드
		// rs.getString(컬럼인덱스번호);
		
		// -> 인덱스 번호를 사용하는 방법이 훨씬 처리속도가 빠르다.
		
		// String name = rs.getString("name");
		int idx = rs.getInt(1);
		String name = rs.getString(2);
		String gender = rs.getString(3);
		int age = rs.getInt(4);
		String jumin = rs.getString(5);
		
		out.println("사용자 인덱스 " + idx + ", 사용자 이름 : " + name + ", 사용자 성별 : " + gender + ", 사용자 나이 : " + age + ", 사용자 주민 : " + jumin+  "<br>");
	}
	
	
	%>
	
	
</body>
</html>